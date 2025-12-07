
CREATE   PROCEDURE SP_AUDITORIA_Comida
(
    @Operacion varchar(10),
    @ComidaID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Comida 
    (Operacion, ComidaID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @ComidaID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END