
CREATE   PROCEDURE SP_ABM_Reposo
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @ReposoID INT = NULL,
    @TipoReposo varchar(250) = NULL,
    @CreatedAt datetime2 = NULL,
    @CreatedBy int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Reposo ([TipoReposo], [CreatedAt], [CreatedBy])
        VALUES (@TipoReposo, @CreatedAt, @CreatedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Reposo WHERE ReposoID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Reposo 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Reposo WHERE ReposoID = @ReposoID FOR JSON AUTO);

        UPDATE Reposo
        SET [TipoReposo] = @TipoReposo, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy
        WHERE ReposoID = @ReposoID;

        SET @Nuevo = (SELECT * FROM Reposo WHERE ReposoID = @ReposoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Reposo 'UPDATE', @ReposoID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Reposo WHERE ReposoID = @ReposoID FOR JSON AUTO);

        DELETE FROM Reposo
        WHERE ReposoID = @ReposoID;

        EXEC SP_AUDITORIA_Reposo 'DELETE', @ReposoID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Reposo;
    END
END