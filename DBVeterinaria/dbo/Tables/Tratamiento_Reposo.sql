CREATE TABLE [dbo].[Tratamiento_Reposo] (
    [TreatmentID] INT           NOT NULL,
    [ReposoID]    INT           NOT NULL,
    [ModifiedAt]  DATETIME2 (7) CONSTRAINT [DF_Tratamiento_Reposo_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Tratamiento_Reposo] PRIMARY KEY CLUSTERED ([TreatmentID] ASC, [ReposoID] ASC),
    CONSTRAINT [FK_TrRep_Reposo] FOREIGN KEY ([ReposoID]) REFERENCES [dbo].[Reposo] ([ReposoID]),
    CONSTRAINT [FK_TrRep_Treatment] FOREIGN KEY ([TreatmentID]) REFERENCES [dbo].[Treatment] ([TreatmentID])
);


GO

CREATE TRIGGER [dbo].[trg_Tratamiento_Reposo_BusinessRules]
ON [dbo].[Tratamiento_Reposo]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM [dbo].[Tratamiento_Reposo] t
    JOIN inserted i
        ON t.[TreatmentID] = i.[TreatmentID];

END;