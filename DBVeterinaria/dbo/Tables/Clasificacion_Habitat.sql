CREATE TABLE [dbo].[Clasificacion_Habitat] (
    [ClasificacionID] INT           NOT NULL,
    [HabitatID]       INT           NOT NULL,
    [CreatedAt]       DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]       INT           NULL,
    [ModifiedAt]      DATETIME2 (7) CONSTRAINT [DF_Clasificacion_Habitat_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Clasificacion_Habitat] PRIMARY KEY CLUSTERED ([ClasificacionID] ASC, [HabitatID] ASC),
    CONSTRAINT [FK_CH_Clasificacion] FOREIGN KEY ([ClasificacionID]) REFERENCES [dbo].[Clasificacion] ([ClasificacionID]),
    CONSTRAINT [FK_CH_Habitat] FOREIGN KEY ([HabitatID]) REFERENCES [dbo].[Habitat] ([HabitatID])
);


GO

CREATE TRIGGER [dbo].[trg_Clasificacion_Habitat_BusinessRules]
ON [dbo].[Clasificacion_Habitat]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM [dbo].[Clasificacion_Habitat] t
    JOIN inserted i
        ON t.[HabitatID] = i.[HabitatID];

END;