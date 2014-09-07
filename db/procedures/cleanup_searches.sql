DELIMITER |

CREATE PROCEDURE cleanup_searches()
BEGIN
  DELETE FROM searches WHERE `query` NOT RLIKE '[ a-zA-Z0-9]';
END |

DELIMITER ;

