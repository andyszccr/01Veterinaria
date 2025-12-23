CREATE TABLE [dbo].[Clasificacion_Detalle] (
    [ClasificacionDetalleID] INT           IDENTITY (1, 1) NOT NULL,
    [ClasificacionID]        INT           NOT NULL,
    [NivelTaxonomico]        VARCHAR (30)  NOT NULL,
    [Subnivel]               VARCHAR (50)  NULL,
    [NombreNivel]            VARCHAR (200) NOT NULL,
    [ModifiedAt]             DATETIME2 (7) CONSTRAINT [DF_Clasificacion_Detalle_ModifiedAt] DEFAULT (sysutcdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ClasificacionDetalleID] ASC),
    CONSTRAINT [CK_ClasificacionDetalle_Nivel] CHECK ([NivelTaxonomico]='GENERO' OR [NivelTaxonomico]='FAMILIA' OR [NivelTaxonomico]='ORDEN' OR [NivelTaxonomico]='CLASE' OR [NivelTaxonomico]='FILO' OR [NivelTaxonomico]='REINO'),
    CONSTRAINT [FK_ClasificacionDetalle_Clasificacion] FOREIGN KEY ([ClasificacionID]) REFERENCES [dbo].[Clasificacion] ([ClasificacionID])
);




GO
CREATE NONCLUSTERED INDEX [IX_ClasificacionDetalle_ClasificacionID]
    ON [dbo].[Clasificacion_Detalle]([ClasificacionID] ASC);


GO
-- ============================================================
-- TRIGGER: trg_Clasificacion_Detalle_Auditoria
-- Descripción:
-- Audita inserciones, actualizaciones y eliminaciones en
-- `Clasificacion_Detalle`.
-- ============================================================
CREATE TRIGGER trg_Clasificacion_Detalle_Auditoria
ON dbo.Clasificacion_Detalle
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Auditoria_Clasificacion
        (Operacion, ClasificacionID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    SELECT
        CASE 
            WHEN i.ClasificacionDetalleID IS NOT NULL 
                 AND d.ClasificacionDetalleID IS NOT NULL THEN 'UPDATE'
            WHEN i.ClasificacionDetalleID IS NOT NULL THEN 'INSERT'
            WHEN d.ClasificacionDetalleID IS NOT NULL THEN 'DELETE'
        END AS Operacion,

        COALESCE(i.ClasificacionDetalleID, d.ClasificacionDetalleID) AS ClasificacionID,

        -- JSON del estado anterior
        CASE 
            WHEN d.ClasificacionDetalleID IS NOT NULL THEN
                (SELECT d.ClasificacionDetalleID,
                        d.ClasificacionID,
                        d.NivelTaxonomico,
                        d.Subnivel,
                        d.NombreNivel
                 FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        END AS DetalleAnterior,

        -- JSON del nuevo estado
        CASE 
            WHEN i.ClasificacionDetalleID IS NOT NULL THEN
                (SELECT i.ClasificacionDetalleID,
                        i.ClasificacionID,
                        i.NivelTaxonomico,
                        i.Subnivel,
                        i.NombreNivel
                 FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        END AS DetalleNuevo,

        SUSER_SNAME() AS Usuario,   -- usuario de SQL Server
        SYSUTCDATETIME() AS Fecha
    FROM inserted i
    FULL JOIN deleted d 
        ON i.ClasificacionDetalleID = d.ClasificacionDetalleID;
END;
GO

CREATE TRIGGER [dbo].[trg_Clasificacion_Detalle_BusinessRules]
ON [dbo].[Clasificacion_Detalle]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM [dbo].[Clasificacion_Detalle] t
    JOIN inserted i
        ON t.[ClasificacionDetalleID] = i.[ClasificacionDetalleID];

END;