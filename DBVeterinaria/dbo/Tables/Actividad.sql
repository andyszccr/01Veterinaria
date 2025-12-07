CREATE TABLE [dbo].[Actividad] (
    [ActividadID] INT            IDENTITY (1, 1) NOT NULL,
    [Entidad]     VARCHAR (100)  NOT NULL,
    [EntidadID]   INT            NOT NULL,
    [Accion]      VARCHAR (10)   NOT NULL,
    [UsuarioID]   INT            NULL,
    [FechaHora]   DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    [Detalle]     NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([ActividadID] ASC),
    CHECK ([Accion]='DELETE' OR [Accion]='UPDATE' OR [Accion]='CREATE')
);


GO
CREATE NONCLUSTERED INDEX [IX_Actividad_Entidad_EntidadID]
    ON [dbo].[Actividad]([Entidad] ASC, [EntidadID] ASC);

