CREATE TABLE [dbo].[Pets] (
    [PetID]     INT           IDENTITY (1, 1) NOT NULL,
    [PetCode]   VARCHAR (5)   NOT NULL,
    [PetName]   VARCHAR (100) NOT NULL,
    [PetAge]    INT           NOT NULL,
    [PetCreate] DATETIME      NULL,
    [PetUpdate] DATETIME      NULL,
    [PetDelete] DATETIME      NULL,
    [PetStatus] BIT           NOT NULL,
    [RaceID]    INT           NOT NULL,
    [UserID]    INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([PetID] ASC),
    CONSTRAINT [FK_Pets_Race] FOREIGN KEY ([RaceID]) REFERENCES [dbo].[Race] ([RaceID]),
    CONSTRAINT [FK_Pets_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID])
);

