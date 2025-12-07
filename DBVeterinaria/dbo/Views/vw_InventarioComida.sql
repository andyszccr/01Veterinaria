
/* 7) vw_InventarioComida: resumen por comida (ejemplo agregación) */
CREATE VIEW dbo.vw_InventarioComida AS
SELECT
    c.ComidaID,
    c.TipoComida,
    c.Unidad,
    SUM(COALESCE(ac.CantidadAsignada,0)) AS CantidadAsignadaTotal,
    SUM(COALESCE(c.Calorias,0)) AS TotalCaloriasTeoricas
FROM dbo.Comida c
LEFT JOIN dbo.Animal_Comida ac ON c.ComidaID = ac.ComidaID
GROUP BY c.ComidaID, c.TipoComida, c.Unidad;