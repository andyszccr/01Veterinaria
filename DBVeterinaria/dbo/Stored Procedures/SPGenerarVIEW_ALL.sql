

---------------------------------------------------------------
-- 2) SPGenerarVIEW_ALL
---------------------------------------------------------------
CREATE   PROCEDURE SPGenerarVIEW_ALL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Tabla SYSNAME;

    DECLARE cur CURSOR FOR
        SELECT t.name
        FROM sys.tables t
        WHERE t.name NOT LIKE 'Auditoria_%'
        ORDER BY t.name;

    OPEN cur;
    FETCH NEXT FROM cur INTO @Tabla;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Procesando vista para tabla: ' + @Tabla;

        EXEC SPGenerarVIEW @Tabla;

        FETCH NEXT FROM cur INTO @Tabla;
    END;

    CLOSE cur;
    DEALLOCATE cur;

    PRINT '✔ Todas las vistas faltantes fueron generadas.';
END;