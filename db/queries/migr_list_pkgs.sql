/* List migrated packages grouping renamed and localized */
SELECT CASE `name`
         WHEN 'libgksu1.2'               THEN 'libgksu'
         WHEN 'libgksuui1.0'             THEN 'libgksuui'
         WHEN 'openoffice.org-bg'        THEN 'openoffice'
         ELSE `name`
       END pkg_name
  FROM packages
 WHERE versioned = 'g'
 GROUP BY CASE `name`
            WHEN 'libgksu1.2'               THEN 'libgksu'
            WHEN 'libgksuui1.0'             THEN 'libgksuui'
            WHEN 'openoffice.org-bg'        THEN 'openoffice'
            ELSE `name`
          END;
