CREATE TABLE [dbo].[Categories] (
    [CategoryCode]   CHAR (7)     NOT NULL,
    [CategoryID]     INT          IDENTITY (1, 1) NOT NULL,
    [CategoryName]   VARCHAR (50) NOT NULL,
    [CategoryCreate] DATETIME     NULL,
    [CategoryUpdate] DATETIME     NULL,
    [CategoryDelete] DATETIME     NULL,
    [CategoryStatus] BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);

