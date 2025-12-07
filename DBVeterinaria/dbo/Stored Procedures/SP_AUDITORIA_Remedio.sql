
CREATE   PROCEDURE SP_AUDITORIA_Remedio
(
    @Operacion varchar(10),
    @RemedioID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Remedio 
    (Operacion, RemedioID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @RemedioID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END