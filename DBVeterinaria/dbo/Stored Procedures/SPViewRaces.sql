
CREATE PROCEDURE SPViewRaces
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select 
		r.RaceCode							[Codigo de Raza]		,
		r.RaceName							[Raza]					,
		CONVERT(varchar,r.RaceCreate,22)	[Fecha Creacion]		,
		CONVERT(varchar,r.RaceUpdate,22)	[Fecha Actualizacion]	,
		CONVERT(varchar,r.RaceDelete,22)	[Fecha Eliminacion]		,
		case 
			when r.RaceStatus=1 then 'Activo'
		else	'Inactivo'
		end									[Estado]
	from Race r with(nolock)
	where 
		r.RaceStatus=0
END