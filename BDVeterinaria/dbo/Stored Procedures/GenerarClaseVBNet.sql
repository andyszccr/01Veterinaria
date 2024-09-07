CREATE PROCEDURE GenerarClaseVBNet
    @NombreTabla NVARCHAR(128)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ClaseVBNet NVARCHAR(MAX) = ''
    DECLARE @NombreColumna NVARCHAR(128)
    DECLARE @TipoDato NVARCHAR(128)
    
    -- Encabezado de la clase
    SET @ClaseVBNet = 'Public Class ' + @NombreTabla + CHAR(13) + CHAR(10)
    
    -- Obtener la información de las columnas de la tabla
    DECLARE ColCursor CURSOR FOR
    SELECT COLUMN_NAME, DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @NombreTabla
    
    OPEN ColCursor
    FETCH NEXT FROM ColCursor INTO @NombreColumna, @TipoDato

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Convertir el tipo de dato de SQL a tipos de VB.NET
        SET @TipoDato = CASE @TipoDato
                            WHEN 'int' THEN 'Integer'
                            WHEN 'varchar' THEN 'String'
                            WHEN 'bit' THEN 'Boolean'
                            WHEN 'datetime' THEN 'DateTime'
                            WHEN 'decimal' THEN 'Decimal'
                            ELSE 'Object'
                        END

        -- Agregar la propiedad a la clase VB.NET
        SET @ClaseVBNet = @ClaseVBNet + '    Public Property ' + @NombreColumna + ' As ' + @TipoDato + CHAR(13) + CHAR(10)

        FETCH NEXT FROM ColCursor INTO @NombreColumna, @TipoDato
    END

    -- Cierre de la clase
    SET @ClaseVBNet = @ClaseVBNet + 'End Class'

    -- Devolver la clase como resultado
    PRINT @ClaseVBNet

    CLOSE ColCursor
    DEALLOCATE ColCursor
END