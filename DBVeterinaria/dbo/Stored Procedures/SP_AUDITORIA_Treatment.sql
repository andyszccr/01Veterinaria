
CREATE   PROCEDURE SP_AUDITORIA_Treatment
(
    @Operacion varchar(10),
    @TreatmentCode INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Treatment 
    (Operacion, TreatmentCode, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @TreatmentCode, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END