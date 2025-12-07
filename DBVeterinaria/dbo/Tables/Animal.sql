CREATE TABLE [dbo].[Animal] (
    [AnimalID]        INT            IDENTITY (1, 1) NOT NULL,
    [AnimalCode]      VARCHAR (50)   NOT NULL,
    [AnimalName]      VARCHAR (250)  NOT NULL,
    [FechaNacimiento] DATE           NULL,
    [Edad]            INT            NULL,
    [Peso]            DECIMAL (7, 2) NULL,
    [Sexo]            CHAR (1)       NULL,
    [Estado]          VARCHAR (50)   NULL,
    [AnimalStatus]    BIT            DEFAULT ((1)) NOT NULL,
    [ClasificacionID] INT            NOT NULL,
    [CreatedAt]       DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]       INT            NULL,
    [ModifiedAt]      DATETIME2 (7)  NULL,
    [ModifiedBy]      INT            NULL,
    PRIMARY KEY CLUSTERED ([AnimalID] ASC),
    CONSTRAINT [CK_Animal_Edad] CHECK ([Edad]>=(0) OR [Edad] IS NULL),
    CONSTRAINT [CK_Animal_Estado] CHECK ([Estado]='Control' OR [Estado]='Riesgo' OR [Estado]='Enfermo' OR [Estado]='Inactivo' OR [Estado]='Activo' OR [Estado] IS NULL),
    CONSTRAINT [CK_Animal_Peso] CHECK ([Peso]>(0) OR [Peso] IS NULL),
    CONSTRAINT [CK_Animal_Sexo] CHECK ([Sexo]='I' OR [Sexo]='H' OR [Sexo]='M' OR [Sexo] IS NULL),
    CONSTRAINT [CK_AnimalStatus] CHECK ([AnimalStatus]=(1) OR [AnimalStatus]=(0)),
    CONSTRAINT [FK_Animal_Clasificacion] FOREIGN KEY ([ClasificacionID]) REFERENCES [dbo].[Clasificacion] ([ClasificacionID]),
    UNIQUE NONCLUSTERED ([AnimalCode] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Animal_Clasificacion]
    ON [dbo].[Animal]([ClasificacionID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Animal_AnimalCode]
    ON [dbo].[Animal]([AnimalCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Animal_Estado]
    ON [dbo].[Animal]([Estado] ASC);


GO

/* TRIGGER: Animal (AFTER INSERT/UPDATE/DELETE) */
CREATE TRIGGER dbo.trg_Audit_Animal_AIU
ON dbo.Animal
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT 1 FROM inserted) AND NOT EXISTS(SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Animal',
            i.AnimalID,
            'CREATE',
            i.CreatedBy,
            SYSUTCDATETIME(),
            (SELECT i.AnimalID, i.AnimalCode, i.AnimalName, i.Edad, i.Peso, i.Sexo, i.Estado FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM inserted i;
    END

    IF EXISTS(SELECT 1 FROM deleted) AND NOT EXISTS(SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Animal',
            d.AnimalID,
            'DELETE',
            NULL,
            SYSUTCDATETIME(),
            (SELECT d.AnimalID, d.AnimalCode, d.AnimalName FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM deleted d;
    END

    IF EXISTS(SELECT 1 FROM inserted) AND EXISTS(SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Animal',
            i.AnimalID,
            'UPDATE',
            i.ModifiedBy,
            SYSUTCDATETIME(),
            (SELECT d.AnimalID AS Before_AnimalID, d.AnimalCode AS Before_AnimalCode, d.AnimalName AS Before_AnimalName,
                    i.AnimalID AS After_AnimalID, i.AnimalCode AS After_AnimalCode, i.AnimalName AS After_AnimalName
             FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM inserted i
        JOIN deleted d ON i.AnimalID = d.AnimalID;
    END
END;