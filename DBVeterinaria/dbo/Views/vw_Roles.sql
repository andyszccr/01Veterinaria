
CREATE VIEW vw_Roles AS
SELECT 
    t.[RoleID], t.[RoleCode], t.[RoleName], t.[RoleStatus], t.[CreatedAt], t.[CreatedBy]
FROM Roles t
;