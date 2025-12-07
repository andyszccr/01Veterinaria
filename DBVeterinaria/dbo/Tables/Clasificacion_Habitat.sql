CREATE TABLE [dbo].[Clasificacion_Habitat] (
    [ClasificacionID] INT           NOT NULL,
    [HabitatID]       INT           NOT NULL,
    [CreatedAt]       DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]       INT           NULL,
    CONSTRAINT [PK_Clasificacion_Habitat] PRIMARY KEY CLUSTERED ([ClasificacionID] ASC, [HabitatID] ASC),
    CONSTRAINT [FK_CH_Clasificacion] FOREIGN KEY ([ClasificacionID]) REFERENCES [dbo].[Clasificacion] ([ClasificacionID]),
    CONSTRAINT [FK_CH_Habitat] FOREIGN KEY ([HabitatID]) REFERENCES [dbo].[Habitat] ([HabitatID])
);

