CREATE PROCEDURE SPCatalogoUsers
(
@UserCode		varchar(5)		,	
@UserName		varchar(100)	,
@UserLastName	varchar(100)	,
@RoleID			int				,
@UserEmail		varchar(100)	,
@UserPhone		int				,
@Useraddress	varchar(200)	,
@UserCreate		datetime		,
@UserUpdate		datetime		,
@UserDelete		datetime		,
@UserStatus		bit				,
@ProvinceID		int				,
@accion			varchar(50) output
)
as
if (@accion='1')
begin

	declare @codnuevo varchar(5), @codmax varchar(5)
	set @codmax = (select max(UserCode) from Users with(nolock))
	set @codmax = isnull(@codmax,'U0000')
	set @codnuevo = 'U'+RIGHT(RIGHT(@codmax,4)+10001,4)
	

	INSERT INTO Users
   (
		UserCode
        ,UserName
        ,UserLastName
        ,RoleID
        ,UserEmail
        ,UserPhone
        ,Useraddress
        ,UserCreate
        ,UserUpdate
        ,UserDelete
        ,UserStatus
        ,ProvinceID
	)
	values
	(
		@codnuevo		,
		@UserName		,
		@UserLastName	,
		@RoleID			,
		@UserEmail		,
		@UserPhone		,
		@Useraddress	,
		@UserCreate		,
		@UserUpdate		,
		@UserDelete		,
		@UserStatus		,
		@ProvinceID		
	)


	set @accion='Se genero el usuario: ' +@codnuevo
	print @accion;
end
else if (@accion='2')
begin
	update u 
	set 
		u.UserName		=@UserName		,	
		u.UserLastName	=@UserLastName	,	
		u.RoleID		=@RoleID		,
		u.UserEmail		=@UserEmail		,
		u.UserPhone		=@UserPhone		,
		u.Useraddress	=@Useraddress	,
		u.UserStatus	=@UserStatus	,
		U.UserUpdate	=@UserUpdate
	from Users u with(nolock)
	where 
		u.UserCode	= @UserCode

	set @accion='Se modifico el usuario: ' +@codnuevo
end
else if (@accion='3')
begin
	update u 
	set 
		u.UserStatus	=0			,
		U.UserDelete	=@UserUpdate
	from Users u with(nolock)
	where 
		u.UserCode	= @UserCode

	set @accion='Se elimino el usuario: ' +@codnuevo
end
GO

