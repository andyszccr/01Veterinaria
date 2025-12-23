CREATE TABLE [dbo].[Provinces] (
    [ProvinceID]     INT           IDENTITY (1, 1) NOT NULL,
    [ProvinceCode]   VARCHAR (50)  NOT NULL,
    [ProvinceName]   VARCHAR (150) NOT NULL,
    [ProvinceStatus] BIT           DEFAULT ((1)) NOT NULL,
    [CreatedAt]      DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]      INT           NULL,
    [ModifiedAt]     DATETIME2 (7) CONSTRAINT [DF_Provinces_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ProvinceID] ASC),
    CONSTRAINT [CK_Provinces_Status] CHECK ([ProvinceStatus]=(1) OR [ProvinceStatus]=(0)),
    UNIQUE NONCLUSTERED ([ProvinceCode] ASC)
);


GO

CREATE TRIGGER [dbo].[trg_Provinces_BusinessRules]
ON [dbo].[Provinces]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM [dbo].[Provinces] t
    JOIN inserted i
        ON t.[ProvinceID] = i.[ProvinceID];

END;