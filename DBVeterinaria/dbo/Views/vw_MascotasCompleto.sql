CREATE VIEW dbo.vw_MascotasCompleto AS
SELECT
    m.MascotaID,
    m.MascotaStatus,
    m.FechaAsignacion,

    -- Animal
    a.AnimalID,
    a.AnimalCode,
    a.AnimalName,
    a.Edad,
    a.Peso,
    a.Sexo,
    a.Estado,

    -- Usuario
    u.UserID,
    u.UserCode,
    u.UserName,
    u.UserLastName,
    u.UserEmail

FROM dbo.Mascota m
JOIN dbo.Animal a ON m.AnimalID = a.AnimalID
JOIN dbo.Usuarios u ON m.UserID = u.UserID;