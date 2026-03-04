CREATE TABLE [dbo].[Products] (
    [ProductCode]   CHAR (7)        NOT NULL,
    [ProductID]     INT             IDENTITY (1, 1) NOT NULL,
    [ProductName]   VARCHAR (100)   NOT NULL,
    [Description]   VARCHAR (200)   NULL,
    [Price]         DECIMAL (10, 2) NOT NULL,
    [ProductCreate] DATETIME        NULL,
    [ProductUpdate] DATETIME        NULL,
    [ProductDelete] DATETIME        NULL,
    [ProductStatus] BIT             NOT NULL,
    [CategoryID]    INT             NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID])
);

