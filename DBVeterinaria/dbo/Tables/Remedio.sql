CREATE TABLE [dbo].[Remedio] (
    [RemedioID]   INT           IDENTITY (1, 1) NOT NULL,
    [TipoRemedio] VARCHAR (250) NOT NULL,
    [CreatedAt]   DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]   INT           NULL,
    [ModifiedAt]  DATETIME2 (7) CONSTRAINT [DF_Remedio_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([RemedioID] ASC)
);


GO

            CREATE TRIGGER dbo.[trg_Remedio_BusinessRules]
            ON dbo.[Remedio]
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
                    WHERE object_id = OBJECT_ID('dbo.Remedio')
                      AND name LIKE '%Code%'
                )
                BEGIN
                    DECLARE @col SYSNAME;

                    SELECT TOP 1 @col = name
                    FROM sys.columns
                    WHERE object_id = OBJECT_ID('dbo.Remedio')
                      AND name LIKE '%Code%';

                    EXEC('
                        UPDATE t
                        SET ' + @col + ' = UPPER(LTRIM(RTRIM(i.' + @col + ')))
                        FROM dbo.Remedio t
                        JOIN inserted i ON t.RemedioID = i.RemedioID
                    ');
                END

                /* =======================
                   MARCA DE MODIFICACIÓN
                   ======================= */
                IF COL_LENGTH('Remedio','ModifiedAt') IS NOT NULL
                BEGIN
                    UPDATE t
                    SET ModifiedAt = SYSUTCDATETIME()
                    FROM dbo.Remedio t
                    JOIN inserted i ON t.RemedioID = i.RemedioID;
                END

            END;