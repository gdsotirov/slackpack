CREATE OR REPLACE VIEW Totals AS
SELECT COUNT(0)      AS TotalCount
       SUM(filesize) AS TotalSize
  FROM packages;

