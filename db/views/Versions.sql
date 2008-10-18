CREATE OR REPLACE VIEW Versions AS
SELECT p.title AS "Name",
       MAX(p102.version) AS Slack102,
       MAX(p110.version) AS Slack110,
       MAX(p120.version) AS Slack120,
       MAX(p121.version) AS Slack121
  FROM packages p
       LEFT JOIN packages p102 ON     p102.name     = p.name
                                  AND p102.slackver = 102
                                  AND p102.status   = 'ok'
       LEFT JOIN packages p110 ON     p110.name     = p.name
                                  AND p110.slackver = 110
                                  AND p110.status   = 'ok'
       LEFT JOIN packages p120 ON     p120.name     = p.name
                                  AND p120.slackver = 120
                                  AND p120.status   = 'ok'
       LEFT JOIN packages p121 ON     p121.name     = p.name
                                  AND p121.slackver = 121
                                  AND p121.status   = 'ok'
 GROUP BY p.name
 ORDER BY p.title;

