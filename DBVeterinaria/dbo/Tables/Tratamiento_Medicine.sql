CREATE TABLE [dbo].[Tratamiento_Medicine] (
    [TreatmentID] INT           NOT NULL,
    [MedicineID]  INT           NOT NULL,
    [Dosis]       VARCHAR (200) NULL,
    [Frecuencia]  VARCHAR (100) NULL,
    [Duracion]    VARCHAR (100) NULL,
    [ModifiedAt]  DATETIME2 (7) CONSTRAINT [DF_Tratamiento_Medicine_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Tratamiento_Medicine] PRIMARY KEY CLUSTERED ([TreatmentID] ASC, [MedicineID] ASC),
    CONSTRAINT [FK_TrMed_Medicine] FOREIGN KEY ([MedicineID]) REFERENCES [dbo].[Medicine] ([MedicineID]),
    CONSTRAINT [FK_TrMed_Treatment] FOREIGN KEY ([TreatmentID]) REFERENCES [dbo].[Treatment] ([TreatmentID])
);


GO

CREATE TRIGGER [dbo].[trg_Tratamiento_Medicine_BusinessRules]
ON [dbo].[Tratamiento_Medicine]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM [dbo].[Tratamiento_Medicine] t
    JOIN inserted i
        ON t.[TreatmentID] = i.[TreatmentID];

END;