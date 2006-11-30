CREATE OR REPLACE VIEW Latest20 AS
SELECT p.id         AS Id,
       p.filedate   AS `Date`,
       p.`name`     AS `Name`,
       p.version    AS `Version`,
       p.build      AS Build,
       lic.`name`   AS License,
       p.arch       AS Arch,
       a.`name`     AS Architecture,
       s.`name`     AS Slack,
       p.url        AS URL,
       p.description AS Description
  FROM packages   p,
       licenses   lic,
       archs      a,
       slackvers  s
 WHERE p.license  = lic.id
   AND p.arch     = a.id
   AND p.slackver = s.id
 ORDER BY p.filedate DESC
 LIMIT 20;

