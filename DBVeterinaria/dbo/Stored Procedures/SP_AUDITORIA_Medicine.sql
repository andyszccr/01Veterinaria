
CREATE   PROCEDURE SP_AUDITORIA_Medicine
(
    @Operacion varchar(10),
    @MedicineCode INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Medicine 
    (Operacion, MedicineCode, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @MedicineCode, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END