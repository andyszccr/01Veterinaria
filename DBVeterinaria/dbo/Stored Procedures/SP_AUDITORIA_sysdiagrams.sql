
CREATE   PROCEDURE SP_AUDITORIA_sysdiagrams
(
    @Operacion varchar(10),
    @principal_id INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_sysdiagrams 
    (Operacion, principal_id, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @principal_id, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END