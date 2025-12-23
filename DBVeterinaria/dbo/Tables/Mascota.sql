CREATE TABLE [dbo].[Mascota] (
    [MascotaID]       INT           IDENTITY (1, 1) NOT NULL,
    [AnimalID]        INT           NOT NULL,
    [UserID]          INT           NOT NULL,
    [MascotaStatus]   BIT           DEFAULT ((1)) NOT NULL,
    [FechaAsignacion] DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [FechaFin]        DATETIME2 (7) NULL,
    [CreatedAt]       DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]       INT           NULL,
    [ModifiedAt]      DATETIME2 (7) NULL,
    [ModifiedBy]      INT           NULL,
    PRIMARY KEY CLUSTERED ([MascotaID] ASC),
    CONSTRAINT [FK_Mascota_Animal] FOREIGN KEY ([AnimalID]) REFERENCES [dbo].[Animal] ([AnimalID]),
    CONSTRAINT [FK_Mascota_Usuario] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Usuarios] ([UserID]),
    CONSTRAINT [UQ_Mascota_Animal] UNIQUE NONCLUSTERED ([AnimalID] ASC)
);

