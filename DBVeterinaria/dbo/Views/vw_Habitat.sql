
CREATE VIEW vw_Habitat AS
SELECT 
    t.[HabitatID], t.[HabitatName], t.[Description], t.[TemperaturaMin], t.[TemperaturaMax], t.[HumedadMin], t.[HumedadMax], t.[CreatedAt], t.[CreatedBy]
FROM Habitat t
;