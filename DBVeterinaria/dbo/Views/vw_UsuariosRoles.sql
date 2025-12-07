
/* 6) vw_UsuariosRoles: usuarios con su rol */
CREATE VIEW dbo.vw_UsuariosRoles AS
SELECT
    u.UserID,
    u.UserCode,
    u.UserName,
    u.UserLastName,
    u.UserEmail,
    r.RoleID,
    r.RoleName,
    u.UserStatus
FROM dbo.Usuarios u
LEFT JOIN dbo.Roles r ON u.RoleID = r.RoleID;