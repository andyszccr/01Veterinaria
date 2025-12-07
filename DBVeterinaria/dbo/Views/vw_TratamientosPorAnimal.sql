
/* 2) vw_TratamientosPorAnimal: histórico de tratamientos por animal */
CREATE VIEW dbo.vw_TratamientosPorAnimal AS
SELECT
    at.AnimalTreatmentID,
    at.AnimalID,
    a.AnimalName,
    at.TreatmentID,
    t.TreatmentName,
    t.TipoTratamiento,
    at.FechaInicio,
    at.FechaFin,
    at.Dosis,
    at.Observaciones,
    at.AppliedBy,
    at.CreatedAt
FROM dbo.Animal_Treatment at
LEFT JOIN dbo.Animal a ON at.AnimalID = a.AnimalID
LEFT JOIN dbo.Treatment t ON at.TreatmentID = t.TreatmentID;