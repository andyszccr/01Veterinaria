CREATE   PROCEDURE SP_XML_Clasificacion
(
    @ClasificacionID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @ClasificacionID IS NULL
    BEGIN
        SELECT *
        FROM Clasificacion
        FOR XML PATH('Item'), ROOT('Clasificacion'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Clasificacion
        WHERE ClasificacionID = @ClasificacionID
        FOR XML PATH('Item'), ROOT('Clasificacion'), TYPE;
    END
END