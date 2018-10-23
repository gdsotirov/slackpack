CREATE OR REPLACE VIEW DstrbtnByTime AS
SELECT YEAR(filedate)  AS `Year`,
       MONTH(filedate) AS `Month`,
       COUNT(0)        AS `Packages`
  FROM packages
 GROUP BY YEAR(filedate),
          MONTH(filedate)
 ORDER BY YEAR(filedate)  DESC,
          MONTH(filedate) DESC;

