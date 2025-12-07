CREATE TABLE [dbo].[Roles] (
    [RoleID]     INT           IDENTITY (1, 1) NOT NULL,
    [RoleCode]   VARCHAR (50)  NOT NULL,
    [RoleName]   VARCHAR (150) NOT NULL,
    [RoleStatus] BIT           DEFAULT ((1)) NOT NULL,
    [CreatedAt]  DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]  INT           NULL,
    PRIMARY KEY CLUSTERED ([RoleID] ASC),
    CONSTRAINT [CK_Roles_Status] CHECK ([RoleStatus]=(1) OR [RoleStatus]=(0)),
    UNIQUE NONCLUSTERED ([RoleCode] ASC)
);

