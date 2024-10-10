CREATE TABLE [dbo].[Treatments] (
    [TreatmentID]     INT           IDENTITY (1, 1) NOT NULL,
    [TreatmentCode]   VARCHAR (5)   NOT NULL,
    [TreatmentName]   VARCHAR (100) NOT NULL,
    [TreatmentAge]    INT           NOT NULL,
    [TreatmentCreate] DATETIME      NULL,
    [TreatmentUpdate] DATETIME      NULL,
    [TreatmentDelete] DATETIME      NULL,
    [TreatmentStatus] BIT           NOT NULL,
    [PetID]           INT           NOT NULL,
    [MedicineID]      INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([TreatmentID] ASC),
    CONSTRAINT [FK_Treatments_Medicine] FOREIGN KEY ([MedicineID]) REFERENCES [dbo].[Medicine] ([MedicineID]),
    CONSTRAINT [FK_Treatments_Pets] FOREIGN KEY ([PetID]) REFERENCES [dbo].[Pets] ([PetID])
);

