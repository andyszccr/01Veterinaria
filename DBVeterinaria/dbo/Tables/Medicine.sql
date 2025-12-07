CREATE TABLE [dbo].[Medicine] (
    [MedicineID]     INT           IDENTITY (1, 1) NOT NULL,
    [MedicineCode]   VARCHAR (50)  NOT NULL,
    [MedicineName]   VARCHAR (250) NOT NULL,
    [MedicineStatus] BIT           DEFAULT ((1)) NOT NULL,
    [CreatedAt]      DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]      INT           NULL,
    PRIMARY KEY CLUSTERED ([MedicineID] ASC),
    UNIQUE NONCLUSTERED ([MedicineCode] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Medicine_Code]
    ON [dbo].[Medicine]([MedicineCode] ASC);

