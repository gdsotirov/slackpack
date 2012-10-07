CREATE OR REPLACE VIEW Versions AS
SELECT p.title           AS "Name",
       c.name            AS Category,
       MAX(p102.version) AS Slack102,
       MAX(p110.version) AS Slack110,
       MAX(p120.version) AS Slack120,
       MAX(p121.version) AS Slack121,
       MAX(p122.version) AS Slack122,
       MAX(p130.version) AS Slack130,
       MAX(p131.version) AS Slack131,
       MAX(p133.version) AS Slack1337,
       MAX(p140.version) AS Slack140
  FROM packages p
       LEFT JOIN categories c  ON     p.category    = c.id
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
       LEFT JOIN packages p122 ON     p122.name     = p.name
                                  AND p122.slackver = 122
                                  AND p122.status   = 'ok'
       LEFT JOIN packages p130 ON     p130.name     = p.name
                                  AND p130.slackver = 130
                                  AND p130.status   = 'ok'
       LEFT JOIN packages p131 ON     p131.name     = p.name
                                  AND p131.slackver = 131
                                  AND p131.status   = 'ok'
       LEFT JOIN packages p133 ON     p133.name     = p.name
                                  AND p133.slackver = 1337
                                  AND p133.status   = 'ok'
       LEFT JOIN packages p140 ON     p140.name     = p.name
                                  AND p140.slackver = 140
                                  AND p140.status   = 'ok'
 WHERE p.slackver != 99999 -- current
 GROUP BY p.name
 ORDER BY p.title;

