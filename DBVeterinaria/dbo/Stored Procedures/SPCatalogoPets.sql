

/* ============================================================
   SP: CATALOGO PETS
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
            DECLARE @SQL NVARCHAR(MAX);
            SET @SQL = N'SELECT ' + QUOTENAME(@campo) + ' FROM Pets;';
            EXEC (@SQL);
        END	
        ELSE 
        BEGIN
            SELECT * FROM Pets;
        END
    END
END;