CREATE   PROCEDURE SP_XML_Comida
(
    @ComidaID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @ComidaID IS NULL
    BEGIN
        SELECT *
        FROM Comida
        FOR XML PATH('Item'), ROOT('Comida'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Comida
        WHERE ComidaID = @ComidaID
        FOR XML PATH('Item'), ROOT('Comida'), TYPE;
    END
END