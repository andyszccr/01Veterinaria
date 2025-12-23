CREATE TABLE [dbo].[Habitat] (
    [HabitatID]      INT            IDENTITY (1, 1) NOT NULL,
    [HabitatName]    VARCHAR (150)  NOT NULL,
    [Description]    VARCHAR (500)  NULL,
    [TemperaturaMin] DECIMAL (5, 2) NULL,
    [TemperaturaMax] DECIMAL (5, 2) NULL,
    [HumedadMin]     INT            NULL,
    [HumedadMax]     INT            NULL,
    [CreatedAt]      DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]      INT            NULL,
    [ModifiedAt]     DATETIME2 (7)  CONSTRAINT [DF_Habitat_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([HabitatID] ASC),
    CONSTRAINT [CK_Habitat_Humedad] CHECK ([HumedadMin] IS NULL AND [HumedadMax] IS NULL OR [HumedadMin]>=(0) AND [HumedadMin]<=(100) AND ([HumedadMax]>=(0) AND [HumedadMax]<=(100)) AND [HumedadMin]<=[HumedadMax]),
    CONSTRAINT [CK_Habitat_Temp] CHECK ([TemperaturaMin] IS NULL AND [TemperaturaMax] IS NULL OR [TemperaturaMin]>=(-100) AND [TemperaturaMax]<=(100) AND [TemperaturaMin]<=[TemperaturaMax])
);


GO

            CREATE TRIGGER dbo.[trg_Habitat_BusinessRules]
            ON dbo.[Habitat]
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
                    WHERE object_id = OBJECT_ID('dbo.Habitat')
                      AND name LIKE '%Code%'
                )
                BEGIN
                    DECLARE @col SYSNAME;

                    SELECT TOP 1 @col = name
                    FROM sys.columns
                    WHERE object_id = OBJECT_ID('dbo.Habitat')
                      AND name LIKE '%Code%';

                    EXEC('
                        UPDATE t
                        SET ' + @col + ' = UPPER(LTRIM(RTRIM(i.' + @col + ')))
                        FROM dbo.Habitat t
                        JOIN inserted i ON t.HabitatID = i.HabitatID
                    ');
                END

                /* =======================
                   MARCA DE MODIFICACIÓN
                   ======================= */
                IF COL_LENGTH('Habitat','ModifiedAt') IS NOT NULL
                BEGIN
                    UPDATE t
                    SET ModifiedAt = SYSUTCDATETIME()
                    FROM dbo.Habitat t
                    JOIN inserted i ON t.HabitatID = i.HabitatID;
                END

            END;