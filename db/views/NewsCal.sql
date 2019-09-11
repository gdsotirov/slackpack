CREATE OR REPLACE VIEW NewsCal AS
SELECT MONTH(nmy.published) AS `Month`,
       YEAR(nmy.published)  AS `Year`,
       COUNT(0)             AS `News`
  FROM news nmy
 WHERE published IS NOT NULL
 GROUP BY MONTH(nmy.published), YEAR(nmy.published)
UNION ALL
SELECT 99                   AS `Month`,
       YEAR(ny.published)   AS `Year`,
       COUNT(0)             AS `News`
  FROM news ny
 WHERE published IS NOT NULL
 GROUP BY YEAR(ny.published)
 ORDER BY 2 DESC, 1 DESC;

