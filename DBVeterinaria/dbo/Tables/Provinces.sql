CREATE TABLE [dbo].[Provinces] (
    [ProvinceID]     INT           IDENTITY (1, 1) NOT NULL,
    [ProvinceCode]   VARCHAR (50)  NOT NULL,
    [ProvinceName]   VARCHAR (150) NOT NULL,
    [ProvinceStatus] BIT           DEFAULT ((1)) NOT NULL,
    [CreatedAt]      DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]      INT           NULL,
    PRIMARY KEY CLUSTERED ([ProvinceID] ASC),
    CONSTRAINT [CK_Provinces_Status] CHECK ([ProvinceStatus]=(1) OR [ProvinceStatus]=(0)),
    UNIQUE NONCLUSTERED ([ProvinceCode] ASC)
);

