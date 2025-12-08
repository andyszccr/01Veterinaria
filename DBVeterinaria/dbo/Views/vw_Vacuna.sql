
CREATE VIEW vw_Vacuna AS
SELECT 
    t.[VacunaID], t.[TipoVacuna], t.[CreatedAt], t.[CreatedBy]
FROM Vacuna t
;