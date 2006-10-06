DELIMITER |

CREATE TRIGGER counts_on_del
  AFTER DELETE ON packages
  FOR EACH ROW
BEGIN
  UPDATE arch       SET `count` = `count` - 1 WHERE id = OLD.arch;
  UPDATE categories SET `count` = `count` - 1 WHERE id = OLD.category;
  UPDATE licenses   SET `count` = `count` - 1 WHERE id = OLD.license;
  UPDATE slackver   SET `count` = `count` - 1 WHERE id = OLD.slackver;
END |

DELIMITER ;

