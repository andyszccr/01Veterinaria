
CREATE VIEW vw_TipoTratamiento AS
SELECT 
    t.[TipoTratamientoID], t.[TipoTratamientoCode], t.[TipoTratamientoName], t.[Descripcion], t.[TipoTratamientoStatus], t.[CreatedAt], t.[CreatedBy], t.[ModifiedAt], t.[ModifiedBy]
FROM TipoTratamiento t
;