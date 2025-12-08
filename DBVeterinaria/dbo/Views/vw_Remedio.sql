
CREATE VIEW vw_Remedio AS
SELECT 
    t.[RemedioID], t.[TipoRemedio], t.[CreatedAt], t.[CreatedBy]
FROM Remedio t
;