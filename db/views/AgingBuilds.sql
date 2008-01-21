CREATE OR REPLACE VIEW AgingBuilds AS
SELECT `name`           AS `Name`,
       MAX(releasedate) AS LastReleaseDate,
       MAX(`version`)   AS LastVersion,
       MAX(filedate)    AS LastBuild,
       MAX(url)         AS URL
  FROM packages
 GROUP BY `name`
HAVING MAX(filedate) <= (NOW() - INTERVAL 2 MONTH)
 ORDER BY MAX(filedate);

