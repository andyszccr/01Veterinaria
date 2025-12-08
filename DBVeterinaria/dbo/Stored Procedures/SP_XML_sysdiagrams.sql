CREATE   PROCEDURE SP_XML_sysdiagrams
(
    @principal_id INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @principal_id IS NULL
    BEGIN
        SELECT *
        FROM sysdiagrams
        FOR XML PATH('Item'), ROOT('sysdiagrams'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM sysdiagrams
        WHERE principal_id = @principal_id
        FOR XML PATH('Item'), ROOT('sysdiagrams'), TYPE;
    END
END