
/* 5) vw_ClasificacionArbol: muestra nodo y su padre (útil para arbol en UI) */
CREATE VIEW dbo.vw_ClasificacionArbol AS
SELECT
    c.ClasificacionID,
    c.Nombre AS NombreNivel,
    c.TipoNivel,
    c.ParentID,
    p.Nombre AS ParentNombre,
    p.TipoNivel AS ParentTipoNivel
FROM dbo.Clasificacion c
LEFT JOIN dbo.Clasificacion p ON c.ParentID = p.ClasificacionID;