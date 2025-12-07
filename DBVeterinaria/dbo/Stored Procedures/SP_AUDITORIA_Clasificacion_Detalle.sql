
CREATE   PROCEDURE SP_AUDITORIA_Clasificacion_Detalle
(
    @Operacion varchar(10),
    @ClasificacionDetalleID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Clasificacion_Detalle 
    (Operacion, ClasificacionDetalleID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @ClasificacionDetalleID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END