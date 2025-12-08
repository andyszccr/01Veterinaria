CREATE   PROCEDURE SP_XML_Animal_Treatment
(
    @AnimalTreatmentID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @AnimalTreatmentID IS NULL
    BEGIN
        SELECT *
        FROM Animal_Treatment
        FOR XML PATH('Item'), ROOT('Animal_Treatment'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Animal_Treatment
        WHERE AnimalTreatmentID = @AnimalTreatmentID
        FOR XML PATH('Item'), ROOT('Animal_Treatment'), TYPE;
    END
END