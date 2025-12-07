CREATE TABLE [dbo].[Clasificacion] (
    [ClasificacionID] INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]          VARCHAR (200) NOT NULL,
    [TipoNivel]       VARCHAR (50)  NOT NULL,
    [ParentID]        INT           NULL,
    [CreatedAt]       DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]       INT           NULL,
    [ModifiedAt]      DATETIME2 (7) NULL,
    [ModifiedBy]      INT           NULL,
    PRIMARY KEY CLUSTERED ([ClasificacionID] ASC),
    CONSTRAINT [CK_Clasificacion_Tipo] CHECK ([TipoNivel]='Subespecie' OR [TipoNivel]='Especie' OR [TipoNivel]='Genero' OR [TipoNivel]='Familia' OR [TipoNivel]='Orden' OR [TipoNivel]='Clase' OR [TipoNivel]='Filo' OR [TipoNivel]='Reino'),
    CONSTRAINT [FK_Clasificacion_Self] FOREIGN KEY ([ParentID]) REFERENCES [dbo].[Clasificacion] ([ClasificacionID])
);


GO
CREATE NONCLUSTERED INDEX [IX_Clasificacion_TipoNivel]
    ON [dbo].[Clasificacion]([TipoNivel] ASC);

