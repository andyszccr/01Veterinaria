CREATE   PROCEDURE SP_XML_Tratamiento_Remedio
(
    @TreatmentID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @TreatmentID IS NULL
    BEGIN
        SELECT *
        FROM Tratamiento_Remedio
        FOR XML PATH('Item'), ROOT('Tratamiento_Remedio'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Tratamiento_Remedio
        WHERE TreatmentID = @TreatmentID
        FOR XML PATH('Item'), ROOT('Tratamiento_Remedio'), TYPE;
    END
END