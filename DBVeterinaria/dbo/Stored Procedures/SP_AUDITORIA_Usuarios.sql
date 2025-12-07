
CREATE   PROCEDURE SP_AUDITORIA_Usuarios
(
    @Operacion varchar(10),
    @UserCode INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Usuarios 
    (Operacion, UserCode, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @UserCode, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END