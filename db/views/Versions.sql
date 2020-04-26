CREATE OR REPLACE VIEW Versions AS
SELECT Title          AS "Name",
       Category       AS Category,
       MAX(Slack102)  AS Slack102,
       MAX(Slack110)  AS Slack110,
       MAX(Slack120)  AS Slack120,
       MAX(Slack121)  AS Slack121,
       MAX(Slack122)  AS Slack122,
       MAX(Slack130)  AS Slack130,
       MAX(Slack131)  AS Slack131,
       MAX(Slack1337) AS Slack1337,
       MAX(Slack140)  AS Slack140,
       MAX(Slack141)  AS Slack141,
       MAX(Slack142)  AS Slack142
  FROM (SELECT p102.title        AS Title,
               c.name            AS Category,
               p102.version      AS Slack102,
               NULL              AS Slack110,
               NULL              AS Slack120,
               NULL              AS Slack121,
               NULL              AS Slack122,
               NULL              AS Slack130,
               NULL              AS Slack131,
               NULL              AS Slack1337,
               NULL              AS Slack140,
               NULL              AS Slack141,
               NULL              AS Slack142
          FROM categories c,
               packages   p102 
         WHERE p102.slackver = 102
           AND p102.status   = 'ok'
           AND p102.category = c.id

        UNION ALL

        SELECT p110.title        AS Title,
               c.name            AS Category,
               NULL              AS Slack102,
               p110.version      AS Slack110,
               NULL              AS Slack120,
               NULL              AS Slack121,
               NULL              AS Slack122,
               NULL              AS Slack130,
               NULL              AS Slack131,
               NULL              AS Slack1337,
               NULL              AS Slack140,
               NULL              AS Slack141,
               NULL              AS Slack142
          FROM categories c,
               packages   p110
         WHERE p110.slackver = 110
           AND p110.status   = 'ok'
           AND p110.category = c.id

        UNION ALL

        SELECT p120.title        AS Title,
               c.name            AS Category,
               NULL              AS Slack102,
               NULL              AS Slack110,
               p120.version      AS Slack120,
               NULL              AS Slack121,
               NULL              AS Slack122,
               NULL              AS Slack130,
               NULL              AS Slack131,
               NULL              AS Slack1337,
               NULL              AS Slack140,
               NULL              AS Slack141,
               NULL              AS Slack142
          FROM categories c,
               packages   p120
         WHERE p120.slackver = 120
           AND p120.status   = 'ok'
           AND p120.category = c.id

        UNION ALL

        SELECT p121.title        AS Title,
               c.name            AS Category,
               NULL              AS Slack102,
               NULL              AS Slack110,
               NULL              AS Slack120,
               p121.version      AS Slack121,
               NULL              AS Slack122,
               NULL              AS Slack130,
               NULL              AS Slack131,
               NULL              AS Slack1337,
               NULL              AS Slack140,
               NULL              AS Slack141,
               NULL              AS Slack142
          FROM categories c,
               packages   p121
         WHERE p121.slackver = 121
           AND p121.status   = 'ok'
           AND p121.category = c.id

        UNION ALL

        SELECT p122.title        AS Title,
               c.name            AS Category,
               NULL              AS Slack102,
               NULL              AS Slack110,
               NULL              AS Slack120,
               NULL              AS Slack121,
               p122.version      AS Slack122,
               NULL              AS Slack130,
               NULL              AS Slack131,
               NULL              AS Slack1337,
               NULL              AS Slack140,
               NULL              AS Slack141,
               NULL              AS Slack142
          FROM categories c,
               packages   p122
         WHERE p122.slackver = 122
           AND p122.status   = 'ok'
           AND p122.category = c.id

        UNION ALL

        SELECT p130.title        AS Title,
               c.name            AS Category,
               NULL              AS Slack102,
               NULL              AS Slack110,
               NULL              AS Slack120,
               NULL              AS Slack121,
               NULL              AS Slack122,
               p130.version      AS Slack130,
               NULL              AS Slack131,
               NULL              AS Slack1337,
               NULL              AS Slack140,
               NULL              AS Slack141,
               NULL              AS Slack142
          FROM categories c,
               packages   p130
         WHERE p130.slackver = 130
           AND p130.status   = 'ok'
           AND p130.category = c.id

        UNION ALL

        SELECT p131.title        AS Title,
               c.name            AS Category,
               NULL              AS Slack102,
               NULL              AS Slack110,
               NULL              AS Slack120,
               NULL              AS Slack121,
               NULL              AS Slack122,
               NULL              AS Slack130,
               p131.version      AS Slack131,
               NULL              AS Slack1337,
               NULL              AS Slack140,
               NULL              AS Slack141,
               NULL              AS Slack142
          FROM categories c,
               packages   p131
         WHERE p131.slackver = 131
           AND p131.status   = 'ok'
           AND p131.category = c.id

        UNION ALL

        SELECT p133.title        AS Title,
               c.name            AS Category,
               NULL              AS Slack102,
               NULL              AS Slack110,
               NULL              AS Slack120,
               NULL              AS Slack121,
               NULL              AS Slack122,
               NULL              AS Slack130,
               NULL              AS Slack131,
               p133.version      AS Slack1337,
               NULL              AS Slack140,
               NULL              AS Slack141,
               NULL              AS Slack142
          FROM categories c,
               packages   p133
         WHERE p133.slackver = 1337
           AND p133.status   = 'ok'
           AND p133.category = c.id

        UNION ALL

        SELECT p140.title        AS Title,
               c.name            AS Category,
               NULL              AS Slack102,
               NULL              AS Slack110,
               NULL              AS Slack120,
               NULL              AS Slack121,
               NULL              AS Slack122,
               NULL              AS Slack130,
               NULL              AS Slack131,
               NULL              AS Slack1337,
               p140.version      AS Slack140,
               NULL              AS Slack141,
               NULL              AS Slack142
          FROM categories c,
               packages   p140
         WHERE p140.slackver = 140
           AND p140.status   = 'ok'
           AND p140.category = c.id

        UNION ALL

        SELECT p141.title        AS Title,
               c.name            AS Category,
               NULL              AS Slack102,
               NULL              AS Slack110,
               NULL              AS Slack120,
               NULL              AS Slack121,
               NULL              AS Slack122,
               NULL              AS Slack130,
               NULL              AS Slack131,
               NULL              AS Slack1337,
               NULL              AS Slack140,
               p141.version      AS Slack141,
               NULL              AS Slack142
          FROM categories c,
               packages   p141
         WHERE p141.slackver = 141
           AND p141.status   = 'ok'
           AND p141.category = c.id

        UNION ALL

        SELECT p142.title        AS Title,
               c.name            AS Category,
               NULL              AS Slack102,
               NULL              AS Slack110,
               NULL              AS Slack120,
               NULL              AS Slack121,
               NULL              AS Slack122,
               NULL              AS Slack130,
               NULL              AS Slack131,
               NULL              AS Slack1337,
               NULL              AS Slack140,
               NULL              AS Slack141,
               p142.version      AS Slack142
          FROM categories c,
               packages   p142
         WHERE p142.slackver = 142
           AND p142.status   = 'ok'
           AND p142.category = c.id
        ) pkgs

  GROUP BY Title, Category
  ORDER BY Title;

