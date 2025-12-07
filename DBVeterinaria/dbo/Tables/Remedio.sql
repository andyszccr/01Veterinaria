CREATE TABLE [dbo].[Remedio] (
    [RemedioID]   INT           IDENTITY (1, 1) NOT NULL,
    [TipoRemedio] VARCHAR (250) NOT NULL,
    [CreatedAt]   DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]   INT           NULL,
    PRIMARY KEY CLUSTERED ([RemedioID] ASC)
);

