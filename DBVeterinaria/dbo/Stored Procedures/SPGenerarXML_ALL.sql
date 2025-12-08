


---------------------------------------------------------------
-- 2) SPGenerarXML_ALL
---------------------------------------------------------------
CREATE   PROCEDURE SPGenerarXML_ALL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Tabla SYSNAME;

    ----------------------------------------------------------
    -- Cursor de tablas sin auditoría
    ----------------------------------------------------------
    DECLARE cur CURSOR FOR
        SELECT t.name
        FROM sys.tables t
        WHERE t.name NOT LIKE 'Auditoria_%';

    OPEN cur;
    FETCH NEXT FROM cur INTO @Tabla;

    ----------------------------------------------------------
    -- Recorrer cada tabla
    ----------------------------------------------------------
    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Procesando tabla: ' + @Tabla;

        EXEC SPGenerarXML @Tabla;

        FETCH NEXT FROM cur INTO @Tabla;
    END;

    CLOSE cur;
    DEALLOCATE cur;

    PRINT '✔ Todos los SP_XML faltantes fueron generados.';
END;