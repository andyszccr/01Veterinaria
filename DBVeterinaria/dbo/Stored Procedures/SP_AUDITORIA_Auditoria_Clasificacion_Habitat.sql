
CREATE   PROCEDURE SP_AUDITORIA_Auditoria_Clasificacion_Habitat
(
    @Operacion varchar(10),
    @AuditoriaID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Auditoria_Clasificacion_Habitat 
    (Operacion, AuditoriaID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @AuditoriaID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END