
CREATE PROCEDURE SP_ABM_Mascota
(
    @MascotaID int, @AnimalID int, @UserID int, @MascotaStatus bit, @FechaAsignacion datetime2, @FechaFin datetime2, @CreatedAt datetime2, @CreatedBy int, @ModifiedAt datetime2, @ModifiedBy int, @ModoOperacion VARCHAR(10), @Usuario NVARCHAR(100)
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
        INSERT INTO Mascota(AnimalID, UserID, MascotaStatus, FechaAsignacion, FechaFin, CreatedAt, CreatedBy, ModifiedAt, ModifiedBy)
        VALUES (@AnimalID, @UserID, @MascotaStatus, @FechaAsignacion, @FechaFin, @CreatedAt, @CreatedBy, @ModifiedAt, @ModifiedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @NEW = (SELECT * FROM Mascota WHERE MascotaID = @NuevoID FOR JSON AUTO);

        INSERT INTO Auditoria_Mascota
        (Operacion, MascotaID, DetalleNuevo, Usuario, Fecha)
        VALUES ('INSERT', @NuevoID, @NEW, @Usuario, SYSDATETIME());

        SELECT @NuevoID AS NuevoID;
        RETURN;
    END;


    --------------------------------------------------------
    -- UPDATE
    --------------------------------------------------------
    IF @ModoOperacion = 'UPDATE'
    BEGIN
        SET @ANT = (SELECT * FROM Mascota WHERE MascotaID = @MascotaID FOR JSON AUTO);

        UPDATE Mascota
        SET AnimalID = @AnimalID, UserID = @UserID, MascotaStatus = @MascotaStatus, FechaAsignacion = @FechaAsignacion, FechaFin = @FechaFin, CreatedAt = @CreatedAt, CreatedBy = @CreatedBy, ModifiedAt = @ModifiedAt, ModifiedBy = @ModifiedBy
        WHERE MascotaID = @MascotaID;

        SET @NEW = (SELECT * FROM Mascota WHERE MascotaID = @MascotaID FOR JSON AUTO);

        INSERT INTO Auditoria_Mascota
        (Operacion, MascotaID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
        VALUES ('UPDATE', @MascotaID, @ANT, @NEW, @Usuario, SYSDATETIME());

        RETURN;
    END;


    --------------------------------------------------------
    -- DELETE
    --------------------------------------------------------
    IF @ModoOperacion = 'DELETE'
    BEGIN
        SET @ANT = (SELECT * FROM Mascota WHERE MascotaID = @MascotaID FOR JSON AUTO);

        DELETE FROM Mascota WHERE MascotaID = @MascotaID;

        INSERT INTO Auditoria_Mascota
        (Operacion, MascotaID, DetalleAnterior, Usuario, Fecha)
        VALUES ('DELETE', @MascotaID, @ANT, @Usuario, SYSDATETIME());

        RETURN;
    END;
END;