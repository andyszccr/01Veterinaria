
CREATE   PROCEDURE SP_ABM_Habitat
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @HabitatID INT = NULL,
    @HabitatName varchar(150) = NULL,
    @Description varchar(500) = NULL,
    @TemperaturaMin decimal(5,2) = NULL,
    @TemperaturaMax decimal(5,2) = NULL,
    @HumedadMin int = NULL,
    @HumedadMax int = NULL,
    @CreatedAt datetime2 = NULL,
    @CreatedBy int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Habitat ([HabitatName], [Description], [TemperaturaMin], [TemperaturaMax], [HumedadMin], [HumedadMax], [CreatedAt], [CreatedBy])
        VALUES (@HabitatName, @Description, @TemperaturaMin, @TemperaturaMax, @HumedadMin, @HumedadMax, @CreatedAt, @CreatedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Habitat WHERE HabitatID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Habitat 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Habitat WHERE HabitatID = @HabitatID FOR JSON AUTO);

        UPDATE Habitat
        SET [HabitatName] = @HabitatName, [Description] = @Description, [TemperaturaMin] = @TemperaturaMin, [TemperaturaMax] = @TemperaturaMax, [HumedadMin] = @HumedadMin, [HumedadMax] = @HumedadMax, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy
        WHERE HabitatID = @HabitatID;

        SET @Nuevo = (SELECT * FROM Habitat WHERE HabitatID = @HabitatID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Habitat 'UPDATE', @HabitatID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Habitat WHERE HabitatID = @HabitatID FOR JSON AUTO);

        DELETE FROM Habitat
        WHERE HabitatID = @HabitatID;

        EXEC SP_AUDITORIA_Habitat 'DELETE', @HabitatID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Habitat;
    END
END