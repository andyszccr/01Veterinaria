
CREATE VIEW vw_Clasificacion AS
SELECT 
    t.[ClasificacionID], t.[Nombre], t.[TipoNivel], t.[ParentID], t.[CreatedAt], t.[CreatedBy], t.[ModifiedAt], t.[ModifiedBy]
FROM Clasificacion t
LEFT JOIN [Clasificacion] r1 ON t.[ParentID] = r1.[ClasificacionID];