CREATE TABLE [dbo].[Users] (
    [UserID]       INT           IDENTITY (1, 1) NOT NULL,
    [UserCode]     VARCHAR (5)   NOT NULL,
    [UserName]     VARCHAR (100) NOT NULL,
    [UserLastName] VARCHAR (100) NOT NULL,
    [RoleID]       INT           NOT NULL,
    [UserEmail]    VARCHAR (100) NOT NULL,
    [UserPhone]    INT           NOT NULL,
    [Useraddress]  VARCHAR (200) NOT NULL,
    [UserCreate]   DATETIME      NULL,
    [UserUpdate]   DATETIME      NULL,
    [UserDelete]   DATETIME      NULL,
    [UserStatus]   BIT           NOT NULL,
    [ProvinceID]   INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC),
    CONSTRAINT [FK_Users_Provinces] FOREIGN KEY ([ProvinceID]) REFERENCES [dbo].[Provinces] ([ProvinceID]),
    CONSTRAINT [FK_Users_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
);

