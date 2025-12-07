CREATE TABLE [dbo].[Tratamiento_Reposo] (
    [TreatmentID] INT NOT NULL,
    [ReposoID]    INT NOT NULL,
    CONSTRAINT [PK_Tratamiento_Reposo] PRIMARY KEY CLUSTERED ([TreatmentID] ASC, [ReposoID] ASC),
    CONSTRAINT [FK_TrRep_Reposo] FOREIGN KEY ([ReposoID]) REFERENCES [dbo].[Reposo] ([ReposoID]),
    CONSTRAINT [FK_TrRep_Treatment] FOREIGN KEY ([TreatmentID]) REFERENCES [dbo].[Treatment] ([TreatmentID])
);

