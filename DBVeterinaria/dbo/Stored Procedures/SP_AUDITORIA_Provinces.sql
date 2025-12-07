
CREATE   PROCEDURE SP_AUDITORIA_Provinces
(
    @Operacion varchar(10),
    @ProvinceCode INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Provinces 
    (Operacion, ProvinceCode, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @ProvinceCode, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END