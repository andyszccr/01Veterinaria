CREATE TABLE [dbo].[Tratamiento_Vacuna] (
    [TreatmentID] INT NOT NULL,
    [VacunaID]    INT NOT NULL,
    CONSTRAINT [PK_Tratamiento_Vacuna] PRIMARY KEY CLUSTERED ([TreatmentID] ASC, [VacunaID] ASC),
    CONSTRAINT [FK_TrVac_Treatment] FOREIGN KEY ([TreatmentID]) REFERENCES [dbo].[Treatment] ([TreatmentID]),
    CONSTRAINT [FK_TrVac_Vacuna] FOREIGN KEY ([VacunaID]) REFERENCES [dbo].[Vacuna] ([VacunaID])
);

