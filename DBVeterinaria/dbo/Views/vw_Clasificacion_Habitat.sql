
CREATE VIEW vw_Clasificacion_Habitat AS
SELECT 
    t.[ClasificacionID], t.[HabitatID], t.[CreatedAt], t.[CreatedBy]
FROM Clasificacion_Habitat t
LEFT JOIN [Clasificacion] r_ClasificacionID ON t.[ClasificacionID] = r_ClasificacionID.[ClasificacionID]
LEFT JOIN [Habitat] r_HabitatID ON t.[HabitatID] = r_HabitatID.[HabitatID];