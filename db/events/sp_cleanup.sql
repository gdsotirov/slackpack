DELIMITER |

CREATE EVENT sp_cleanup
ON SCHEDULE EVERY 1 DAY STARTS '2014-09-07 23:45:00'
COMMENT 'Cleanup slackpack schema 15 minutes before midnight'
DO
BEGIN
  CALL cleanup_searches;
END |

DELIMITER ;

