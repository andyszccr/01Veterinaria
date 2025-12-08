CREATE   PROCEDURE SP_XML_Medicine
(
    @MedicineCode INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @MedicineCode IS NULL
    BEGIN
        SELECT *
        FROM Medicine
        FOR XML PATH('Item'), ROOT('Medicine'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Medicine
        WHERE MedicineCode = @MedicineCode
        FOR XML PATH('Item'), ROOT('Medicine'), TYPE;
    END
END