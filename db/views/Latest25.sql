CREATE OR REPLACE VIEW Latest25 AS
SELECT p.id       AS Id,
       p.`date`   AS `Date`,
       p.`time`   AS `Time`,
       p.`name`   AS `Name`,
       p.version  AS `Version`,
       p.build    AS Build,
       l.`name`   AS License,
       a.`name`   AS Architecture,
       s.`name`   AS Slack,
       p.url      AS URL
  FROM packages p,
       licenses l,
       arch     a,
       slackver s
 WHERE p.license = l.id
   AND p.arch    = a.id
   AND p.slackver = s.id
 ORDER BY p.`date` DESC, p.`time` DESC
 LIMIT 25;

