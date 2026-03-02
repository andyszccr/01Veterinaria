CREATE TABLE [dbo].[Medicine] (
    [MedicineID]     INT           IDENTITY (1, 1) NOT NULL,
    [MedicineCode]   VARCHAR (5)   NOT NULL,
    [MedicineName]   VARCHAR (100) NOT NULL,
    [MedicineCreate] DATETIME      NULL,
    [MedicineUpdate] DATETIME      NULL,
    [MedicineDelete] DATETIME      NULL,
    [MedicineStatus] BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([MedicineID] ASC)
);

