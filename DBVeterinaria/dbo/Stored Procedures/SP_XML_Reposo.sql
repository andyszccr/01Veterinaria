CREATE   PROCEDURE SP_XML_Reposo
(
    @ReposoID INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @ReposoID IS NULL
    BEGIN
        SELECT *
        FROM Reposo
        FOR XML PATH('Item'), ROOT('Reposo'), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Reposo
        WHERE ReposoID = @ReposoID
        FOR XML PATH('Item'), ROOT('Reposo'), TYPE;
    END
END