
CREATE   PROCEDURE SP_AUDITORIA_Animal_Treatment
(
    @Operacion varchar(10),
    @AnimalTreatmentID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Animal_Treatment 
    (Operacion, AnimalTreatmentID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @AnimalTreatmentID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END