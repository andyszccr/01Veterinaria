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
@accion			varchar(50) output,
@campo			varchar(100) NULL 
)
as
IF (@accion = '0')
BEGIN 
		IF(@campo is not null)
		BEGIN 
			SELECT @campo FROM Users;
		END;	
	ELSE 
		BEGIN
			SELECT * FROM Users;
		END;
END;
GO

