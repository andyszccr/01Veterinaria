CREATE   PROCEDURE SP_XML_Tratamiento_Medicine
(
    @TreatmentID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @TreatmentID IS NULL
    BEGIN
        SELECT *
        FROM Tratamiento_Medicine
        FOR XML PATH('Item'), ROOT('Tratamiento_Medicine'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Tratamiento_Medicine
        WHERE TreatmentID = @TreatmentID
        FOR XML PATH('Item'), ROOT('Tratamiento_Medicine'), TYPE;
    END
END