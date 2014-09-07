DELIMITER |

CREATE EVENT sp_cleanup
ON SCHEDULE EVERY '23:45' DAY_MINUTE
COMMENT 'Cleanup slackpack schema 15 minutes before midnight'
DO
BEGIN
  CALL cleanup_searches;
END |

DELIMITER ;

