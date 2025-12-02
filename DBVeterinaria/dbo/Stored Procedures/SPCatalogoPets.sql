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
@accion			varchar(50) output,
@campo			varchar(100) NULL 
)
as
IF (@accion='0')
BEGIN
	IF(@campo is not null)
		BEGIN 
			SELECT @campo FROM Pets;
		END;	
	ELSE 
		BEGIN
			SELECT * FROM Pets;
		END; 
END;