
CREATE   PROCEDURE SP_AUDITORIA_Reposo
(
    @Operacion varchar(10),
    @ReposoID INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_Reposo 
    (Operacion, ReposoID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @ReposoID, @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END