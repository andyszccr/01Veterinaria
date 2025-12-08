CREATE   PROCEDURE SP_XML_Clasificacion_Detalle
(
    @ClasificacionDetalleID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @ClasificacionDetalleID IS NULL
    BEGIN
        SELECT *
        FROM Clasificacion_Detalle
        FOR XML PATH('Item'), ROOT('Clasificacion_Detalle'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Clasificacion_Detalle
        WHERE ClasificacionDetalleID = @ClasificacionDetalleID
        FOR XML PATH('Item'), ROOT('Clasificacion_Detalle'), TYPE;
    END
END