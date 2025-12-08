
CREATE VIEW vw_Tratamiento_Remedio AS
SELECT 
    t.[TreatmentID], t.[RemedioID]
FROM Tratamiento_Remedio t
LEFT JOIN [Treatment] r_TreatmentID ON t.[TreatmentID] = r_TreatmentID.[TreatmentID]
LEFT JOIN [Remedio] r_RemedioID ON t.[RemedioID] = r_RemedioID.[RemedioID];