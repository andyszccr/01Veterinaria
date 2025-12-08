
CREATE VIEW vw_Tratamiento_Vacuna AS
SELECT 
    t.[TreatmentID], t.[VacunaID]
FROM Tratamiento_Vacuna t
LEFT JOIN [Treatment] r_TreatmentID ON t.[TreatmentID] = r_TreatmentID.[TreatmentID]
LEFT JOIN [Vacuna] r_VacunaID ON t.[VacunaID] = r_VacunaID.[VacunaID];