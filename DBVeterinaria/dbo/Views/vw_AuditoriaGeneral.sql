
/* 8) vw_AuditoriaGeneral: facilita exploración de logs por entidad */
CREATE VIEW dbo.vw_AuditoriaGeneral AS
SELECT
    ActividadID,
    Entidad,
    EntidadID,
    Accion,
    UsuarioID,
    FechaHora,
    Detalle
FROM dbo.Actividad;