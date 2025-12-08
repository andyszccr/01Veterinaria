CREATE   PROCEDURE SP_XML_Actividad
(
    @ActividadID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @ActividadID IS NULL
    BEGIN
        SELECT *
        FROM Actividad
        FOR XML PATH('Item'), ROOT('Actividad'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Actividad
        WHERE ActividadID = @ActividadID
        FOR XML PATH('Item'), ROOT('Actividad'), TYPE;
    END
END