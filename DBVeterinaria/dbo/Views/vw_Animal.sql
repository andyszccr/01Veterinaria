
CREATE VIEW vw_Animal AS
SELECT 
    t.[AnimalID], t.[AnimalCode], t.[AnimalName], t.[FechaNacimiento], t.[Edad], t.[Peso], t.[Sexo], t.[Estado], t.[AnimalStatus], t.[ClasificacionID], t.[CreatedAt], t.[CreatedBy], t.[ModifiedAt], t.[ModifiedBy]
FROM Animal t
LEFT JOIN [Clasificacion] r1 ON t.[ClasificacionID] = r1.[ClasificacionID];