/* ============================================================
      GENERADOR AUTOMÁTICO DE ABM + AUDITORÍA
      VERSIÓN COMPLETA – LISTA PARA PRODUCCIÓN
   ============================================================ */

---------------------------------------------------------------
-- SP INDIVIDUAL: GENERA ABM + AUDITORÍA PARA UNA TABLA
---------------------------------------------------------------
CREATE   PROCEDURE SPGenerarABM_AUD
(
    @Tabla SYSNAME
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @SQLABM nvarchar(max) = '',
        @SQLAUD nvarchar(max) = '',
        @SQLTabAud nvarchar(max) = '',
        @ColsInsert nvarchar(max) = '',
        @ColsInsertValues nvarchar(max) = '',
        @ColsUpdate nvarchar(max) = '',
        @PK SYSNAME,
        @Parametros nvarchar(max) = '';

    ----------------------------------------------------------
    -- 1) OBTENER PK
    ----------------------------------------------------------
    SELECT @PK = COLUMN_NAME
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE TABLE_NAME = @Tabla;

    IF @PK IS NULL
    BEGIN
        RAISERROR('La tabla no tiene clave primaria.', 16, 1);
        RETURN;
    END

    ----------------------------------------------------------
    -- 2) ARMAR PARAMETROS UNO POR UNO (SIN STRING_AGG)
    ----------------------------------------------------------
    DECLARE 
        @Col SYSNAME,
        @Tipo SYSNAME,
        @MaxLen int,
        @Prec int,
        @Scale int,
        @Linea nvarchar(max);

    DECLARE cur CURSOR FOR
        SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH,
               NUMERIC_PRECISION, NUMERIC_SCALE
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = @Tabla
          AND COLUMN_NAME <> @PK;

    OPEN cur;
    FETCH NEXT FROM cur INTO @Col, @Tipo, @MaxLen, @Prec, @Scale;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Linea = '    @' + @Col + ' ' + @Tipo;

        IF @Tipo IN ('varchar','nvarchar','char','nchar','varbinary')
        BEGIN
            SET @Linea += '(' + CASE WHEN @MaxLen = -1 THEN 'MAX' ELSE CAST(@MaxLen AS varchar) END + ')';
        END
        ELSE IF @Tipo IN ('decimal','numeric')
        BEGIN
            SET @Linea += '(' + CAST(@Prec AS varchar) + ',' + CAST(@Scale AS varchar) + ')';
        END

        SET @Linea += ' = NULL,' + CHAR(10);
        SET @Parametros += @Linea;

        FETCH NEXT FROM cur INTO @Col, @Tipo, @MaxLen, @Prec, @Scale;
    END

    CLOSE cur;
    DEALLOCATE cur;

    ----------------------------------------------------------
    -- BORRAR LA ULTIMA COMA
    ----------------------------------------------------------
    IF RIGHT(@Parametros, 2) = ',' + CHAR(10)
        SET @Parametros = LEFT(@Parametros, LEN(@Parametros) - 2);

    ----------------------------------------------------------
    -- 3) COLUMNAS INSERT / UPDATE
    ----------------------------------------------------------
    SELECT
        @ColsInsert = STRING_AGG(QUOTENAME(COLUMN_NAME), ', '),
        @ColsInsertValues = STRING_AGG('@' + COLUMN_NAME, ', ')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @Tabla
      AND COLUMN_NAME <> @PK
      AND COLUMNPROPERTY(OBJECT_ID(@Tabla), COLUMN_NAME, 'IsIdentity') = 0;

    SELECT
        @ColsUpdate = STRING_AGG(
            QUOTENAME(COLUMN_NAME) + ' = @' + COLUMN_NAME, ', ')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @Tabla
      AND COLUMN_NAME <> @PK
      AND COLUMNPROPERTY(OBJECT_ID(@Tabla), COLUMN_NAME, 'IsIdentity') = 0;

    ----------------------------------------------------------
    -- 4) CREAR TABLA AUDITORÍA
    ----------------------------------------------------------
    IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Auditoria_' + @Tabla)
    BEGIN
        SET @SQLTabAud = '
        CREATE TABLE Auditoria_' + @Tabla + ' (
            AuditoriaID int IDENTITY(1,1) PRIMARY KEY,
            Operacion varchar(10),
            ' + @PK + ' int,
            DetalleAnterior nvarchar(max),
            DetalleNuevo nvarchar(max),
            Usuario nvarchar(100),
            Fecha datetime2
        );';

        EXEC(@SQLTabAud);
    END

    ----------------------------------------------------------
    -- 5) SP Auditoría
    ----------------------------------------------------------
    SET @SQLAUD = '
CREATE OR ALTER PROCEDURE SP_AUDITORIA_' + @Tabla + '
(
    @Operacion varchar(10),
    @' + @PK + ' INT,
    @DetalleAnterior nvarchar(max),
    @DetalleNuevo nvarchar(max),
    @Usuario nvarchar(100)
)
AS
BEGIN
    INSERT INTO Auditoria_' + @Tabla + ' 
    (Operacion, ' + @PK + ', DetalleAnterior, DetalleNuevo, Usuario, Fecha)
    VALUES (@Operacion, @' + @PK + ', @DetalleAnterior, @DetalleNuevo, @Usuario, SYSDATETIME());
END';

    EXEC(@SQLAUD);

    ----------------------------------------------------------
    -- 6) SP_ABM (FINAL CORREGIDO)
    ----------------------------------------------------------
    SET @SQLABM = '
CREATE OR ALTER PROCEDURE SP_ABM_' + @Tabla + '
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @' + @PK + ' INT = NULL,' + CHAR(10) +
    @Parametros + '
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = ''INSERT''
    BEGIN
        INSERT INTO ' + @Tabla + ' (' + @ColsInsert + ')
        VALUES (' + @ColsInsertValues + ');

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM ' + @Tabla + ' WHERE ' + @PK + ' = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_' + @Tabla + ' ''INSERT'', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = ''UPDATE''
    BEGIN
        SET @Anterior = (SELECT * FROM ' + @Tabla + ' WHERE ' + @PK + ' = @' + @PK + ' FOR JSON AUTO);

        UPDATE ' + @Tabla + '
        SET ' + @ColsUpdate + '
        WHERE ' + @PK + ' = @' + @PK + ';

        SET @Nuevo = (SELECT * FROM ' + @Tabla + ' WHERE ' + @PK + ' = @' + @PK + ' FOR JSON AUTO);

        EXEC SP_AUDITORIA_' + @Tabla + ' ''UPDATE'', @' + @PK + ', @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = ''DELETE''
    BEGIN
        SET @Anterior = (SELECT * FROM ' + @Tabla + ' WHERE ' + @PK + ' = @' + @PK + ' FOR JSON AUTO);

        DELETE FROM ' + @Tabla + '
        WHERE ' + @PK + ' = @' + @PK + ';

        EXEC SP_AUDITORIA_' + @Tabla + ' ''DELETE'', @' + @PK + ', @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = ''SELECT''
    BEGIN
        SELECT * FROM ' + @Tabla + ';
    END
END';

    EXEC(@SQLABM);

    PRINT '✔ SP_ABM_' + @Tabla + ' y SP_AUDITORIA_' + @Tabla + ' generados correctamente.';
END