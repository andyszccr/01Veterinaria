CREATE   PROCEDURE SP_XML_Animal
(
    @AnimalCode INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @AnimalCode IS NULL
    BEGIN
        SELECT *
        FROM Animal
        FOR XML PATH('Item'), ROOT('Animal'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Animal
        WHERE AnimalCode = @AnimalCode
        FOR XML PATH('Item'), ROOT('Animal'), TYPE;
    END
END