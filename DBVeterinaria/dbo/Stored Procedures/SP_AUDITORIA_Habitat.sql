
CREATE   PROCEDURE SP_AUDITORIA_Habitat
(
    @Operacion varchar(10),
    @HabitatID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Habitat 
    (Operacion, HabitatID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @HabitatID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END