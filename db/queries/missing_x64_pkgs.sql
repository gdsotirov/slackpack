/* List packages build for x86, but not x64 */
SELECT `name`, slackver, count(*) cnt
  FROM packages
 WHERE `status` = 'ok'
   AND slackver >= 130
   AND arch <> 'noarch'
   AND `name` NOT IN ('firefox', 'thunderbird', 'skype')
 GROUP BY `name`, slackver
HAVING count(*) = 1
 ORDER BY slackver, `name`;

