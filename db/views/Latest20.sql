CREATE OR REPLACE VIEW Latest20 AS
SELECT p.id         AS Id,
       p.filedate   AS `Date`,
       p.`name`     AS `Name`,
       p.version    AS `Version`,
       p.build      AS Build,
       l.`name`     AS License,
       a.`name`     AS Architecture,
       s.`name`     AS Slack,
       p.url        AS URL,
       p.`desc`     AS Description,
       u.`name`     AS AuthorName,
       u.firstname  AS AuthorFirstName,
       u.email      AS AuthorEmail
  FROM packages p,
       licenses l,
       arch     a,
       slackver s,
       authors  u
 WHERE p.license  = l.id
   AND p.arch     = a.id
   AND p.slackver = s.id
   AND p.author   = u.id
 ORDER BY p.filedate DESC
 LIMIT 20;

