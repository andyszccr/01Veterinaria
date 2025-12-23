CREATE TABLE [dbo].[Reposo] (
    [ReposoID]   INT           IDENTITY (1, 1) NOT NULL,
    [TipoReposo] VARCHAR (250) NOT NULL,
    [CreatedAt]  DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]  INT           NULL,
    [ModifiedAt] DATETIME2 (7) CONSTRAINT [DF_Reposo_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ReposoID] ASC)
);


GO

            CREATE TRIGGER dbo.[trg_Reposo_BusinessRules]
            ON dbo.[Reposo]
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
                    WHERE object_id = OBJECT_ID('dbo.Reposo')
                      AND name LIKE '%Code%'
                )
                BEGIN
                    DECLARE @col SYSNAME;

                    SELECT TOP 1 @col = name
                    FROM sys.columns
                    WHERE object_id = OBJECT_ID('dbo.Reposo')
                      AND name LIKE '%Code%';

                    EXEC('
                        UPDATE t
                        SET ' + @col + ' = UPPER(LTRIM(RTRIM(i.' + @col + ')))
                        FROM dbo.Reposo t
                        JOIN inserted i ON t.ReposoID = i.ReposoID
                    ');
                END

                /* =======================
                   MARCA DE MODIFICACIÓN
                   ======================= */
                IF COL_LENGTH('Reposo','ModifiedAt') IS NOT NULL
                BEGIN
                    UPDATE t
                    SET ModifiedAt = SYSUTCDATETIME()
                    FROM dbo.Reposo t
                    JOIN inserted i ON t.ReposoID = i.ReposoID;
                END

            END;