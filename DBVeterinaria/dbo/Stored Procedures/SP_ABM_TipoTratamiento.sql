
CREATE PROCEDURE SP_ABM_TipoTratamiento
(
    @TipoTratamientoID int, @TipoTratamientoCode varchar(50), @TipoTratamientoName varchar(150), @Descripcion varchar(300), @TipoTratamientoStatus bit, @CreatedAt datetime2, @CreatedBy int, @ModifiedAt datetime2, @ModifiedBy int, @ModoOperacion VARCHAR(10), @Usuario NVARCHAR(100)
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
        INSERT INTO TipoTratamiento(TipoTratamientoCode, TipoTratamientoName, Descripcion, TipoTratamientoStatus, CreatedAt, CreatedBy, ModifiedAt, ModifiedBy)
        VALUES (@TipoTratamientoCode, @TipoTratamientoName, @Descripcion, @TipoTratamientoStatus, @CreatedAt, @CreatedBy, @ModifiedAt, @ModifiedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @NEW = (SELECT * FROM TipoTratamiento WHERE TipoTratamientoID = @NuevoID FOR JSON AUTO);

        INSERT INTO Auditoria_TipoTratamiento
        (Operacion, TipoTratamientoID, DetalleNuevo, Usuario, Fecha)
        VALUES ('INSERT', @NuevoID, @NEW, @Usuario, SYSDATETIME());

        SELECT @NuevoID AS NuevoID;
        RETURN;
    END;


    --------------------------------------------------------
    -- UPDATE
    --------------------------------------------------------
    IF @ModoOperacion = 'UPDATE'
    BEGIN
        SET @ANT = (SELECT * FROM TipoTratamiento WHERE TipoTratamientoID = @TipoTratamientoID FOR JSON AUTO);

        UPDATE TipoTratamiento
        SET TipoTratamientoCode = @TipoTratamientoCode, TipoTratamientoName = @TipoTratamientoName, Descripcion = @Descripcion, TipoTratamientoStatus = @TipoTratamientoStatus, CreatedAt = @CreatedAt, CreatedBy = @CreatedBy, ModifiedAt = @ModifiedAt, ModifiedBy = @ModifiedBy
        WHERE TipoTratamientoID = @TipoTratamientoID;

        SET @NEW = (SELECT * FROM TipoTratamiento WHERE TipoTratamientoID = @TipoTratamientoID FOR JSON AUTO);

        INSERT INTO Auditoria_TipoTratamiento
        (Operacion, TipoTratamientoID, DetalleAnterior, DetalleNuevo, Usuario, Fecha)
        VALUES ('UPDATE', @TipoTratamientoID, @ANT, @NEW, @Usuario, SYSDATETIME());

        RETURN;
    END;


    --------------------------------------------------------
    -- DELETE
    --------------------------------------------------------
    IF @ModoOperacion = 'DELETE'
    BEGIN
        SET @ANT = (SELECT * FROM TipoTratamiento WHERE TipoTratamientoID = @TipoTratamientoID FOR JSON AUTO);

        DELETE FROM TipoTratamiento WHERE TipoTratamientoID = @TipoTratamientoID;

        INSERT INTO Auditoria_TipoTratamiento
        (Operacion, TipoTratamientoID, DetalleAnterior, Usuario, Fecha)
        VALUES ('DELETE', @TipoTratamientoID, @ANT, @Usuario, SYSDATETIME());

        RETURN;
    END;
END;