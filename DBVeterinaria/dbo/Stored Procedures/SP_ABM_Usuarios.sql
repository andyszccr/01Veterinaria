
CREATE   PROCEDURE SP_ABM_Usuarios
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @UserCode INT = NULL,
    @UserID int = NULL,
    @UserName varchar(150) = NULL,
    @UserLastName varchar(150) = NULL,
    @UserEmail varchar(255) = NULL,
    @UserPhone varchar(50) = NULL,
    @UserAddress varchar(300) = NULL,
    @UserStatus bit = NULL,
    @RoleID int = NULL,
    @ProvinceID int = NULL,
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
        INSERT INTO Usuarios ([UserName], [UserLastName], [UserEmail], [UserPhone], [UserAddress], [UserStatus], [RoleID], [ProvinceID], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy])
        VALUES (@UserName, @UserLastName, @UserEmail, @UserPhone, @UserAddress, @UserStatus, @RoleID, @ProvinceID, @CreatedAt, @CreatedBy, @ModifiedAt, @ModifiedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Usuarios WHERE UserCode = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Usuarios 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Usuarios WHERE UserCode = @UserCode FOR JSON AUTO);

        UPDATE Usuarios
        SET [UserName] = @UserName, [UserLastName] = @UserLastName, [UserEmail] = @UserEmail, [UserPhone] = @UserPhone, [UserAddress] = @UserAddress, [UserStatus] = @UserStatus, [RoleID] = @RoleID, [ProvinceID] = @ProvinceID, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy, [ModifiedAt] = @ModifiedAt, [ModifiedBy] = @ModifiedBy
        WHERE UserCode = @UserCode;

        SET @Nuevo = (SELECT * FROM Usuarios WHERE UserCode = @UserCode FOR JSON AUTO);

        EXEC SP_AUDITORIA_Usuarios 'UPDATE', @UserCode, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Usuarios WHERE UserCode = @UserCode FOR JSON AUTO);

        DELETE FROM Usuarios
        WHERE UserCode = @UserCode;

        EXEC SP_AUDITORIA_Usuarios 'DELETE', @UserCode, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Usuarios;
    END
END