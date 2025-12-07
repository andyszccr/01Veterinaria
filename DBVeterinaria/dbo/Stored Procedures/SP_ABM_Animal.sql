
CREATE   PROCEDURE SP_ABM_Animal
(
    @Accion varchar(10),
    @Usuario nvarchar(100),
    @AnimalCode INT = NULL,
    @AnimalID int = NULL,
    @AnimalName varchar(250) = NULL,
    @FechaNacimiento date = NULL,
    @Edad int = NULL,
    @Peso decimal(7,2) = NULL,
    @Sexo char(1) = NULL,
    @Estado varchar(50) = NULL,
    @AnimalStatus bit = NULL,
    @ClasificacionID int = NULL,
    @CreatedAt datetime2 = NULL,
    @CreatedBy int = NULL,
    @ModifiedAt datetime2 = NULL,
    @ModifiedBy int = NULL
)
AS
BEGIN
    DECLARE @Anterior nvarchar(max), @Nuevo nvarchar(max);

    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Animal ([AnimalName], [FechaNacimiento], [Edad], [Peso], [Sexo], [Estado], [AnimalStatus], [ClasificacionID], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy])
        VALUES (@AnimalName, @FechaNacimiento, @Edad, @Peso, @Sexo, @Estado, @AnimalStatus, @ClasificacionID, @CreatedAt, @CreatedBy, @ModifiedAt, @ModifiedBy);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        SET @Nuevo = (SELECT * FROM Animal WHERE AnimalCode = @NuevoID FOR JSON AUTO);

        EXEC SP_AUDITORIA_Animal 'INSERT', @NuevoID, NULL, @Nuevo, @Usuario;

        SELECT @NuevoID AS NuevoID;
    END

    ELSE IF @Accion = 'UPDATE'
    BEGIN
        SET @Anterior = (SELECT * FROM Animal WHERE AnimalCode = @AnimalCode FOR JSON AUTO);

        UPDATE Animal
        SET [AnimalName] = @AnimalName, [FechaNacimiento] = @FechaNacimiento, [Edad] = @Edad, [Peso] = @Peso, [Sexo] = @Sexo, [Estado] = @Estado, [AnimalStatus] = @AnimalStatus, [ClasificacionID] = @ClasificacionID, [CreatedAt] = @CreatedAt, [CreatedBy] = @CreatedBy, [ModifiedAt] = @ModifiedAt, [ModifiedBy] = @ModifiedBy
        WHERE AnimalCode = @AnimalCode;

        SET @Nuevo = (SELECT * FROM Animal WHERE AnimalCode = @AnimalCode FOR JSON AUTO);

        EXEC SP_AUDITORIA_Animal 'UPDATE', @AnimalCode, @Anterior, @Nuevo, @Usuario;
    END

    ELSE IF @Accion = 'DELETE'
    BEGIN
        SET @Anterior = (SELECT * FROM Animal WHERE AnimalCode = @AnimalCode FOR JSON AUTO);

        DELETE FROM Animal
        WHERE AnimalCode = @AnimalCode;

        EXEC SP_AUDITORIA_Animal 'DELETE', @AnimalCode, @Anterior, NULL, @Usuario;
    END

    ELSE IF @Accion = 'SELECT'
    BEGIN
        SELECT * FROM Animal;
    END
END