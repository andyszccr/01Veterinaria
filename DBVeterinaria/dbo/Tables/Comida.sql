CREATE TABLE [dbo].[Comida] (
    [ComidaID]   INT            IDENTITY (1, 1) NOT NULL,
    [TipoComida] VARCHAR (250)  NOT NULL,
    [Cantidad]   DECIMAL (9, 2) NULL,
    [Unidad]     VARCHAR (20)   NULL,
    [Frecuencia] VARCHAR (100)  NULL,
    [Calorias]   INT            NULL,
    [CreatedAt]  DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]  INT            NULL,
    [ModifiedAt] DATETIME2 (7)  CONSTRAINT [DF_Comida_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
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
GO

            CREATE TRIGGER dbo.[trg_Comida_BusinessRules]
            ON dbo.[Comida]
            AFTER INSERT, UPDATE
            AS
            BEGIN
                SET NOCOUNT ON;

                /* =======================
                   NORMALIZACIÓN COMÚN
                   ======================= */

                -- Normalizar columnas tipo Code
                IF EXISTS (
                    SELECT 1
                    FROM sys.columns
                    WHERE object_id = OBJECT_ID('dbo.Comida')
                      AND name LIKE '%Code%'
                )
                BEGIN
                    DECLARE @col SYSNAME;

                    SELECT TOP 1 @col = name
                    FROM sys.columns
                    WHERE object_id = OBJECT_ID('dbo.Comida')
                      AND name LIKE '%Code%';

                    EXEC('
                        UPDATE t
                        SET ' + @col + ' = UPPER(LTRIM(RTRIM(i.' + @col + ')))
                        FROM dbo.Comida t
                        JOIN inserted i ON t.ComidaID = i.ComidaID
                    ');
                END

                /* =======================
                   MARCA DE MODIFICACIÓN
                   ======================= */
                IF COL_LENGTH('Comida','ModifiedAt') IS NOT NULL
                BEGIN
                    UPDATE t
                    SET ModifiedAt = SYSUTCDATETIME()
                    FROM dbo.Comida t
                    JOIN inserted i ON t.ComidaID = i.ComidaID;
                END

            END;