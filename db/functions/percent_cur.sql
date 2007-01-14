DELIMITER |

CREATE FUNCTION percent_cur() RETURNS FLOAT
  READS SQL DATA
  COMMENT 'Find the percent of the packages for Slackware Current'
BEGIN
  DECLARE cur_count INT;
  DECLARE all_count INT;

  SELECT count(*) INTO cur_count FROM packages WHERE slackver = '99999';
  SELECT count(*) INTO all_count FROM packages;
  RETURN (cur_count / all_count) * 100;
END |

DELIMITER ;

