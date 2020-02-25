/* List migrated packages grouping renamed and localized */
SELECT CASE `name`
         WHEN 'icu'                      THEN 'icu4c'
         WHEN 'libgksu1.2'               THEN 'libgksu'
         WHEN 'libgksuui1.0'             THEN 'libgksuui'
         WHEN 'mpeg2dec'                 THEN 'libmpeg2'
         WHEN 'openoffice.org-bg'        THEN 'openoffice'
         ELSE `name`
       END pkg_name
  FROM packages
 WHERE versioned = 'g'
 GROUP BY CASE `name`
            WHEN 'icu'                      THEN 'icu4c'
            WHEN 'libgksu1.2'               THEN 'libgksu'
            WHEN 'libgksuui1.0'             THEN 'libgksuui'
            WHEN 'mpeg2dec'                 THEN 'libmpeg2'
            WHEN 'openoffice.org-bg'        THEN 'openoffice'
            ELSE `name`
          END;
