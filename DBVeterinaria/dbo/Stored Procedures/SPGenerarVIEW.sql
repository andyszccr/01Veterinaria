/* ============================================================
   GENERADOR AUTOMÁTICO DE VIEWS (CORREGIDO)
   - Alias únicos por FK
   - JOIN automáticos
   - Solo crea si NO existe
   ============================================================ */

---------------------------------------------------------------
-- 1) SPGenerarVIEW
---------------------------------------------------------------
CREATE   PROCEDURE SPGenerarVIEW
(
    @Tabla SYSNAME
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @ViewName SYSNAME,
        @SQL nvarchar(max) = '',
        @SQL_JOINS nvarchar(max) = '',
        @SQL_SELECT nvarchar(max) = '';

    ----------------------------------------------------------
    -- Nombre de vista
    ----------------------------------------------------------
    SET @ViewName = 'vw_' + @Tabla;

    ----------------------------------------------------------
    -- Evitar recrear vistas existentes
    ----------------------------------------------------------
    IF EXISTS (SELECT 1 FROM sys.views WHERE name = @ViewName)
    BEGIN
        PRINT '⏩ ' + @ViewName + ' ya existe. Se omite.';
        RETURN;
    END

    ----------------------------------------------------------
    -- SELECT de la tabla base
    ----------------------------------------------------------
    SELECT @SQL_SELECT = STRING_AGG('t.' + QUOTENAME(c.name), ', ')
    FROM sys.columns c
    WHERE c.object_id = OBJECT_ID(@Tabla);

    ----------------------------------------------------------
    -- JOINs con alias únicos según nombre de la columna FK
    ----------------------------------------------------------
    SELECT 
        @SQL_JOINS = STRING_AGG(
            'LEFT JOIN ' + QUOTENAME(OBJECT_NAME(fk.referenced_object_id)) + ' r_' + c1.name +
            ' ON t.' + QUOTENAME(c1.name) + ' = r_' + c1.name + '.' + QUOTENAME(c2.name)
        , CHAR(10))
    FROM sys.foreign_key_columns fk
    INNER JOIN sys.columns c1 
        ON c1.column_id = fk.parent_column_id
       AND c1.object_id = fk.parent_object_id
    INNER JOIN sys.columns c2
        ON c2.column_id = fk.referenced_column_id
       AND c2.object_id = fk.referenced_object_id
    WHERE fk.parent_object_id = OBJECT_ID(@Tabla);

    IF @SQL_JOINS IS NULL SET @SQL_JOINS = '';

    ----------------------------------------------------------
    -- Crear VIEW final
    ----------------------------------------------------------
    SET @SQL = '
CREATE VIEW ' + @ViewName + ' AS
SELECT 
    ' + @SQL_SELECT + '
FROM ' + @Tabla + ' t
' + @SQL_JOINS + ';
';

    EXEC(@SQL);

    PRINT '✔ ' + @ViewName + ' creada correctamente.';
END;