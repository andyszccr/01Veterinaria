/* ============================================================
   GENERADOR DE SP_XML PARA TODAS LAS TABLAS
   - Crea SP_XML_<Tabla> solo si NO existe
   - Detecta PK automáticamente
   - Evita tablas Auditoría
   ============================================================ */

---------------------------------------------------------------
-- 1) SPGenerarXML
---------------------------------------------------------------
CREATE   PROCEDURE SPGenerarXML
(
    @Tabla SYSNAME
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @PK SYSNAME,
        @SPName SYSNAME,
        @SQL nvarchar(max) = '';

    ----------------------------------------------------------
    -- Nombre del SP a crear
    ----------------------------------------------------------
    SET @SPName = 'SP_XML_' + @Tabla;

    ----------------------------------------------------------
    -- Verificar si el SP ya existe
    ----------------------------------------------------------
    IF EXISTS (
        SELECT 1 
        FROM sys.procedures 
        WHERE name = @SPName
    )
    BEGIN
        PRINT '⏩ ' + @SPName + ' ya existe. Se omite.';
        RETURN;
    END

    ----------------------------------------------------------
    -- Obtener la PK de la tabla
    ----------------------------------------------------------
    SELECT @PK = COLUMN_NAME
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE TABLE_NAME = @Tabla;

    IF @PK IS NULL
        SET @PK = 'ID';  -- fallback si no hay PK

    ----------------------------------------------------------
    -- Generar SQL dinámico del SP_XML
    ----------------------------------------------------------
    SET @SQL = 
'CREATE PROCEDURE ' + @SPName + '
(
    @' + @PK + ' INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @' + @PK + ' IS NULL
    BEGIN
        SELECT *
        FROM ' + @Tabla + '
        FOR XML PATH(''Item''), ROOT(''' + @Tabla + '''), TYPE;
    END
    ELSE
    BEGIN
        SELECT *
        FROM ' + @Tabla + '
        WHERE ' + @PK + ' = @' + @PK + '
        FOR XML PATH(''Item''), ROOT(''' + @Tabla + '''), TYPE;
    END
END';

    ----------------------------------------------------------
    -- Ejecutar creación del SP
    ----------------------------------------------------------
    EXEC(@SQL);

    PRINT '✔ ' + @SPName + ' creado correctamente.';
END;