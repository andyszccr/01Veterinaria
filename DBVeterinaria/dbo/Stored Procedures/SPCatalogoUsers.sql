/* ============================================================
   SP: CATALOGO USERS (con múltiples campos)
   ============================================================ */
CREATE PROCEDURE SPCatalogoUsers
(
    @UserCode       varchar(5),	
    @UserName       varchar(100),
    @UserLastName   varchar(100),
    @RoleID         int,
    @UserEmail      varchar(100),
    @UserPhone      int,
    @Useraddress    varchar(200),
    @UserCreate     datetime,
    @UserUpdate     datetime,
    @UserDelete     datetime,
    @UserStatus     bit,
    @ProvinceID     int,
    @accion         varchar(50) OUTPUT,
    @campo          varchar(100) NULL
)
AS
BEGIN
    IF (@accion = '0')
    BEGIN
        IF (@campo IS NOT NULL)
        BEGIN
            DECLARE @ListaSegura NVARCHAR(MAX);
            DECLARE @SQL NVARCHAR(MAX);

            -- Convierte "col1, col2" → [col1], [col2]
            SELECT @ListaSegura =
                STRING_AGG(QUOTENAME(value), ', ')
            FROM STRING_SPLIT(@campo, ',');

            SET @SQL = N'SELECT ' + @ListaSegura + ' FROM Users;';
            EXEC(@SQL);
        END
        ELSE 
        BEGIN
            SELECT * FROM Users;
        END
    END
END;
GO

