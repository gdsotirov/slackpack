DELIMITER |

CREATE PROCEDURE cleanup_searches()
BEGIN
  DELETE FROM searches
   WHERE (   LOWER(`query`) IN ('epay', 'online', 'paypal', 'repo', 'site')
          OR `query` LIKE '%.n%'
          OR `query` LIKE '%.com%'
          OR `query` LIKE '%.uk%'
          OR `query` LIKE '%test%'
          OR `query` RLIKE '^[a-zA-Z][0-9]$'
          OR `query` NOT RLIKE '^[a-zA-Z0-9\.\,\-\_\ \+]+$'
          OR (    `query` RLIKE '^[a-zA-Z]{2}$'
              AND LOWER(`query`) NOT IN ('go', 'gd', 'mc', 'qt')
             )
         )
     AND results = 0;
END |

DELIMITER ;

