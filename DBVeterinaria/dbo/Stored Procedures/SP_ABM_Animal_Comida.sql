
CREATE   PROCEDURE SP_ABM_Animal_Comida
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @ComidaID INT = NULL,
    @AnimalID int = NULL,
    @CantidadAsignada decimal(9,2) = NULL,
    @FrecuenciaAsignada varchar(100) = NULL,
    @CreatedAt datetime2 = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Animal_Comida ([AnimalID], [CantidadAsignada], [FrecuenciaAsignada], [CreatedAt])
        VALUES (@AnimalID, @CantidadAsignada, @FrecuenciaAsignada, @CreatedAt);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Animal_Comida WHERE ComidaID = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Animal_Comida 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Animal_Comida WHERE ComidaID = @ComidaID FOR JSON AUTO);

        UPDATE Animal_Comida
        SET [AnimalID] = @AnimalID, [CantidadAsignada] = @CantidadAsignada, [FrecuenciaAsignada] = @FrecuenciaAsignada, [CreatedAt] = @CreatedAt
        WHERE ComidaID = @ComidaID;

        SET @Nuevo = (SELECT * FROM Animal_Comida WHERE ComidaID = @ComidaID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Animal_Comida 'UPDATE', @ComidaID, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Animal_Comida WHERE ComidaID = @ComidaID FOR JSON AUTO);

        DELETE FROM Animal_Comida
        WHERE ComidaID = @ComidaID;

        EXEC SP_AUDITORIA_Animal_Comida 'DELETE', @ComidaID, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Animal_Comida;
    END
END