CREATE PROCEDURE SP_XML_TipoTratamiento
(
    @TipoTratamientoCode INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @TipoTratamientoCode IS NULL
    BEGIN
        SELECT *
        FROM TipoTratamiento
        FOR XML PATH('Item'), ROOT('TipoTratamiento'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM TipoTratamiento
        WHERE TipoTratamientoCode = @TipoTratamientoCode
        FOR XML PATH('Item'), ROOT('TipoTratamiento'), TYPE;
    END
END