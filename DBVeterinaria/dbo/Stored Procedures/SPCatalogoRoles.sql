CREATE PROCEDURE [dbo].[SPCatalogoRoles]
(
@RoleCode	varchar(5)	,
@RoleName	varchar(100),
@RoleCreate	datetime	,
@RoleUpdate	datetime	,
@RoleDelete	datetime	,
@RoleStatus	bit			,
@accion			varchar(50) output,
@campo			varchar(100) NULL 
)
as
if (@accion ='0')
BEGIN
	IF(@campo is not null)
		BEGIN 
			SELECT @campo FROM Roles;
		END;	
	ELSE 
		BEGIN
			SELECT * FROM Roles;
		END;
END;