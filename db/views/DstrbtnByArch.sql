CREATE OR REPLACE VIEW DstrbtnByArch AS
SELECT a.id     AS Id,
       a.`name` AS Arch,
       COUNT(0) AS `Count`,
       ROUND((COUNT(0) * 100) /
             (SELECT COUNT(0) FROM packages),
             2) AS Percent
  FROM packages p,
       arch     a
 WHERE p.arch = a.id
 GROUP BY p.arch
 ORDER BY p.arch;

