CREATE   PROCEDURE SP_XML_Tratamiento_Vacuna
(
    @VacunaID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @VacunaID IS NULL
    BEGIN
        SELECT *
        FROM Tratamiento_Vacuna
        FOR XML PATH('Item'), ROOT('Tratamiento_Vacuna'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Tratamiento_Vacuna
        WHERE VacunaID = @VacunaID
        FOR XML PATH('Item'), ROOT('Tratamiento_Vacuna'), TYPE;
    END
END