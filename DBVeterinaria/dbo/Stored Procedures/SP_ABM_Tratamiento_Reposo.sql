
CREATE   PROCEDURE SP_ABM_Tratamiento_Reposo
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @TreatmentID INT = NULL,
    @ReposoID int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Tratamiento_Reposo ([ReposoID])
        VALUES (@ReposoID);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Tratamiento_Reposo WHERE TreatmentID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Tratamiento_Reposo 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Tratamiento_Reposo WHERE TreatmentID = @TreatmentID FOR JSON AUTO);

        UPDATE Tratamiento_Reposo
        SET [ReposoID] = @ReposoID
        WHERE TreatmentID = @TreatmentID;

        SET @Nuevo = (SELECT * FROM Tratamiento_Reposo WHERE TreatmentID = @TreatmentID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Tratamiento_Reposo 'UPDATE', @TreatmentID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Tratamiento_Reposo WHERE TreatmentID = @TreatmentID FOR JSON AUTO);

        DELETE FROM Tratamiento_Reposo
        WHERE TreatmentID = @TreatmentID;

        EXEC SP_AUDITORIA_Tratamiento_Reposo 'DELETE', @TreatmentID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Tratamiento_Reposo;
    END
END