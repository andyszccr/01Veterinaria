CREATE   PROCEDURE SP_XML_Habitat
(
    @HabitatID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @HabitatID IS NULL
    BEGIN
        SELECT *
        FROM Habitat
        FOR XML PATH('Item'), ROOT('Habitat'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Habitat
        WHERE HabitatID = @HabitatID
        FOR XML PATH('Item'), ROOT('Habitat'), TYPE;
    END
END