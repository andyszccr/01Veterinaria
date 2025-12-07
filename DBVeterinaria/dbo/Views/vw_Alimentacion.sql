
/* 3) vw_Alimentacion: comidas asignadas por animal (detalles) */
CREATE VIEW dbo.vw_Alimentacion AS
SELECT
    ac.AnimalID,
    a.AnimalName,
    ac.ComidaID,
    c.TipoComida,
    COALESCE(ac.CantidadAsignada, c.Cantidad) AS Cantidad,
    COALESCE(ac.FrecuenciaAsignada, c.Frecuencia) AS Frecuencia,
    c.Unidad,
    c.Calorias
FROM dbo.Animal_Comida ac
JOIN dbo.Animal a ON ac.AnimalID = a.AnimalID
JOIN dbo.Comida c ON ac.ComidaID = c.ComidaID;