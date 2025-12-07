CREATE TABLE [dbo].[Comida] (
    [ComidaID]   INT            IDENTITY (1, 1) NOT NULL,
    [TipoComida] VARCHAR (250)  NOT NULL,
    [Cantidad]   DECIMAL (9, 2) NULL,
    [Unidad]     VARCHAR (20)   NULL,
    [Frecuencia] VARCHAR (100)  NULL,
    [Calorias]   INT            NULL,
    [CreatedAt]  DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]  INT            NULL,
    PRIMARY KEY CLUSTERED ([ComidaID] ASC),
    CONSTRAINT [CK_Comida_Calorias] CHECK ([Calorias]>=(0) OR [Calorias] IS NULL),
    CONSTRAINT [CK_Comida_Cantidad] CHECK ([Cantidad]>(0) OR [Cantidad] IS NULL)
);


GO

/* TRIGGER: Comida (AFTER INSERT/UPDATE/DELETE) */
CREATE TRIGGER dbo.trg_Audit_Comida_AIU
ON dbo.Comida
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT 1 FROM inserted) AND NOT EXISTS(SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Comida',
            i.ComidaID,
            'CREATE',
            i.CreatedBy,
            SYSUTCDATETIME(),
            (SELECT i.ComidaID, i.TipoComida, i.Cantidad, i.Unidad FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM inserted i;
    END

    IF EXISTS(SELECT 1 FROM deleted) AND NOT EXISTS(SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Comida',
            d.ComidaID,
            'DELETE',
            NULL,
            SYSUTCDATETIME(),
            (SELECT d.ComidaID, d.TipoComida FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM deleted d;
    END

    IF EXISTS(SELECT 1 FROM inserted) AND EXISTS(SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Comida',
            i.ComidaID,
            'UPDATE',
            i.CreatedBy,
            SYSUTCDATETIME(),
            (SELECT d.ComidaID AS Before_ComidaID, d.TipoComida AS Before_TipoComida, i.ComidaID AS After_ComidaID, i.TipoComida AS After_TipoComida FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM inserted i
        JOIN deleted d ON i.ComidaID = d.ComidaID;
    END
END;