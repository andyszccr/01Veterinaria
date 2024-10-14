
CREATE PROCEDURE SPViewRoles
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT 
		r.RoleCode									 [Codigo de Rol]		,
		r.RoleName									 [Rol]					,
		isnull('-',CONVERT(varchar,r.RoleCreate,22)) [Fecha Creacion]		,
		isnull('-',CONVERT(varchar,r.RoleUpdate,22)) [Fecha Modificacion]	,
		isnull('-',CONVERT(varchar,r.RoleDelete,22)) [Fecha Eliminado]		,
		case 
			when r.RoleStatus=1 then 'Activo'
		else	'Inactivo'
		end											 [Estado]
  FROM 
	Roles r with(nolock)
END