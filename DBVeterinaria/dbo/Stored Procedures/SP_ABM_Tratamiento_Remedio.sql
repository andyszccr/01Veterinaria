
CREATE   PROCEDURE SP_ABM_Tratamiento_Remedio
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @TreatmentID INT = NULL,
    @RemedioID int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Tratamiento_Remedio ([RemedioID])
        VALUES (@RemedioID);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Tratamiento_Remedio WHERE TreatmentID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Tratamiento_Remedio 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Tratamiento_Remedio WHERE TreatmentID = @TreatmentID FOR JSON AUTO);

        UPDATE Tratamiento_Remedio
        SET [RemedioID] = @RemedioID
        WHERE TreatmentID = @TreatmentID;

        SET @Nuevo = (SELECT * FROM Tratamiento_Remedio WHERE TreatmentID = @TreatmentID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Tratamiento_Remedio 'UPDATE', @TreatmentID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Tratamiento_Remedio WHERE TreatmentID = @TreatmentID FOR JSON AUTO);

        DELETE FROM Tratamiento_Remedio
        WHERE TreatmentID = @TreatmentID;

        EXEC SP_AUDITORIA_Tratamiento_Remedio 'DELETE', @TreatmentID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Tratamiento_Remedio;
    END
END