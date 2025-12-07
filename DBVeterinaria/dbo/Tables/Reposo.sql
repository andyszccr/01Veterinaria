CREATE TABLE [dbo].[Reposo] (
    [ReposoID]   INT           IDENTITY (1, 1) NOT NULL,
    [TipoReposo] VARCHAR (250) NOT NULL,
    [CreatedAt]  DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]  INT           NULL,
    PRIMARY KEY CLUSTERED ([ReposoID] ASC)
);

