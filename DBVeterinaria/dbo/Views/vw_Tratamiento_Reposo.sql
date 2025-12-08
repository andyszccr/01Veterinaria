
CREATE VIEW vw_Tratamiento_Reposo AS
SELECT 
    t.[TreatmentID], t.[ReposoID]
FROM Tratamiento_Reposo t
LEFT JOIN [Treatment] r_TreatmentID ON t.[TreatmentID] = r_TreatmentID.[TreatmentID]
LEFT JOIN [Reposo] r_ReposoID ON t.[ReposoID] = r_ReposoID.[ReposoID];