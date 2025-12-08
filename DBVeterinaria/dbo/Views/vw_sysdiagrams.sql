
CREATE VIEW vw_sysdiagrams AS
SELECT 
    t.[name], t.[principal_id], t.[diagram_id], t.[version], t.[definition]
FROM sysdiagrams t
;