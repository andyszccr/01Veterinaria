CREATE TABLE [dbo].[Roles] (
    [RoleID]     INT           IDENTITY (1, 1) NOT NULL,
    [RoleCode]   VARCHAR (50)  NOT NULL,
    [RoleName]   VARCHAR (150) NOT NULL,
    [RoleStatus] BIT           DEFAULT ((1)) NOT NULL,
    [CreatedAt]  DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]  INT           NULL,
    [ModifiedAt] DATETIME2 (7) CONSTRAINT [DF_Roles_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([RoleID] ASC),
    CONSTRAINT [CK_Roles_Status] CHECK ([RoleStatus]=(1) OR [RoleStatus]=(0)),
    UNIQUE NONCLUSTERED ([RoleCode] ASC)
);


GO

CREATE TRIGGER [dbo].[trg_Roles_BusinessRules]
ON [dbo].[Roles]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM [dbo].[Roles] t
    JOIN inserted i
        ON t.[RoleID] = i.[RoleID];

END;