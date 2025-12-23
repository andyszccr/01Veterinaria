
CREATE VIEW vw_Mascota AS
SELECT 
    t.[MascotaID], t.[AnimalID], t.[UserID], t.[MascotaStatus], t.[FechaAsignacion], t.[FechaFin], t.[CreatedAt], t.[CreatedBy], t.[ModifiedAt], t.[ModifiedBy]
FROM Mascota t
LEFT JOIN [Animal] r_AnimalID ON t.[AnimalID] = r_AnimalID.[AnimalID]
LEFT JOIN [Usuarios] r_UserID ON t.[UserID] = r_UserID.[UserID];