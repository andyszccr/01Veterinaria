
CREATE   PROCEDURE SP_ABM_Animal_Treatment
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @AnimalTreatmentID INT = NULL,
    @AnimalID int = NULL,
    @TreatmentID int = NULL,
    @FechaInicio datetime2 = NULL,
    @FechaFin datetime2 = NULL,
    @Dosis varchar(200) = NULL,
    @Observaciones nvarchar(1000) = NULL,
    @AppliedBy int = NULL,
    @CreatedAt datetime2 = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Animal_Treatment ([AnimalID], [TreatmentID], [FechaInicio], [FechaFin], [Dosis], [Observaciones], [AppliedBy], [CreatedAt])
        VALUES (@AnimalID, @TreatmentID, @FechaInicio, @FechaFin, @Dosis, @Observaciones, @AppliedBy, @CreatedAt);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Animal_Treatment WHERE AnimalTreatmentID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Animal_Treatment 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Animal_Treatment WHERE AnimalTreatmentID = @AnimalTreatmentID FOR JSON AUTO);

        UPDATE Animal_Treatment
        SET [AnimalID] = @AnimalID, [TreatmentID] = @TreatmentID, [FechaInicio] = @FechaInicio, [FechaFin] = @FechaFin, [Dosis] = @Dosis, [Observaciones] = @Observaciones, [AppliedBy] = @AppliedBy, [CreatedAt] = @CreatedAt
        WHERE AnimalTreatmentID = @AnimalTreatmentID;

        SET @Nuevo = (SELECT * FROM Animal_Treatment WHERE AnimalTreatmentID = @AnimalTreatmentID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Animal_Treatment 'UPDATE', @AnimalTreatmentID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Animal_Treatment WHERE AnimalTreatmentID = @AnimalTreatmentID FOR JSON AUTO);

        DELETE FROM Animal_Treatment
        WHERE AnimalTreatmentID = @AnimalTreatmentID;

        EXEC SP_AUDITORIA_Animal_Treatment 'DELETE', @AnimalTreatmentID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Animal_Treatment;
    END
END