
CREATE VIEW vw_Animal_Treatment AS
SELECT 
    t.[AnimalTreatmentID], t.[AnimalID], t.[TreatmentID], t.[FechaInicio], t.[FechaFin], t.[Dosis], t.[Observaciones], t.[AppliedBy], t.[CreatedAt]
FROM Animal_Treatment t
LEFT JOIN [Animal] r_AnimalID ON t.[AnimalID] = r_AnimalID.[AnimalID]
LEFT JOIN [Treatment] r_TreatmentID ON t.[TreatmentID] = r_TreatmentID.[TreatmentID];