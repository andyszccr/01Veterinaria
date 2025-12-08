CREATE   PROCEDURE SP_XML_Roles
(
    @RoleCode INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @RoleCode IS NULL
    BEGIN
        SELECT *
        FROM Roles
        FOR XML PATH('Item'), ROOT('Roles'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Roles
        WHERE RoleCode = @RoleCode
        FOR XML PATH('Item'), ROOT('Roles'), TYPE;
    END
END