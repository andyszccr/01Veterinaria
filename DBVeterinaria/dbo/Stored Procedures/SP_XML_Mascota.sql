CREATE PROCEDURE SP_XML_Mascota
(
    @AnimalID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @AnimalID IS NULL
    BEGIN
        SELECT *
        FROM Mascota
        FOR XML PATH('Item'), ROOT('Mascota'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Mascota
        WHERE AnimalID = @AnimalID
        FOR XML PATH('Item'), ROOT('Mascota'), TYPE;
    END
END