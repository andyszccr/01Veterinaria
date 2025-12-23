CREATE TABLE [dbo].[Medicine] (
    [MedicineID]     INT           IDENTITY (1, 1) NOT NULL,
    [MedicineCode]   VARCHAR (50)  NOT NULL,
    [MedicineName]   VARCHAR (250) NOT NULL,
    [MedicineStatus] BIT           DEFAULT ((1)) NOT NULL,
    [CreatedAt]      DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]      INT           NULL,
    [ModifiedAt]     DATETIME2 (7) CONSTRAINT [DF_Medicine_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([MedicineID] ASC),
    UNIQUE NONCLUSTERED ([MedicineCode] ASC)
);




GO
CREATE NONCLUSTERED INDEX [IX_Medicine_Code]
    ON [dbo].[Medicine]([MedicineCode] ASC);


GO

            CREATE TRIGGER dbo.[trg_Medicine_BusinessRules]
            ON dbo.[Medicine]
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
                    WHERE object_id = OBJECT_ID('dbo.Medicine')
                      AND name LIKE '%Code%'
                )
                BEGIN
                    DECLARE @col SYSNAME;

                    SELECT TOP 1 @col = name
                    FROM sys.columns
                    WHERE object_id = OBJECT_ID('dbo.Medicine')
                      AND name LIKE '%Code%';

                    EXEC('
                        UPDATE t
                        SET ' + @col + ' = UPPER(LTRIM(RTRIM(i.' + @col + ')))
                        FROM dbo.Medicine t
                        JOIN inserted i ON t.MedicineID = i.MedicineID
                    ');
                END

                /* =======================
                   MARCA DE MODIFICACIÓN
                   ======================= */
                IF COL_LENGTH('Medicine','ModifiedAt') IS NOT NULL
                BEGIN
                    UPDATE t
                    SET ModifiedAt = SYSUTCDATETIME()
                    FROM dbo.Medicine t
                    JOIN inserted i ON t.MedicineID = i.MedicineID;
                END

            END;