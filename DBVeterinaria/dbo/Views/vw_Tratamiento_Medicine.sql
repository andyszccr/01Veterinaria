
CREATE VIEW vw_Tratamiento_Medicine AS
SELECT 
    t.[TreatmentID], t.[MedicineID], t.[Dosis], t.[Frecuencia], t.[Duracion]
FROM Tratamiento_Medicine t
LEFT JOIN [Treatment] r_TreatmentID ON t.[TreatmentID] = r_TreatmentID.[TreatmentID]
LEFT JOIN [Medicine] r_MedicineID ON t.[MedicineID] = r_MedicineID.[MedicineID];