
-- ============================================================
-- VISTA: vw_Clasificacion_Animal
-- Descripción:
-- Obtiene la clasificación completa de un animal con sus detalles
-- ============================================================
CREATE VIEW dbo.vw_Clasificacion_Animal AS
SELECT
    a.*,
    c.Nombre as CalificacionName,
    c.ParentID,
    c.TipoNivel,
    d.NivelTaxonomico,
    d.Subnivel,
    d.NombreNivel
FROM dbo.Animal a
JOIN dbo.Clasificacion c ON a.ClasificacionID = c.ClasificacionID
LEFT JOIN dbo.Clasificacion_Detalle d ON c.ClasificacionID = d.ClasificacionID;