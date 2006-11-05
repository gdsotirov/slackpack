CREATE OR REPLACE VIEW Totals AS
SELECT COUNT(0)               AS TotalCount,
       COUNT(DISTINCT `name`) AS DstnctCount,
       SUM(filesize)          AS TotalSize
  FROM packages;

