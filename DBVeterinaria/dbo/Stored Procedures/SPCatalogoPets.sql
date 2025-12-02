


/* ============================================================
   SP: CATALOGO PETS (con múltiples campos)
   ============================================================ */
CREATE PROCEDURE SPCatalogoPets
(
    @PetCode     varchar(5),
    @PetName     varchar(100),
    @PetAge      int,
    @PetCreate   datetime,
    @PetUpdate   datetime,
    @PetDelete   datetime,
    @PetStatus   bit,
    @RaceID      int,
    @UserID      int,
    @accion      varchar(50) OUTPUT,
    @campo       varchar(100) NULL
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

            SET @SQL = N'SELECT ' + @ListaSegura + ' FROM Pets;';
            EXEC(@SQL);
        END
        ELSE 
        BEGIN
            SELECT * FROM Pets;
        END
    END
END;