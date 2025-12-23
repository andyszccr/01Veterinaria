CREATE TABLE [dbo].[Usuarios] (
    [UserID]       INT           IDENTITY (1, 1) NOT NULL,
    [UserCode]     VARCHAR (50)  NOT NULL,
    [UserName]     VARCHAR (150) NOT NULL,
    [UserLastName] VARCHAR (150) NOT NULL,
    [UserEmail]    VARCHAR (255) NOT NULL,
    [UserPhone]    VARCHAR (50)  NULL,
    [UserAddress]  VARCHAR (300) NULL,
    [UserStatus]   BIT           DEFAULT ((1)) NOT NULL,
    [RoleID]       INT           NOT NULL,
    [ProvinceID]   INT           NOT NULL,
    [CreatedAt]    DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]    INT           NULL,
    [ModifiedAt]   DATETIME2 (7) NULL,
    [ModifiedBy]   INT           NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC),
    CONSTRAINT [CK_Usuarios_Email] CHECK ([UserEmail] like '%@%._%' OR [UserEmail] like '%@%.%'),
    CONSTRAINT [CK_Usuarios_Status] CHECK ([UserStatus]=(1) OR [UserStatus]=(0)),
    CONSTRAINT [FK_Usuarios_Provinces] FOREIGN KEY ([ProvinceID]) REFERENCES [dbo].[Provinces] ([ProvinceID]),
    CONSTRAINT [FK_Usuarios_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID]),
    UNIQUE NONCLUSTERED ([UserCode] ASC)
);




GO

/* =========================
   11) TRIGGERS DE AUDITORÍA (INSERT/UPDATE/DELETE)
   - Registran en Actividad las operaciones sobre tablas clave.
   - Para UPDATE guardan JSON básico con previo y nuevo (no exhaustivo).
   - Requieren que la APP pase ModifiedBy/CreatedBy en la operación para saber el usuario.
   ========================= */

/* Helper: función para convertir row to JSON (usar FOR JSON) - no es necesario crear UDF; usare SELECT FOR JSON PATH en triggers */

/* TRIGGER: Usuarios (AFTER INSERT, UPDATE, DELETE) */
CREATE TRIGGER dbo.trg_Audit_Usuarios_AIU
ON dbo.Usuarios
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT operations
    IF EXISTS(SELECT 1 FROM inserted) AND NOT EXISTS(SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Usuarios',
            i.UserID,
            'CREATE',
            i.CreatedBy,
            SYSUTCDATETIME(),
            (SELECT i.UserID, i.UserCode, i.UserName, i.UserLastName, i.UserEmail FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM inserted i;
    END

    -- DELETE operations
    IF EXISTS(SELECT 1 FROM deleted) AND NOT EXISTS(SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Usuarios',
            d.UserID,
            'DELETE',
            NULL, -- no siempre disponemos del user id que lo hizo; la app puede insertar en Actividad por separado si necesario
            SYSUTCDATETIME(),
            (SELECT d.UserID, d.UserCode, d.UserName, d.UserLastName, d.UserEmail FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM deleted d;
    END

    -- UPDATE operations
    IF EXISTS(SELECT 1 FROM inserted) AND EXISTS(SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Usuarios',
            i.UserID,
            'UPDATE',
            i.ModifiedBy,
            SYSUTCDATETIME(),
            (SELECT d.UserID AS Before_UserID, d.UserCode AS Before_UserCode, d.UserName AS Before_UserName,
                    i.UserID AS After_UserID, i.UserCode AS After_UserCode, i.UserName AS After_UserName
             FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM inserted i
        JOIN deleted d ON i.UserID = d.UserID;
    END
END;
GO

CREATE TRIGGER [dbo].[trg_Usuarios_BusinessRules]
ON [dbo].[Usuarios]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM [dbo].[Usuarios] t
    JOIN inserted i
        ON t.[UserID] = i.[UserID];

END;