
CREATE   PROCEDURE SP_ABM_Tratamiento_Medicine
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @TreatmentID INT = NULL,
    @MedicineID int = NULL,
    @Dosis varchar(200) = NULL,
    @Frecuencia varchar(100) = NULL,
    @Duracion varchar(100) = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Tratamiento_Medicine ([MedicineID], [Dosis], [Frecuencia], [Duracion])
        VALUES (@MedicineID, @Dosis, @Frecuencia, @Duracion);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Tratamiento_Medicine WHERE TreatmentID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Tratamiento_Medicine 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Tratamiento_Medicine WHERE TreatmentID = @TreatmentID FOR JSON AUTO);

        UPDATE Tratamiento_Medicine
        SET [MedicineID] = @MedicineID, [Dosis] = @Dosis, [Frecuencia] = @Frecuencia, [Duracion] = @Duracion
        WHERE TreatmentID = @TreatmentID;

        SET @Nuevo = (SELECT * FROM Tratamiento_Medicine WHERE TreatmentID = @TreatmentID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Tratamiento_Medicine 'UPDATE', @TreatmentID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Tratamiento_Medicine WHERE TreatmentID = @TreatmentID FOR JSON AUTO);

        DELETE FROM Tratamiento_Medicine
        WHERE TreatmentID = @TreatmentID;

        EXEC SP_AUDITORIA_Tratamiento_Medicine 'DELETE', @TreatmentID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Tratamiento_Medicine;
    END
END