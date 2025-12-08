
CREATE VIEW vw_Reposo AS
SELECT 
    t.[ReposoID], t.[TipoReposo], t.[CreatedAt], t.[CreatedBy]
FROM Reposo t
;