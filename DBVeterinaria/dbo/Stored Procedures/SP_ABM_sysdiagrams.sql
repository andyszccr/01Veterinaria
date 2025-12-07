
CREATE   PROCEDURE SP_ABM_sysdiagrams
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @principal_id INT = NULL,
    @name nvarchar(128) = NULL,
    @diagram_id int = NULL,
    @version int = NULL,
    @definition varbinary(MAX) = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO sysdiagrams ([name], [version], [definition])
        VALUES (@name, @version, @definition);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM sysdiagrams WHERE principal_id = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_sysdiagrams 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM sysdiagrams WHERE principal_id = @principal_id FOR JSON AUTO);

        UPDATE sysdiagrams
        SET [name] = @name, [version] = @version, [definition] = @definition
        WHERE principal_id = @principal_id;

        SET @Nuevo = (SELECT * FROM sysdiagrams WHERE principal_id = @principal_id FOR JSON AUTO);

        EXEC SP_AUDITORIA_sysdiagrams 'UPDATE', @principal_id, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM sysdiagrams WHERE principal_id = @principal_id FOR JSON AUTO);

        DELETE FROM sysdiagrams
        WHERE principal_id = @principal_id;

        EXEC SP_AUDITORIA_sysdiagrams 'DELETE', @principal_id, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM sysdiagrams;
    END
END