CREATE TABLE [dbo].[Race] (
    [RaceID]     INT           IDENTITY (1, 1) NOT NULL,
    [RaceCode]   VARCHAR (5)   NOT NULL,
    [RaceName]   VARCHAR (100) NOT NULL,
    [RaceCreate] DATETIME      NULL,
    [RaceUpdate] DATETIME      NULL,
    [RaceDelete] DATETIME      NULL,
    [RaceStatus] BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([RaceID] ASC)
);

