CREATE OR REPLACE VIEW AgingBuilds AS
SELECT `name`        AS `Name`,
       MAX(filedate) AS LastBuild
  FROM packages
 GROUP BY `name`
HAVING MAX(filedate) <= (NOW() - INTERVAL 2 MONTH)
 ORDER BY MAX(filedate);

