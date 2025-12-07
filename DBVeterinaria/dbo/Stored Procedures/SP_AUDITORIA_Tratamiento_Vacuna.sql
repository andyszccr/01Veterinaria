
CREATE   PROCEDURE SP_AUDITORIA_Tratamiento_Vacuna
(
    @Operacion varchar(10),
    @VacunaID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Tratamiento_Vacuna 
    (Operacion, VacunaID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @VacunaID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END