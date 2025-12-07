
CREATE   PROCEDURE SP_AUDITORIA_Clasificacion
(
    @Operacion varchar(10),
    @ClasificacionID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Clasificacion 
    (Operacion, ClasificacionID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @ClasificacionID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END