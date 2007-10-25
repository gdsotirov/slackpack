CREATE OR REPLACE VIEW Versions AS
SELECT p.`name` AS `Name`,
       MAX(p102.version) AS Slack102,
       MAX(p110.version) AS Slack110,
       MAX(p120.version) AS Slack120
  FROM packages p
       LEFT JOIN packages p102 ON     p102.name     = p.name
                                  AND p102.slackver = 102
       LEFT JOIN packages p110 ON     p110.name     = p.name
                                  AND p110.slackver = 110
       LEFT JOIN packages p120 ON     p120.name     = p.name
                                  AND p120.slackver = 120
 GROUP BY p.`name`;

