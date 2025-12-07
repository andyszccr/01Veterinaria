
CREATE   PROCEDURE SP_ABM_Comida
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @ComidaID INT = NULL,
    @TipoComida varchar(250) = NULL,
    @Cantidad decimal(9,2) = NULL,
    @Unidad varchar(20) = NULL,
    @Frecuencia varchar(100) = NULL,
    @Calorias int = NULL,
    @CreatedAt datetime2 = NULL,
    @CreatedBy int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Comida ([TipoComida], [Cantidad], [Unidad], [Frecuencia], [Calorias], [CreatedAt], [CreatedBy])
        VALUES (@TipoComida, @Cantidad, @Unidad, @Frecuencia, @Calorias, @CreatedAt, @CreatedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Comida WHERE ComidaID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Comida 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Comida WHERE ComidaID = @ComidaID FOR JSON AUTO);

        UPDATE Comida
        SET [TipoComida] = @TipoComida, [Cantidad] = @Cantidad, [Unidad] = @Unidad, [Frecuencia] = @Frecuencia, [Calorias] = @Calorias, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy
        WHERE ComidaID = @ComidaID;

        SET @Nuevo = (SELECT * FROM Comida WHERE ComidaID = @ComidaID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Comida 'UPDATE', @ComidaID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Comida WHERE ComidaID = @ComidaID FOR JSON AUTO);

        DELETE FROM Comida
        WHERE ComidaID = @ComidaID;

        EXEC SP_AUDITORIA_Comida 'DELETE', @ComidaID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Comida;
    END
END