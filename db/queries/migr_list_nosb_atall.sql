/* List packages without build script at all */
SELECT P.`name`, P.version, P.filedate, P.slackver,
       P.slackbuild,
       CASE
         WHEN P.contents LIKE '%install/slack-desc%' THEN 'yes'
         ELSE 'no'
       END sdesc,
       CASE
         WHEN P.contents LIKE '%install/slack-required%' THEN 'yes'
         ELSE 'no'
       END sreq
  FROM packages P
 WHERE /*`name` IN ('bgoffice', 'gd', 'kernel-headers', 'konverter', 'ksensors',
                  'myodbc', 'mysql-administrator', 'mysql-query-browser',
                  'mysqlcc', 'neon', 'redland', 'siefs', 'xawtv')*/
      P.contents NOT LIKE '%.SlackBuild%'
  AND P.slackbuild = 'no'
  AND COALESCE(P.versioned, 'n') NOT IN ('g', 'v')
  AND NOT EXISTS (SELECT 1
                    FROM packages
                   WHERE `name` = P.`name`
                     AND id != P.id
                     AND contents LIKE '%.SlackBuild%'
                 )
ORDER BY P.filedate ASC;
