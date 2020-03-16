/* Calculate migrated to Git package build scripts */
SELECT COALESCE(versioned, 'n') versioned, COUNT(*), ROUND(COUNT(*) / pkgs.tot * 100, 3) prcnt
  FROM packages,
       (SELECT COUNT(*) tot FROM packages) pkgs
 GROUP BY COALESCE(versioned, 'n')
 ORDER BY COALESCE(versioned, 'n');

