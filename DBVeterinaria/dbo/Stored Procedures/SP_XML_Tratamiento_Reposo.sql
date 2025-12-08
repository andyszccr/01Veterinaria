CREATE   PROCEDURE SP_XML_Tratamiento_Reposo
(
    @TreatmentID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @TreatmentID IS NULL
    BEGIN
        SELECT *
        FROM Tratamiento_Reposo
        FOR XML PATH('Item'), ROOT('Tratamiento_Reposo'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Tratamiento_Reposo
        WHERE TreatmentID = @TreatmentID
        FOR XML PATH('Item'), ROOT('Tratamiento_Reposo'), TYPE;
    END
END