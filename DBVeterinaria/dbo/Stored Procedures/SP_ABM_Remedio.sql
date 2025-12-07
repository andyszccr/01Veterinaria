
CREATE   PROCEDURE SP_ABM_Remedio
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @RemedioID INT = NULL,
    @TipoRemedio varchar(250) = NULL,
    @CreatedAt datetime2 = NULL,
    @CreatedBy int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Remedio ([TipoRemedio], [CreatedAt], [CreatedBy])
        VALUES (@TipoRemedio, @CreatedAt, @CreatedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Remedio WHERE RemedioID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Remedio 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Remedio WHERE RemedioID = @RemedioID FOR JSON AUTO);

        UPDATE Remedio
        SET [TipoRemedio] = @TipoRemedio, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy
        WHERE RemedioID = @RemedioID;

        SET @Nuevo = (SELECT * FROM Remedio WHERE RemedioID = @RemedioID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Remedio 'UPDATE', @RemedioID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Remedio WHERE RemedioID = @RemedioID FOR JSON AUTO);

        DELETE FROM Remedio
        WHERE RemedioID = @RemedioID;

        EXEC SP_AUDITORIA_Remedio 'DELETE', @RemedioID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Remedio;
    END
END