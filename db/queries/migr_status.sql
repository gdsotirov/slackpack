/* Calculate migrated to Git package build scripts */
SELECT IFNULL(versioned, 'n') versioned, COUNT(*), ROUND(COUNT(*) / pkgs.tot * 100, 3) prcnt
  FROM packages,
       (SELECT COUNT(*) tot FROM packages) pkgs
 GROUP BY IFNULL(versioned, 'n')
 ORDER BY IFNULL(versioned, 'n');

