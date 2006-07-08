CREATE OR REPLACE VIEW Latest25 AS
SELECT id       AS Id,
       `name`   AS Name,
       version  AS Version,
       build    AS Build,
       license  AS License,
       arch     AS Architecture,
       slackver AS Slack,
       url      AS URL
  FROM packages
 ORDER BY `date` DESC, `time` DESC
 LIMIT 25;

