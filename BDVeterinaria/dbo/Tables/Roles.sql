CREATE TABLE [dbo].[Roles] (
    [RoleID]     INT           IDENTITY (1, 1) NOT NULL,
    [RoleCode]   VARCHAR (5)   NOT NULL,
    [RoleName]   VARCHAR (100) NOT NULL,
    [RoleCreate] DATETIME      NULL,
    [RoleUpdate] DATETIME      NULL,
    [RoleDelete] DATETIME      NULL,
    [RoleStatus] BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([RoleID] ASC)
);

