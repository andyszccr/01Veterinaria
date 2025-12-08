CREATE   PROCEDURE SP_XML_Provinces
(
    @ProvinceCode INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @ProvinceCode IS NULL
    BEGIN
        SELECT *
        FROM Provinces
        FOR XML PATH('Item'), ROOT('Provinces'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Provinces
        WHERE ProvinceCode = @ProvinceCode
        FOR XML PATH('Item'), ROOT('Provinces'), TYPE;
    END
END