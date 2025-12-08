CREATE   PROCEDURE SP_XML_Clasificacion_Habitat
(
    @HabitatID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @HabitatID IS NULL
    BEGIN
        SELECT *
        FROM Clasificacion_Habitat
        FOR XML PATH('Item'), ROOT('Clasificacion_Habitat'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Clasificacion_Habitat
        WHERE HabitatID = @HabitatID
        FOR XML PATH('Item'), ROOT('Clasificacion_Habitat'), TYPE;
    END
END