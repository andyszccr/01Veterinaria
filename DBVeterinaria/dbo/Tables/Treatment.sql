CREATE TABLE [dbo].[Treatment] (
    [TreatmentID]     INT           IDENTITY (1, 1) NOT NULL,
    [TreatmentCode]   VARCHAR (50)  NOT NULL,
    [TreatmentName]   VARCHAR (250) NOT NULL,
    [TipoTratamiento] VARCHAR (50)  NULL,
    [TreatmentAge]    INT           NULL,
    [TreatmentStatus] BIT           DEFAULT ((1)) NOT NULL,
    [CreatedAt]       DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]       INT           NULL,
    [ModifiedAt]      DATETIME2 (7) NULL,
    [ModifiedBy]      INT           NULL,
    PRIMARY KEY CLUSTERED ([TreatmentID] ASC),
    CONSTRAINT [CK_Treatment_Status] CHECK ([TreatmentStatus]=(1) OR [TreatmentStatus]=(0)),
    CONSTRAINT [CK_Treatment_Tipo] CHECK ([TipoTratamiento]='Mixto' OR [TipoTratamiento]='Reposo' OR [TipoTratamiento]='Remedio' OR [TipoTratamiento]='Vacuna' OR [TipoTratamiento] IS NULL),
    UNIQUE NONCLUSTERED ([TreatmentCode] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Treatment_Code]
    ON [dbo].[Treatment]([TreatmentCode] ASC);


GO

/* TRIGGER: Treatment (AFTER INSERT/UPDATE/DELETE) */
CREATE TRIGGER dbo.trg_Audit_Treatment_AIU
ON dbo.Treatment
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT 1 FROM inserted) AND NOT EXISTS(SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Treatment',
            i.TreatmentID,
            'CREATE',
            i.CreatedBy,
            SYSUTCDATETIME(),
            (SELECT i.TreatmentID, i.TreatmentCode, i.TreatmentName FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM inserted i;
    END

    IF EXISTS(SELECT 1 FROM deleted) AND NOT EXISTS(SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Treatment',
            d.TreatmentID,
            'DELETE',
            NULL,
            SYSUTCDATETIME(),
            (SELECT d.TreatmentID, d.TreatmentCode, d.TreatmentName FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM deleted d;
    END

    IF EXISTS(SELECT 1 FROM inserted) AND EXISTS(SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO dbo.Actividad (Entidad, EntidadID, Accion, UsuarioID, FechaHora, Detalle)
        SELECT
            'Treatment',
            i.TreatmentID,
            'UPDATE',
            i.ModifiedBy,
            SYSUTCDATETIME(),
            (SELECT d.TreatmentID AS Before_TreatmentID, d.TreatmentCode AS Before_TreatmentCode, d.TreatmentName AS Before_TreatmentName,
                    i.TreatmentID AS After_TreatmentID, i.TreatmentCode AS After_TreatmentCode, i.TreatmentName AS After_TreatmentName
             FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
        FROM inserted i
        JOIN deleted d ON i.TreatmentID = d.TreatmentID;
    END
END;