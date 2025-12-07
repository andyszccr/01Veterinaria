CREATE TABLE [dbo].[Tratamiento_Medicine] (
    [TreatmentID] INT           NOT NULL,
    [MedicineID]  INT           NOT NULL,
    [Dosis]       VARCHAR (200) NULL,
    [Frecuencia]  VARCHAR (100) NULL,
    [Duracion]    VARCHAR (100) NULL,
    CONSTRAINT [PK_Tratamiento_Medicine] PRIMARY KEY CLUSTERED ([TreatmentID] ASC, [MedicineID] ASC),
    CONSTRAINT [FK_TrMed_Medicine] FOREIGN KEY ([MedicineID]) REFERENCES [dbo].[Medicine] ([MedicineID]),
    CONSTRAINT [FK_TrMed_Treatment] FOREIGN KEY ([TreatmentID]) REFERENCES [dbo].[Treatment] ([TreatmentID])
);

