CREATE   PROCEDURE SP_XML_Treatment
(
    @TreatmentCode INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @TreatmentCode IS NULL
    BEGIN
        SELECT *
        FROM Treatment
        FOR XML PATH('Item'), ROOT('Treatment'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Treatment
        WHERE TreatmentCode = @TreatmentCode
        FOR XML PATH('Item'), ROOT('Treatment'), TYPE;
    END
END