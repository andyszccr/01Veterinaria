CREATE PROCEDURE SPCatalogoPets
(
@PetCode		varchar(5)	,
@PetName		varchar(100),
@PetAge			int			,
@PetCreate		datetime	,
@PetUpdate		datetime	,
@PetDelete		datetime	,
@PetStatus		bit			,
@RaceID			int			,
@UserID			int			,
@accion			varchar(50) output
)
as
IF (@accion='0')
BEGIN
	SELECT * FROM Pets;
END;