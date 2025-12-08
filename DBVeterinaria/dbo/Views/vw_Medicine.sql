
CREATE VIEW vw_Medicine AS
SELECT 
    t.[MedicineID], t.[MedicineCode], t.[MedicineName], t.[MedicineStatus], t.[CreatedAt], t.[CreatedBy]
FROM Medicine t
;