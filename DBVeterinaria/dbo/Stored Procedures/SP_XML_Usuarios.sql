CREATE   PROCEDURE SP_XML_Usuarios
(
    @UserCode INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @UserCode IS NULL
    BEGIN
        SELECT *
        FROM Usuarios
        FOR XML PATH('Item'), ROOT('Usuarios'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Usuarios
        WHERE UserCode = @UserCode
        FOR XML PATH('Item'), ROOT('Usuarios'), TYPE;
    END
END