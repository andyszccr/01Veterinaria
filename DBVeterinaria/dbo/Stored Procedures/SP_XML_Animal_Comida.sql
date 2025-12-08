CREATE   PROCEDURE SP_XML_Animal_Comida
(
    @ComidaID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @ComidaID IS NULL
    BEGIN
        SELECT *
        FROM Animal_Comida
        FOR XML PATH('Item'), ROOT('Animal_Comida'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Animal_Comida
        WHERE ComidaID = @ComidaID
        FOR XML PATH('Item'), ROOT('Animal_Comida'), TYPE;
    END
END