


/* ============================================================
   SP: CATALOGO RAZAS (con múltiples campos)
   ============================================================ */
CREATE PROCEDURE [dbo].[SPCatalogoRazas]
(
    @RaceCode     varchar(5),
    @RaceName     varchar(100),
    @RaceCreate   datetime,
    @RaceUpdate   datetime,
    @RaceDelete   datetime,
    @RaceStatus   bit,
    @accion       varchar(50) OUTPUT,
    @campo        varchar(100) NULL
)
AS
BEGIN
    IF (@accion = '0')
    BEGIN
        IF (@campo IS NOT NULL)
        BEGIN
            DECLARE @ListaSegura NVARCHAR(MAX);
            DECLARE @SQL NVARCHAR(MAX);

            SELECT @ListaSegura =
                STRING_AGG(QUOTENAME(value), ', ')
            FROM STRING_SPLIT(@campo, ',');

            SET @SQL = N'SELECT ' + @ListaSegura + ' FROM Race;';
            EXEC(@SQL);
        END
        ELSE 
        BEGIN
            SELECT * FROM Race;
        END
    END
END;