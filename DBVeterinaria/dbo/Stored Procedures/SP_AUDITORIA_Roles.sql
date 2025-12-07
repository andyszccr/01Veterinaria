
CREATE   PROCEDURE SP_AUDITORIA_Roles
(
    @Operacion varchar(10),
    @RoleCode INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Roles 
    (Operacion, RoleCode, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @RoleCode, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END