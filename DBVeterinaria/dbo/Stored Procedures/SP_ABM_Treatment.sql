
CREATE   PROCEDURE SP_ABM_Treatment
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @TreatmentCode INT = NULL,
    @TreatmentID int = NULL,
    @TreatmentName varchar(250) = NULL,
    @TipoTratamiento varchar(50) = NULL,
    @TreatmentAge int = NULL,
    @TreatmentStatus bit = NULL,
    @CreatedAt datetime2 = NULL,
    @CreatedBy int = NULL,
    @ModifiedAt datetime2 = NULL,
    @ModifiedBy int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Treatment ([TreatmentName], [TipoTratamiento], [TreatmentAge], [TreatmentStatus], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy])
        VALUES (@TreatmentName, @TipoTratamiento, @TreatmentAge, @TreatmentStatus, @CreatedAt, @CreatedBy, @ModifiedAt, @ModifiedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Treatment WHERE TreatmentCode = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Treatment 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Treatment WHERE TreatmentCode = @TreatmentCode FOR JSON AUTO);

        UPDATE Treatment
        SET [TreatmentName] = @TreatmentName, [TipoTratamiento] = @TipoTratamiento, [TreatmentAge] = @TreatmentAge, [TreatmentStatus] = @TreatmentStatus, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy, [ModifiedAt] = @ModifiedAt, [ModifiedBy] = @ModifiedBy
        WHERE TreatmentCode = @TreatmentCode;

        SET @Nuevo = (SELECT * FROM Treatment WHERE TreatmentCode = @TreatmentCode FOR JSON AUTO);

        EXEC SP_AUDITORIA_Treatment 'UPDATE', @TreatmentCode, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Treatment WHERE TreatmentCode = @TreatmentCode FOR JSON AUTO);

        DELETE FROM Treatment
        WHERE TreatmentCode = @TreatmentCode;

        EXEC SP_AUDITORIA_Treatment 'DELETE', @TreatmentCode, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Treatment;
    END
END