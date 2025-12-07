CREATE TABLE [dbo].[Auditoria_Usuarios] (
    [AuditoriaID]     INT            IDENTITY (1, 1) NOT NULL,
    [Operacion]       VARCHAR (10)   NULL,
    [UserCode]        INT            NULL,
    [DetalleAnterior] NVARCHAR (MAX) NULL,
    [DetalleNuevo]    NVARCHAR (MAX) NULL,
    [Usuario]         NVARCHAR (100) NULL,
    [Fecha]           DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([AuditoriaID] ASC)
);

