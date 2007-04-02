CREATE OR REPLACE VIEW NewsCal AS
SELECT MONTH(nws.published) AS `Month`,
       YEAR(nws.published)  AS `Year`,
       COUNT(0)             AS `News`
  FROM news nws
 GROUP BY MONTH(nws.published), YEAR(nws.published)
 ORDER BY YEAR(nws.published) DESC, MONTH(nws.published) DESC;

