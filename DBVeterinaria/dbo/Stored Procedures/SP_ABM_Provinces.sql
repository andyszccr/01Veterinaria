
CREATE   PROCEDURE SP_ABM_Provinces
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @ProvinceCode INT = NULL,
    @ProvinceID int = NULL,
    @ProvinceName varchar(150) = NULL,
    @ProvinceStatus bit = NULL,
    @CreatedAt datetime2 = NULL,
    @CreatedBy int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Provinces ([ProvinceName], [ProvinceStatus], [CreatedAt], [CreatedBy])
        VALUES (@ProvinceName, @ProvinceStatus, @CreatedAt, @CreatedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Provinces WHERE ProvinceCode = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Provinces 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Provinces WHERE ProvinceCode = @ProvinceCode FOR JSON AUTO);

        UPDATE Provinces
        SET [ProvinceName] = @ProvinceName, [ProvinceStatus] = @ProvinceStatus, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy
        WHERE ProvinceCode = @ProvinceCode;

        SET @Nuevo = (SELECT * FROM Provinces WHERE ProvinceCode = @ProvinceCode FOR JSON AUTO);

        EXEC SP_AUDITORIA_Provinces 'UPDATE', @ProvinceCode, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Provinces WHERE ProvinceCode = @ProvinceCode FOR JSON AUTO);

        DELETE FROM Provinces
        WHERE ProvinceCode = @ProvinceCode;

        EXEC SP_AUDITORIA_Provinces 'DELETE', @ProvinceCode, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Provinces;
    END
END