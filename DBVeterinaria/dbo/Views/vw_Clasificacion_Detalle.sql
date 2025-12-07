-- ============================================================
-- VISTA: vw_Clasificacion_Detalle
-- Descripción:
-- Obtiene todos los niveles de clasificación con los detalles
-- ============================================================
CREATE VIEW dbo.vw_Clasificacion_Detalle AS
SELECT
    c.ClasificacionID,
    c.Nombre,
    c.CreatedAt,
    c.CreatedBy,
    c.ModifiedAt,
    c.ModifiedBy,
    c.ParentID,
    c.TipoNivel,
    d.NivelTaxonomico,
    d.Subnivel,
    d.NombreNivel
FROM dbo.Clasificacion c
LEFT JOIN dbo.Clasificacion_Detalle d ON c.ClasificacionID = d.ClasificacionID;