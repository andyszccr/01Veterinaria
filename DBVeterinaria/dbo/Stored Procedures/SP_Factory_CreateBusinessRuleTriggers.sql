
CREATE   PROCEDURE dbo.[SP_Factory_CreateBusinessRuleTriggers]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @SchemaName SYSNAME,
        @TableName  SYSNAME,
        @PKColumn   SYSNAME,
        @HasModifiedAt BIT,
        @TriggerName SYSNAME,
        @SQL NVARCHAR(MAX);

    DECLARE table_cursor CURSOR FAST_FORWARD FOR
    SELECT s.name, t.name
    FROM sys.tables t
    JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE t.is_ms_shipped = 0
      AND t.name <> 'sysdiagrams'
      AND t.name NOT LIKE '%Auditoria%'
      AND t.name NOT LIKE '%Actividad%'
      AND t.name NOT LIKE '%Historico%';

    OPEN table_cursor;
    FETCH NEXT FROM table_cursor INTO @SchemaName, @TableName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        /* ============================
           1) Detectar PK simple real
        ============================ */
        SELECT @PKColumn = c.name
        FROM sys.key_constraints kc
        JOIN sys.index_columns ic
            ON kc.parent_object_id = ic.object_id
           AND kc.unique_index_id = ic.index_id
        JOIN sys.columns c
            ON ic.object_id = c.object_id
           AND ic.column_id = c.column_id
        WHERE kc.type = 'PK'
          AND kc.parent_object_id = OBJECT_ID(QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName))
        GROUP BY c.name
        HAVING COUNT(*) = 1;

        /* Si no hay PK simple, se omite */
        IF @PKColumn IS NULL
        BEGIN
            FETCH NEXT FROM table_cursor INTO @SchemaName, @TableName;
            CONTINUE;
        END

        /* ============================
           2) Verificar columna ModifiedAt
        ============================ */
        SELECT @HasModifiedAt =
            CASE WHEN EXISTS (
                SELECT 1
                FROM sys.columns
                WHERE object_id = OBJECT_ID(QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName))
                  AND name = 'ModifiedAt'
            ) THEN 1 ELSE 0 END;

        /* ============================
           3) Nombre del trigger
        ============================ */
        SET @TriggerName = 'trg_' + @TableName + '_BusinessRules';

        /* ============================
           4) Crear trigger si no existe
        ============================ */
        IF NOT EXISTS (
            SELECT 1
            FROM sys.triggers
            WHERE name = @TriggerName
        )
        BEGIN
            SET @SQL = N'
CREATE TRIGGER ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TriggerName) + '
ON ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + '
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
';

            IF @HasModifiedAt = 1
            BEGIN
                SET @SQL += N'
    UPDATE t
    SET ModifiedAt = SYSUTCDATETIME()
    FROM ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + ' t
    JOIN inserted i
        ON t.' + QUOTENAME(@PKColumn) + ' = i.' + QUOTENAME(@PKColumn) + ';
';
            END

            SET @SQL += N'
END;
';

            EXEC sys.sp_executesql @SQL;
        END

        FETCH NEXT FROM table_cursor INTO @SchemaName, @TableName;
    END

    CLOSE table_cursor;
    DEALLOCATE table_cursor;
END;