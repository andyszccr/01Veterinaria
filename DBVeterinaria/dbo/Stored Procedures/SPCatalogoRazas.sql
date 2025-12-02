CREATE PROCEDURE [dbo].[SPCatalogoRazas]
(
@RaceCode		varchar(5)		  ,
@RaceName		varchar(100)	  ,
@RaceCreate		datetime		  ,
@RaceUpdate		datetime		  ,
@RaceDelete		datetime		  ,
@RaceStatus		bit				  ,
@accion			varchar(50) output,
@campo			varchar(100) NULL 
)
as
if(@accion ='0')
begin
 IF(@campo is not null)
		BEGIN 
			SELECT @campo FROM Race;
		END;	
	ELSE 
		BEGIN
			SELECT * FROM Race;
		END;
end;