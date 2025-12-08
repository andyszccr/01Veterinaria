
CREATE VIEW vw_Comida AS
SELECT 
    t.[ComidaID], t.[TipoComida], t.[Cantidad], t.[Unidad], t.[Frecuencia], t.[Calorias], t.[CreatedAt], t.[CreatedBy]
FROM Comida t
;