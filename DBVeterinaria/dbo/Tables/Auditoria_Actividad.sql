CREATE TABLE [dbo].[Auditoria_Actividad] (
    [AuditoriaID]     INT            IDENTITY (1, 1) NOT NULL,
    [Operacion]       VARCHAR (10)   NULL,
    [ActividadID]     INT            NULL,
    [DetalleAnterior] NVARCHAR (MAX) NULL,
    [DetalleNuevo]    NVARCHAR (MAX) NULL,
    [Usuario]         NVARCHAR (100) NULL,
    [Fecha]           DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([AuditoriaID] ASC)
);

