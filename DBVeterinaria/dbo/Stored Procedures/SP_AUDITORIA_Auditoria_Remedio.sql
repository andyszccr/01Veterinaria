
CREATE   PROCEDURE SP_AUDITORIA_Auditoria_Remedio
(
    @Operacion varchar(10),
    @AuditoriaID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Auditoria_Remedio 
    (Operacion, AuditoriaID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @AuditoriaID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END