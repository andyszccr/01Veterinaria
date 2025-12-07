
CREATE   PROCEDURE SP_AUDITORIA_Animal
(
    @Operacion varchar(10),
    @AnimalCode INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Animal 
    (Operacion, AnimalCode, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @AnimalCode, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END