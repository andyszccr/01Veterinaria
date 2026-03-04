
--EXEC SPCatalogoRazas '','PITBULL2',null,null,null,1,'1';

--select * from Race

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
if (@accion='1')
begin

	declare @codnuevo varchar(5), @codmax varchar(5)
	set @codmax = (select max(PetCode) from Pets with(nolock))
	set @codmax = isnull(@codmax,'P0000')
	set @codnuevo = 'P'+RIGHT(RIGHT(@codmax,4)+10001,4)
	

	INSERT INTO Pets
    (
		PetCode
        ,PetName
        ,PetAge
        ,PetCreate
        ,PetStatus
        ,RaceID
        ,UserID
	)
	values
	(
		@codnuevo		,
		@PetName		,
		@PetAge			,
		@PetCreate		,
		@PetStatus		,
		@RaceID			,
		@UserID			
	)
	
	set @accion='Se genero el código de mascotas: ' +@codnuevo
	print @accion;
end
else if (@accion='2')
begin
	update p 
	set 
		p.PetName	=@PetName		,	
		p.PetAge	=@PetAge		,	
		p.PetStatus	=@PetStatus		,
		p.PetUpdate	=@PetUpdate		
	from Pets p with(nolock)
	where 
		p.PetCode=@PetCode

	set @accion='Se modifico la mascota: ' +@PetCode
end
else if (@accion='3')
begin
	update p 
	set 
		p.PetStatus	=0,
		p.PetDelete =@PetDelete
	from Pets p with(nolock)
	where 
		p.PetCode=@PetCode
end