
CREATE   PROCEDURE SP_ABM_Clasificacion
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @ClasificacionID INT = NULL,
    @Nombre varchar(200) = NULL,
    @TipoNivel varchar(50) = NULL,
    @ParentID int = NULL,
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
        INSERT INTO Clasificacion ([Nombre], [TipoNivel], [ParentID], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy])
        VALUES (@Nombre, @TipoNivel, @ParentID, @CreatedAt, @CreatedBy, @ModifiedAt, @ModifiedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Clasificacion WHERE ClasificacionID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Clasificacion 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Clasificacion WHERE ClasificacionID = @ClasificacionID FOR JSON AUTO);

        UPDATE Clasificacion
        SET [Nombre] = @Nombre, [TipoNivel] = @TipoNivel, [ParentID] = @ParentID, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy, [ModifiedAt] = @ModifiedAt, [ModifiedBy] = @ModifiedBy
        WHERE ClasificacionID = @ClasificacionID;

        SET @Nuevo = (SELECT * FROM Clasificacion WHERE ClasificacionID = @ClasificacionID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Clasificacion 'UPDATE', @ClasificacionID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Clasificacion WHERE ClasificacionID = @ClasificacionID FOR JSON AUTO);

        DELETE FROM Clasificacion
        WHERE ClasificacionID = @ClasificacionID;

        EXEC SP_AUDITORIA_Clasificacion 'DELETE', @ClasificacionID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Clasificacion;
    END
END