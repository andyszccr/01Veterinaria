CREATE TABLE [dbo].[Animal_Comida] (
    [AnimalID]           INT            NOT NULL,
    [ComidaID]           INT            NOT NULL,
    [CantidadAsignada]   DECIMAL (9, 2) NULL,
    [FrecuenciaAsignada] VARCHAR (100)  NULL,
    [CreatedAt]          DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    [ModifiedAt]         DATETIME2 (7)  CONSTRAINT [DF_Animal_Comida_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Animal_Comida] PRIMARY KEY CLUSTERED ([AnimalID] ASC, [ComidaID] ASC),
    CONSTRAINT [FK_AnimalComida_Animal] FOREIGN KEY ([AnimalID]) REFERENCES [dbo].[Animal] ([AnimalID]),
    CONSTRAINT [FK_AnimalComida_Comida] FOREIGN KEY ([ComidaID]) REFERENCES [dbo].[Comida] ([ComidaID])
);




GO
CREATE NONCLUSTERED INDEX [IX_AnimalComida_ComidaID]
    ON [dbo].[Animal_Comida]([ComidaID] ASC);


GO

CREATE TRIGGER [dbo].[trg_Animal_Comida_BusinessRules]
ON [dbo].[Animal_Comida]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM [dbo].[Animal_Comida] t
    JOIN inserted i
        ON t.[ComidaID] = i.[ComidaID];

END;