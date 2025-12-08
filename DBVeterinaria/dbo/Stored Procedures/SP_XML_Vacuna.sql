CREATE   PROCEDURE SP_XML_Vacuna
(
    @VacunaID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @VacunaID IS NULL
    BEGIN
        SELECT *
        FROM Vacuna
        FOR XML PATH('Item'), ROOT('Vacuna'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Vacuna
        WHERE VacunaID = @VacunaID
        FOR XML PATH('Item'), ROOT('Vacuna'), TYPE;
    END
END