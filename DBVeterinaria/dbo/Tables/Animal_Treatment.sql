CREATE TABLE [dbo].[Animal_Treatment] (
    [AnimalTreatmentID] INT             IDENTITY (1, 1) NOT NULL,
    [AnimalID]          INT             NOT NULL,
    [TreatmentID]       INT             NOT NULL,
    [FechaInicio]       DATETIME2 (7)   DEFAULT (sysutcdatetime()) NOT NULL,
    [FechaFin]          DATETIME2 (7)   NULL,
    [Dosis]             VARCHAR (200)   NULL,
    [Observaciones]     NVARCHAR (1000) NULL,
    [AppliedBy]         INT             NULL,
    [CreatedAt]         DATETIME2 (7)   DEFAULT (sysutcdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([AnimalTreatmentID] ASC),
    CONSTRAINT [FK_AnimalTreatment_Animal] FOREIGN KEY ([AnimalID]) REFERENCES [dbo].[Animal] ([AnimalID]),
    CONSTRAINT [FK_AnimalTreatment_Treatment] FOREIGN KEY ([TreatmentID]) REFERENCES [dbo].[Treatment] ([TreatmentID])
);


GO
CREATE NONCLUSTERED INDEX [IX_AnimalTreatment_AnimalID]
    ON [dbo].[Animal_Treatment]([AnimalID] ASC);

