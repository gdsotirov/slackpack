DELIMITER |

CREATE TRIGGER counts_on_ins
  AFTER INSERT ON packages
  FOR EACH ROW
BEGIN
  UPDATE arch       SET `count` = `count` + 1 WHERE id = NEW.arch;
  UPDATE categories SET `count` = `count` + 1 WHERE id = NEW.category;
  UPDATE licenses   SET `count` = `count` + 1 WHERE id = NEW.license;
  UPDATE slackver   SET `count` = `count` + 1 WHERE id = NEW.slackver;
END |

DELIMITER ;

