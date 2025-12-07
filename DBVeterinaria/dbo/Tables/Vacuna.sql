CREATE TABLE [dbo].[Vacuna] (
    [VacunaID]   INT           IDENTITY (1, 1) NOT NULL,
    [TipoVacuna] VARCHAR (250) NOT NULL,
    [CreatedAt]  DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]  INT           NULL,
    PRIMARY KEY CLUSTERED ([VacunaID] ASC)
);

