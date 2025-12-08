/* ============================================================
     GENERADOR ABM + AUDITORÍA (PK DINÁMICA CORRECTA)
   ============================================================ */

CREATE   PROCEDURE SPGenerarABM_AUD
(
    @Tabla SYSNAME
)
AS
BEGIN
    SET NOCOUNT ON;

    -------------------------------------------------------
    -- 0) SI YA EXISTE EL SP, NO LO CREA
    -------------------------------------------------------
    IF EXISTS (SELECT 1 FROM sys.procedures WHERE name = 'SP_ABM_' + @Tabla)
    BEGIN
        PRINT 'SKIP: SP_ABM_' + @Tabla + ' ya existe.';
        RETURN;
    END;


    -------------------------------------------------------
    -- 1) OBTENER PK REAL
    -------------------------------------------------------
    DECLARE @PK SYSNAME;

    SELECT TOP 1 @PK = COLUMN_NAME
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE TABLE_NAME = @Tabla;

    IF @PK IS NULL
    BEGIN
        PRINT 'ERROR: La tabla ' + @Tabla + ' no tiene PK.';
        RETURN;
    END;


    -------------------------------------------------------
    -- 2) COLUMNAS DE LA TABLA
    -------------------------------------------------------
    DECLARE @Columnas TABLE (Col SYSNAME, Tipo VARCHAR(200));

    INSERT INTO @Columnas(Col, Tipo)
    SELECT 
        COLUMN_NAME,
        DATA_TYPE +
        CASE 
            WHEN DATA_TYPE IN ('varchar','nvarchar','char','nchar')
                THEN '(' + IIF(CHARACTER_MAXIMUM_LENGTH=-1,'MAX',CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR)) + ')'
            ELSE ''
        END
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @Tabla;


    -------------------------------------------------------
    -- 3) PARAMETROS DEL SP
    -------------------------------------------------------
    DECLARE @PARAMS_LIST NVARCHAR(MAX) = '';

    SELECT @PARAMS_LIST = STRING_AGG('@' + Col + ' ' + Tipo, ', ')
    FROM @Columnas;

    -- parámetros del sistema
    SET @PARAMS_LIST += ', @ModoOperacion VARCHAR(10), @Usuario NVARCHAR(100)';


    -------------------------------------------------------
    -- 4) COLUMNAS UTILITARIAS
    -------------------------------------------------------
    DECLARE @COLS NVARCHAR(MAX), @COLS_PARAMS NVARCHAR(MAX), @UPD NVARCHAR(MAX);

    SELECT 
        @COLS = STRING_AGG(Col, ', '),
        @COLS_PARAMS = STRING_AGG('@' + Col, ', '),
        @UPD = STRING_AGG(Col + ' = @' + Col, ', ')
    FROM @Columnas
    WHERE Col <> @PK;


    -------------------------------------------------------
    -- 5) CREAR TABLA DE AUDITORIA SI NO EXISTE
    -------------------------------------------------------
    IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Auditoria_' + @Tabla)
    BEGIN
        EXEC('
        CREATE TABLE Auditoria_' + @Tabla + '(
            AuditoriaID INT IDENTITY(1,1) PRIMARY KEY,
            Operacion VARCHAR(10),
            ' + @PK + ' INT,
            DetalleAnterior NVARCHAR(MAX),
            DetalleNuevo NVARCHAR(MAX),
            Usuario NVARCHAR(100),
            Fecha DATETIME2
        );');
    END;


    -------------------------------------------------------
    -- 6) GENERAR SP ABM DINÁMICO
    -------------------------------------------------------
    DECLARE @SQL NVARCHAR(MAX) = '
CREATE PROCEDURE SP_ABM_' + @Tabla + '
(
    ' + @PARAMS_LIST + '
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ANT NVARCHAR(MAX), @NEW NVARCHAR(MAX);

    --------------------------------------------------------
    -- INSERT
    --------------------------------------------------------
    IF @ModoOperacion = ''INSERT''
    BEGIN
        INSERT INTO ' + @Tabla + '(' + @COLS + ')
        VALUES (' + @COLS_PARAMS + ');

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @NEW = (SELECT * FROM ' + @Tabla + ' WHERE ' + @PK + ' = @NuevoID FOR JSON AUTO);

        INSERT INTO Auditoria_' + @Tabla + '
        (Operacion, ' + @PK + ', DetalleNuevo, Usuario, Fecha)
        VALUES (''INSERT'', @NuevoID, @NEW, @Usuario, SYSDATETIME());

        SELECT @NuevoID AS NuevoID;
        RETURN;
    END;


    --------------------------------------------------------
    -- UPDATE
    --------------------------------------------------------
    IF @ModoOperacion = ''UPDATE''
    BEGIN
        SET @ANT = (SELECT * FROM ' + @Tabla + ' WHERE ' + @PK + ' = @' + @PK + ' FOR JSON AUTO);

        UPDATE ' + @Tabla + '
        SET ' + @UPD + '
        WHERE ' + @PK + ' = @' + @PK + ';

        SET @NEW = (SELECT * FROM ' + @Tabla + ' WHERE ' + @PK + ' = @' + @PK + ' FOR JSON AUTO);

        INSERT INTO Auditoria_' + @Tabla + '
        (Operacion, ' + @PK + ', DetalleAnterior, DetalleNuevo, Usuario, Fecha)
        VALUES (''UPDATE'', @' + @PK + ', @ANT, @NEW, @Usuario, SYSDATETIME());

        RETURN;
    END;


    --------------------------------------------------------
    -- DELETE
    --------------------------------------------------------
    IF @ModoOperacion = ''DELETE''
    BEGIN
        SET @ANT = (SELECT * FROM ' + @Tabla + ' WHERE ' + @PK + ' = @' + @PK + ' FOR JSON AUTO);

        DELETE FROM ' + @Tabla + ' WHERE ' + @PK + ' = @' + @PK + ';

        INSERT INTO Auditoria_' + @Tabla + '
        (Operacion, ' + @PK + ', DetalleAnterior, Usuario, Fecha)
        VALUES (''DELETE'', @' + @PK + ', @ANT, @Usuario, SYSDATETIME());

        RETURN;
    END;
END;
';

    EXEC(@SQL);

    PRINT '✔ SP_ABM_' + @Tabla + ' generado correctamente.';
END;