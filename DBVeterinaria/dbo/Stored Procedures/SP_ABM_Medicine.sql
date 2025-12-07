
CREATE   PROCEDURE SP_ABM_Medicine
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @MedicineCode INT = NULL,
    @MedicineID int = NULL,
    @MedicineName varchar(250) = NULL,
    @MedicineStatus bit = NULL,
    @CreatedAt datetime2 = NULL,
    @CreatedBy int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Medicine ([MedicineName], [MedicineStatus], [CreatedAt], [CreatedBy])
        VALUES (@MedicineName, @MedicineStatus, @CreatedAt, @CreatedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Medicine WHERE MedicineCode = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Medicine 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Medicine WHERE MedicineCode = @MedicineCode FOR JSON AUTO);

        UPDATE Medicine
        SET [MedicineName] = @MedicineName, [MedicineStatus] = @MedicineStatus, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy
        WHERE MedicineCode = @MedicineCode;

        SET @Nuevo = (SELECT * FROM Medicine WHERE MedicineCode = @MedicineCode FOR JSON AUTO);

        EXEC SP_AUDITORIA_Medicine 'UPDATE', @MedicineCode, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Medicine WHERE MedicineCode = @MedicineCode FOR JSON AUTO);

        DELETE FROM Medicine
        WHERE MedicineCode = @MedicineCode;

        EXEC SP_AUDITORIA_Medicine 'DELETE', @MedicineCode, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Medicine;
    END
END