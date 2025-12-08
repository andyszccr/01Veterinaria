
CREATE VIEW vw_Treatment AS
SELECT 
    t.[TreatmentID], t.[TreatmentCode], t.[TreatmentName], t.[TipoTratamiento], t.[TreatmentAge], t.[TreatmentStatus], t.[CreatedAt], t.[CreatedBy], t.[ModifiedAt], t.[ModifiedBy]
FROM Treatment t
;