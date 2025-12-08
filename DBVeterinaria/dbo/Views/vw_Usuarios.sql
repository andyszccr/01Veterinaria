
CREATE VIEW vw_Usuarios AS
SELECT 
    t.[UserID], t.[UserCode], t.[UserName], t.[UserLastName], t.[UserEmail], t.[UserPhone], t.[UserAddress], t.[UserStatus], t.[RoleID], t.[ProvinceID], t.[CreatedAt], t.[CreatedBy], t.[ModifiedAt], t.[ModifiedBy]
FROM Usuarios t
LEFT JOIN [Roles] r_RoleID ON t.[RoleID] = r_RoleID.[RoleID]
LEFT JOIN [Provinces] r_ProvinceID ON t.[ProvinceID] = r_ProvinceID.[ProvinceID];