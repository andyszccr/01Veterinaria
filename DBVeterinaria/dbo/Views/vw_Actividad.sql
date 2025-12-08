
CREATE VIEW vw_Actividad AS
SELECT 
    t.[ActividadID], t.[Entidad], t.[EntidadID], t.[Accion], t.[UsuarioID], t.[FechaHora], t.[Detalle]
FROM Actividad t
;