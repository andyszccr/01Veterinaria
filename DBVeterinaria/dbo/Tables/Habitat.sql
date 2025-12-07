CREATE TABLE [dbo].[Habitat] (
    [HabitatID]      INT            IDENTITY (1, 1) NOT NULL,
    [HabitatName]    VARCHAR (150)  NOT NULL,
    [Description]    VARCHAR (500)  NULL,
    [TemperaturaMin] DECIMAL (5, 2) NULL,
    [TemperaturaMax] DECIMAL (5, 2) NULL,
    [HumedadMin]     INT            NULL,
    [HumedadMax]     INT            NULL,
    [CreatedAt]      DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    [CreatedBy]      INT            NULL,
    PRIMARY KEY CLUSTERED ([HabitatID] ASC),
    CONSTRAINT [CK_Habitat_Humedad] CHECK ([HumedadMin] IS NULL AND [HumedadMax] IS NULL OR [HumedadMin]>=(0) AND [HumedadMin]<=(100) AND ([HumedadMax]>=(0) AND [HumedadMax]<=(100)) AND [HumedadMin]<=[HumedadMax]),
    CONSTRAINT [CK_Habitat_Temp] CHECK ([TemperaturaMin] IS NULL AND [TemperaturaMax] IS NULL OR [TemperaturaMin]>=(-100) AND [TemperaturaMax]<=(100) AND [TemperaturaMin]<=[TemperaturaMax])
);

