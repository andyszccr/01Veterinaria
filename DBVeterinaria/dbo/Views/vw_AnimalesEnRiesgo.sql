
/* 4) vw_AnimalesEnRiesgo: animales con estado crítico o en control */
CREATE VIEW dbo.vw_AnimalesEnRiesgo AS
SELECT
    AnimalID,
    AnimalCode,
    AnimalName,
    FechaNacimiento,
    Edad,
    Peso,
    Sexo,
    Estado
FROM dbo.Animal
WHERE Estado IN ('Enfermo','Riesgo','Control');