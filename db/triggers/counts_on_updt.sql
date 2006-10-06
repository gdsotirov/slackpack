DELIMITER |

CREATE TRIGGER counts_on_updt
  AFTER UPDATE ON packages
  FOR EACH ROW
BEGIN
  UPDATE arch       SET `count` = `count` - 1 WHERE id = OLD.arch;
  UPDATE arch       SET `count` = `count` + 1 WHERE id = NEW.arch;
  UPDATE categories SET `count` = `count` - 1 WHERE id = OLD.category;
  UPDATE categories SET `count` = `count` + 1 WHERE id = NEW.category;
  UPDATE licenses   SET `count` = `count` - 1 WHERE id = OLD.license;
  UPDATE licenses   SET `count` = `count` + 1 WHERE id = NEW.license;
  UPDATE slackver   SET `count` = `count` - 1 WHERE id = OLD.slackver;
  UPDATE slackver   SET `count` = `count` + 1 WHERE id = NEW.slackver;
END |

DELIMITER ;

