CREATE PROCEDURE [dbo].[SPCatalogoRoles]
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
if (@accion ='0')
BEGIN
SELECT * FROM Roles;
END;