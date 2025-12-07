

---------------------------------------------------------------
-- SP GLOBAL: GENERA ABM + AUDITORÍA PARA TODAS LAS TABLAS
---------------------------------------------------------------
CREATE   PROCEDURE SPGenerarABM_AUD_ALL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Tabla SYSNAME;

    DECLARE curTablas CURSOR FOR
        SELECT t.name
        FROM sys.tables t
        WHERE t.name NOT LIKE 'Auditoria_%'
        AND EXISTS (
            SELECT 1 
            FROM sys.key_constraints kc
            WHERE kc.parent_object_id = t.object_id
              AND kc.type = 'PK'
        );

    OPEN curTablas;
    FETCH NEXT FROM curTablas INTO @Tabla;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Generando ABM y Auditoría para tabla: ' + @Tabla;

        EXEC SPGenerarABM_AUD @Tabla;

        FETCH NEXT FROM curTablas INTO @Tabla;
    END;

    CLOSE curTablas;
    DEALLOCATE curTablas;

    PRINT '✔ Proceso completado. Todos los SPs generados correctamente.';
END