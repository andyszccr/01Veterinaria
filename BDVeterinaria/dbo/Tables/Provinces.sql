CREATE TABLE [dbo].[Provinces] (
    [ProvinceID]     INT           IDENTITY (1, 1) NOT NULL,
    [ProvinceCode]   VARCHAR (5)   NOT NULL,
    [ProvinceName]   VARCHAR (100) NOT NULL,
    [ProvinceCreate] DATETIME      NULL,
    [ProvinceUpdate] DATETIME      NULL,
    [ProvinceDelete] DATETIME      NULL,
    [ProvinceStatus] BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([ProvinceID] ASC)
);

