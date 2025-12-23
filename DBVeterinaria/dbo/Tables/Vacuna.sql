CREATE TABLE [dbo].[Vacuna] (
    [VacunaID]   INT           IDENTITY (1, 1) NOT NULL,
    [TipoVacuna] VARCHAR (250) NOT NULL,
    [CreatedAt]  DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]  INT           NULL,
    [ModifiedAt] DATETIME2 (7) CONSTRAINT [DF_Vacuna_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([VacunaID] ASC)
);


GO

            CREATE TRIGGER dbo.[trg_Vacuna_BusinessRules]
            ON dbo.[Vacuna]
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
                    WHERE object_id = OBJECT_ID('dbo.Vacuna')
                      AND name LIKE '%Code%'
                )
                BEGIN
                    DECLARE @col SYSNAME;

                    SELECT TOP 1 @col = name
                    FROM sys.columns
                    WHERE object_id = OBJECT_ID('dbo.Vacuna')
                      AND name LIKE '%Code%';

                    EXEC('
                        UPDATE t
                        SET ' + @col + ' = UPPER(LTRIM(RTRIM(i.' + @col + ')))
                        FROM dbo.Vacuna t
                        JOIN inserted i ON t.VacunaID = i.VacunaID
                    ');
                END

                /* =======================
                   MARCA DE MODIFICACIÓN
                   ======================= */
                IF COL_LENGTH('Vacuna','ModifiedAt') IS NOT NULL
                BEGIN
                    UPDATE t
                    SET ModifiedAt = SYSUTCDATETIME()
                    FROM dbo.Vacuna t
                    JOIN inserted i ON t.VacunaID = i.VacunaID;
                END

            END;