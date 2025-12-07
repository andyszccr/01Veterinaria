
CREATE   PROCEDURE SP_AUDITORIA_Tratamiento_Reposo
(
    @Operacion varchar(10),
    @TreatmentID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Tratamiento_Reposo 
    (Operacion, TreatmentID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @TreatmentID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END