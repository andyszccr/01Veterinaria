
CREATE   PROCEDURE SP_ABM_Roles
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @RoleCode INT = NULL,
    @RoleID int = NULL,
    @RoleName varchar(150) = NULL,
    @RoleStatus bit = NULL,
    @CreatedAt datetime2 = NULL,
    @CreatedBy int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Roles ([RoleName], [RoleStatus], [CreatedAt], [CreatedBy])
        VALUES (@RoleName, @RoleStatus, @CreatedAt, @CreatedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Roles WHERE RoleCode = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Roles 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Roles WHERE RoleCode = @RoleCode FOR JSON AUTO);

        UPDATE Roles
        SET [RoleName] = @RoleName, [RoleStatus] = @RoleStatus, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy
        WHERE RoleCode = @RoleCode;

        SET @Nuevo = (SELECT * FROM Roles WHERE RoleCode = @RoleCode FOR JSON AUTO);

        EXEC SP_AUDITORIA_Roles 'UPDATE', @RoleCode, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Roles WHERE RoleCode = @RoleCode FOR JSON AUTO);

        DELETE FROM Roles
        WHERE RoleCode = @RoleCode;

        EXEC SP_AUDITORIA_Roles 'DELETE', @RoleCode, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Roles;
    END
END