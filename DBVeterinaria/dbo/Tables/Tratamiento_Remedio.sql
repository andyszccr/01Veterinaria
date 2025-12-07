CREATE TABLE [dbo].[Tratamiento_Remedio] (
    [TreatmentID] INT NOT NULL,
    [RemedioID]   INT NOT NULL,
    CONSTRAINT [PK_Tratamiento_Remedio] PRIMARY KEY CLUSTERED ([TreatmentID] ASC, [RemedioID] ASC),
    CONSTRAINT [FK_TrRem_Remedio] FOREIGN KEY ([RemedioID]) REFERENCES [dbo].[Remedio] ([RemedioID]),
    CONSTRAINT [FK_TrRem_Treatment] FOREIGN KEY ([TreatmentID]) REFERENCES [dbo].[Treatment] ([TreatmentID])
);

