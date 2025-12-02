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
IF (@accion = '0')
BEGIN 
	SELECT * FROM Users; 
END;
GO

