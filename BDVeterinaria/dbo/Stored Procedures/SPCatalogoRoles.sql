

--EXEC SPCatalogoRoles '','Administrador',null,null,null,1,'1';

--select * from Roles

Create PROCEDURE [dbo].[SPCatalogoRoles]
(
@RoleCode	varchar(5)	,
@RoleName	varchar(100),
@RoleCreate	datetime	,
@RoleUpdate	datetime	,
@RoleDelete	datetime	,
@RoleStatus	bit			,
@accion			varchar(50) output
)
as
if (@accion='1')
begin

	declare @codnuevo varchar(5), @codmax varchar(5)
	set @codmax = (select max(RoleCode) from Roles with(nolock))
	set @codmax = isnull(@codmax,'R0000')
	set @codnuevo = 'R'+RIGHT(RIGHT(@codmax,4)+10001,4)
	
	INSERT INTO Roles
    (	
		RoleCode	,
		RoleName	,
		RoleCreate	,
		RoleUpdate	,	
		RoleDelete	,
		RoleStatus
	)
	values
	(
		@codnuevo		,
		@RoleName		,
		@RoleCreate		,
		@RoleUpdate		,
		@RoleDelete		,
		@RoleStatus		
	)
	
	set @accion='Se genero el código de mascotas: ' +@codnuevo
	print @accion;
end
else if (@accion='2')
begin
	UPDATE r
   SET 
		r.RoleName		= @RoleName		,
		r.RoleUpdate	= @RoleUpdate	, 
		r.RoleStatus	= @RoleStatus	 
	from Roles r with(nolock)
	where 
		r.RoleCode = @RoleCode		

	set @accion='Se modifico la mascota: ' +@RoleCode
end
else if (@accion='3')
begin
		UPDATE r
   SET 	
		r.RoleDelete	= @RoleDelete	, 
		r.RoleStatus	= 0	 
	from Roles r with(nolock)
	where 
		r.RoleCode = @RoleCode	
end