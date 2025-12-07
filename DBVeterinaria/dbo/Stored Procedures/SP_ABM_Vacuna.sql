
CREATE   PROCEDURE SP_ABM_Vacuna
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @VacunaID INT = NULL,
    @TipoVacuna varchar(250) = NULL,
    @CreatedAt datetime2 = NULL,
    @CreatedBy int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Vacuna ([TipoVacuna], [CreatedAt], [CreatedBy])
        VALUES (@TipoVacuna, @CreatedAt, @CreatedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Vacuna WHERE VacunaID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Vacuna 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Vacuna WHERE VacunaID = @VacunaID FOR JSON AUTO);

        UPDATE Vacuna
        SET [TipoVacuna] = @TipoVacuna, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy
        WHERE VacunaID = @VacunaID;

        SET @Nuevo = (SELECT * FROM Vacuna WHERE VacunaID = @VacunaID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Vacuna 'UPDATE', @VacunaID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Vacuna WHERE VacunaID = @VacunaID FOR JSON AUTO);

        DELETE FROM Vacuna
        WHERE VacunaID = @VacunaID;

        EXEC SP_AUDITORIA_Vacuna 'DELETE', @VacunaID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Vacuna;
    END
END