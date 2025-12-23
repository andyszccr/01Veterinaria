CREATE TABLE [dbo].[Tratamiento_Remedio] (
    [TreatmentID] INT           NOT NULL,
    [RemedioID]   INT           NOT NULL,
    [ModifiedAt]  DATETIME2 (7) CONSTRAINT [DF_Tratamiento_Remedio_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Tratamiento_Remedio] PRIMARY KEY CLUSTERED ([TreatmentID] ASC, [RemedioID] ASC),
    CONSTRAINT [FK_TrRem_Remedio] FOREIGN KEY ([RemedioID]) REFERENCES [dbo].[Remedio] ([RemedioID]),
    CONSTRAINT [FK_TrRem_Treatment] FOREIGN KEY ([TreatmentID]) REFERENCES [dbo].[Treatment] ([TreatmentID])
);


GO

CREATE TRIGGER [dbo].[trg_Tratamiento_Remedio_BusinessRules]
ON [dbo].[Tratamiento_Remedio]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM [dbo].[Tratamiento_Remedio] t
    JOIN inserted i
        ON t.[TreatmentID] = i.[TreatmentID];

END;