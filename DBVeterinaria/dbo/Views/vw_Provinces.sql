
CREATE VIEW vw_Provinces AS
SELECT 
    t.[ProvinceID], t.[ProvinceCode], t.[ProvinceName], t.[ProvinceStatus], t.[CreatedAt], t.[CreatedBy]
FROM Provinces t
;