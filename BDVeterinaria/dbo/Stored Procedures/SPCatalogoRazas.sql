--EXEC SPCatalogoRazas '','PITBULL2',null,null,null,1,'1';

--select * from Race

CREATE PROCEDURE [dbo].[SPCatalogoRazas]
(
@RaceCode		varchar(5)		  ,
@RaceName		varchar(100)	  ,
@RaceCreate		datetime		  ,
@RaceUpdate		datetime		  ,
@RaceDelete		datetime		  ,
@RaceStatus		bit				  ,
@accion			varchar(50) output
)
as
if (@accion='1')
begin

	declare @codnuevo varchar(5), @codmax varchar(5)
	set @codmax = (select max(RaceCode) from Race with(nolock))
	set @codmax = isnull(@codmax,'M0000')
	set @codnuevo = 'M'+RIGHT(RIGHT(@codmax,4)+10001,4)
	

	INSERT INTO Race
    (
		[RaceCode]
       ,[RaceName]
       ,[RaceCreate]
       ,[RaceUpdate]
       ,[RaceDelete]
       ,[RaceStatus]
	)
	values
	(
		@codnuevo	,
		@RaceName	,
		@RaceCreate	,	
		@RaceUpdate	,	
		@RaceDelete	,	
		@RaceStatus	
	)
	
	set @accion='Se genero el código de raza: ' +@codnuevo
	print @accion;
end
else if (@accion='2')
begin
	update r 
	set 
		r.RaceName=@RaceName		,	
		r.RaceUpdate=@RaceUpdate	,	
		r.RaceStatus=@RaceStatus	
	from Race r with(nolock)
	where 
		r.RaceCode=@RaceCode

	set @accion='Se modifico la raza: ' +@RaceCode
end
else if (@accion='3')
begin
	update r 
	set 
		r.RaceName=@RaceName		,	
		r.RaceDelete=@RaceDelete	,	
		r.RaceStatus=0
	from Race r with(nolock)
	where 
		r.RaceCode=@RaceCode
end