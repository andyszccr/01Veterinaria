
CREATE   PROCEDURE SP_ABM_Clasificacion_Habitat
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @HabitatID INT = NULL,
    @ClasificacionID int = NULL,
    @CreatedAt datetime2 = NULL,
    @CreatedBy int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Clasificacion_Habitat ([ClasificacionID], [CreatedAt], [CreatedBy])
        VALUES (@ClasificacionID, @CreatedAt, @CreatedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Clasificacion_Habitat WHERE HabitatID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Clasificacion_Habitat 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Clasificacion_Habitat WHERE HabitatID = @HabitatID FOR JSON AUTO);

        UPDATE Clasificacion_Habitat
        SET [ClasificacionID] = @ClasificacionID, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy
        WHERE HabitatID = @HabitatID;

        SET @Nuevo = (SELECT * FROM Clasificacion_Habitat WHERE HabitatID = @HabitatID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Clasificacion_Habitat 'UPDATE', @HabitatID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Clasificacion_Habitat WHERE HabitatID = @HabitatID FOR JSON AUTO);

        DELETE FROM Clasificacion_Habitat
        WHERE HabitatID = @HabitatID;

        EXEC SP_AUDITORIA_Clasificacion_Habitat 'DELETE', @HabitatID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Clasificacion_Habitat;
    END
END