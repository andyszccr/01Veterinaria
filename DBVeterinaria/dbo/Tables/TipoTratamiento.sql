CREATE TABLE [dbo].[TipoTratamiento] (
    [TipoTratamientoID]     INT           IDENTITY (1, 1) NOT NULL,
    [TipoTratamientoCode]   VARCHAR (50)  NOT NULL,
    [TipoTratamientoName]   VARCHAR (150) NOT NULL,
    [Descripcion]           VARCHAR (300) NULL,
    [TipoTratamientoStatus] BIT           DEFAULT ((1)) NOT NULL,
    [CreatedAt]             DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]             INT           NULL,
    [ModifiedAt]            DATETIME2 (7) NULL,
    [ModifiedBy]            INT           NULL,
    PRIMARY KEY CLUSTERED ([TipoTratamientoID] ASC),
    CONSTRAINT [CK_TipoTratamiento_Status] CHECK ([TipoTratamientoStatus]=(1) OR [TipoTratamientoStatus]=(0)),
    UNIQUE NONCLUSTERED ([TipoTratamientoCode] ASC)
);


GO

CREATE TRIGGER [dbo].[trg_TipoTratamiento_BusinessRules]
ON [dbo].[TipoTratamiento]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM [dbo].[TipoTratamiento] t
    JOIN inserted i
        ON t.[TipoTratamientoID] = i.[TipoTratamientoID];

END;