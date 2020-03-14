/* List migrated packages grouping renamed and localized */
SELECT CASE `name`
         WHEN 'icu'                      THEN 'icu4c'
         WHEN 'leptonlib'                THEN 'leptonica'
         WHEN 'libgksu1.2'               THEN 'libgksu'
         WHEN 'libgksuui1.0'             THEN 'libgksuui'
         WHEN 'libbreoffice-langpack-bg' THEN 'libbreoffice-langpack'
         WHEN 'libbreoffice-helppack-bg' THEN 'libbreoffice-helppack'
         WHEN 'mgeups-psp'               THEN 'mgeops-psp'
         WHEN 'mpeg2dec'                 THEN 'libmpeg2'
         WHEN 'openoffice.org-bg'        THEN 'openoffice'
         WHEN 'openoffice-langpack-bg'   THEN 'openoffice-langpack'
         WHEN 'tesseract-bul'            THEN 'tesseract-lang'
         WHEN 'tesseract-eng'            THEN 'tesseract-lang'
         WHEN 'tesseract-equ'            THEN 'tesseract-lang'
         WHEN 'tesseract-osd'            THEN 'tesseract-lang'
         ELSE `name`
       END pkg_name
  FROM packages
 WHERE versioned = 'g'
 GROUP BY CASE `name`
            WHEN 'icu'                      THEN 'icu4c'
            WHEN 'leptonlib'                THEN 'leptonica'
            WHEN 'libgksu1.2'               THEN 'libgksu'
            WHEN 'libgksuui1.0'             THEN 'libgksuui'
            WHEN 'libbreoffice-langpack-bg' THEN 'libbreoffice-langpack'
            WHEN 'libbreoffice-helppack-bg' THEN 'libbreoffice-helppack'
            WHEN 'mgeups-psp'               THEN 'mgeops-psp'
            WHEN 'mpeg2dec'                 THEN 'libmpeg2'
            WHEN 'openoffice.org-bg'        THEN 'openoffice'
            WHEN 'openoffice-langpack-bg'   THEN 'openoffice-langpack'
            WHEN 'tesseract-bul'            THEN 'tesseract-lang'
            WHEN 'tesseract-eng'            THEN 'tesseract-lang'
            WHEN 'tesseract-equ'            THEN 'tesseract-lang'
            WHEN 'tesseract-osd'            THEN 'tesseract-lang'
            ELSE `name`
          END;
