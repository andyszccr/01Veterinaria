
CREATE   PROCEDURE SP_ABM_Clasificacion_Detalle
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @ClasificacionDetalleID INT = NULL,
    @ClasificacionID int = NULL,
    @NivelTaxonomico varchar(30) = NULL,
    @Subnivel varchar(50) = NULL,
    @NombreNivel varchar(200) = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Clasificacion_Detalle ([ClasificacionID], [NivelTaxonomico], [Subnivel], [NombreNivel])
        VALUES (@ClasificacionID, @NivelTaxonomico, @Subnivel, @NombreNivel);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Clasificacion_Detalle WHERE ClasificacionDetalleID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Clasificacion_Detalle 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Clasificacion_Detalle WHERE ClasificacionDetalleID = @ClasificacionDetalleID FOR JSON AUTO);

        UPDATE Clasificacion_Detalle
        SET [ClasificacionID] = @ClasificacionID, [NivelTaxonomico] = @NivelTaxonomico, [Subnivel] = @Subnivel, [NombreNivel] = @NombreNivel
        WHERE ClasificacionDetalleID = @ClasificacionDetalleID;

        SET @Nuevo = (SELECT * FROM Clasificacion_Detalle WHERE ClasificacionDetalleID = @ClasificacionDetalleID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Clasificacion_Detalle 'UPDATE', @ClasificacionDetalleID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Clasificacion_Detalle WHERE ClasificacionDetalleID = @ClasificacionDetalleID FOR JSON AUTO);

        DELETE FROM Clasificacion_Detalle
        WHERE ClasificacionDetalleID = @ClasificacionDetalleID;

        EXEC SP_AUDITORIA_Clasificacion_Detalle 'DELETE', @ClasificacionDetalleID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Clasificacion_Detalle;
    END
END