CREATE OR REPLACE VIEW AvrgByMonth AS
SELECT YEAR(filedate)  AS `Year`,
       (COUNT(0) / 12) AS `Average`
  FROM packages
 GROUP BY YEAR(filedate) DESC;

