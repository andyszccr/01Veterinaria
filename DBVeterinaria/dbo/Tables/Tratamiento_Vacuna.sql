CREATE TABLE [dbo].[Tratamiento_Vacuna] (
    [TreatmentID] INT           NOT NULL,
    [VacunaID]    INT           NOT NULL,
    [ModifiedAt]  DATETIME2 (7) CONSTRAINT [DF_Tratamiento_Vacuna_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Tratamiento_Vacuna] PRIMARY KEY CLUSTERED ([TreatmentID] ASC, [VacunaID] ASC),
    CONSTRAINT [FK_TrVac_Treatment] FOREIGN KEY ([TreatmentID]) REFERENCES [dbo].[Treatment] ([TreatmentID]),
    CONSTRAINT [FK_TrVac_Vacuna] FOREIGN KEY ([VacunaID]) REFERENCES [dbo].[Vacuna] ([VacunaID])
);


GO

CREATE TRIGGER [dbo].[trg_Tratamiento_Vacuna_BusinessRules]
ON [dbo].[Tratamiento_Vacuna]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM [dbo].[Tratamiento_Vacuna] t
    JOIN inserted i
        ON t.[VacunaID] = i.[VacunaID];

END;