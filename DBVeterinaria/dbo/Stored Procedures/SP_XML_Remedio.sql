CREATE   PROCEDURE SP_XML_Remedio
(
    @RemedioID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @RemedioID IS NULL
    BEGIN
        SELECT *
        FROM Remedio
        FOR XML PATH('Item'), ROOT('Remedio'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Remedio
        WHERE RemedioID = @RemedioID
        FOR XML PATH('Item'), ROOT('Remedio'), TYPE;
    END
END