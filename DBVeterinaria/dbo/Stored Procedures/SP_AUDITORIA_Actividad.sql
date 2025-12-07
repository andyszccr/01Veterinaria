
CREATE   PROCEDURE SP_AUDITORIA_Actividad
(
    @Operacion varchar(10),
    @ActividadID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Actividad 
    (Operacion, ActividadID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @ActividadID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END