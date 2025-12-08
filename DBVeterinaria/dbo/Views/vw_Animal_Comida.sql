
CREATE VIEW vw_Animal_Comida AS
SELECT 
    t.[AnimalID], t.[ComidaID], t.[CantidadAsignada], t.[FrecuenciaAsignada], t.[CreatedAt]
FROM Animal_Comida t
LEFT JOIN [Animal] r_AnimalID ON t.[AnimalID] = r_AnimalID.[AnimalID]
LEFT JOIN [Comida] r_ComidaID ON t.[ComidaID] = r_ComidaID.[ComidaID];