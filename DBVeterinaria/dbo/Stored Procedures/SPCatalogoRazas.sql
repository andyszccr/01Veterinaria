
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
if(@accion ='0')
begin
 select * from Race;
end;