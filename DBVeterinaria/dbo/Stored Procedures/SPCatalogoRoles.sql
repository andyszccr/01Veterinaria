

/* ============================================================
   SP: CATALOGO ROLES
   ============================================================ */
CREATE PROCEDURE [dbo].[SPCatalogoRoles]
(
    @RoleCode     varchar(5),
    @RoleName     varchar(100),
    @RoleCreate   datetime,
    @RoleUpdate   datetime,
    @RoleDelete   datetime,
    @RoleStatus   bit,
    @accion       varchar(50) OUTPUT,
    @campo        varchar(100) NULL 
)
AS
BEGIN
    IF (@accion = '0')
    BEGIN
        IF (@campo IS NOT NULL)
        BEGIN
            DECLARE @SQL NVARCHAR(MAX);
            SET @SQL = N'SELECT ' + QUOTENAME(@campo) + ' FROM Roles;';
            EXEC(@SQL);
        END	
        ELSE 
        BEGIN
            SELECT * FROM Roles;
        END
    END
END;