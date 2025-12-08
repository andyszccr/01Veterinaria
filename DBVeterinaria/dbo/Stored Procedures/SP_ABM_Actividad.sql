
CREATE PROCEDURE SP_ABM_Actividad
(
    @ActividadID int, @Entidad varchar(100), @EntidadID int, @Accion varchar(10), @UsuarioID int, @FechaHora datetime2, @Detalle nvarchar(MAX), @ModoOperacion VARCHAR(10), @Usuario NVARCHAR(100)
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ANT NVARCHAR(MAX), @NEW NVARCHAR(MAX);

    --------------------------------------------------------
    -- INSERT
    --------------------------------------------------------
    IF @ModoOperacion = 'INSERT'
    BEGIN
        INSERT INTO Actividad(Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        VALUES (@Entidad, @EntidadID, @Accion, @UsuarioID, @FechaHora, @Detalle);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @NEW = (SELECT * FROM Actividad WHERE ActividadID = @NuevoID FOR JSON AUTO);

        INSERT INTO Auditoria_Actividad
        (Operacion, ActividadID, DetalleNuevo, Usuario, Fecha)
        VALUES ('INSERT', @NuevoID, @NEW, @Usuario, SYSDATETIME());

        SELECT @NuevoID AS NuevoID;
        RETURN;
    END;


    --------------------------------------------------------
    -- UPDATE
    --------------------------------------------------------
    IF @ModoOperacion = 'UPDATE'
    BEGIN
        SET @ANT = (SELECT * FROM Actividad WHERE ActividadID = @ActividadID FOR JSON AUTO);

        UPDATE Actividad
        SET Entidad = @Entidad, EntidadID = @EntidadID, Accion = @Accion, UsuarioID = @UsuarioID, FechaHora = @FechaHora, Detalle = @Detalle
        WHERE ActividadID = @ActividadID;

        SET @NEW = (SELECT * FROM Actividad WHERE ActividadID = @ActividadID FOR JSON AUTO);

        INSERT INTO Auditoria_Actividad
        (Operacion, ActividadID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
        VALUES ('UPDATE', @ActividadID, @ANT, @NEW, @Usuario, SYSDATETIME());

        RETURN;
    END;


    --------------------------------------------------------
    -- DELETE
    --------------------------------------------------------
    IF @ModoOperacion = 'DELETE'
    BEGIN
        SET @ANT = (SELECT * FROM Actividad WHERE ActividadID = @ActividadID FOR JSON AUTO);

        DELETE FROM Actividad WHERE ActividadID = @ActividadID;

        INSERT INTO Auditoria_Actividad
        (Operacion, ActividadID, DetalleAnterior, Usuario, Fecha)
        VALUES ('DELETE', @ActividadID, @ANT, @Usuario, SYSDATETIME());

        RETURN;
    END;
END;