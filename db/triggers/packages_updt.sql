DELIMITER |

CREATE TRIGGER counts_on_updt
  AFTER UPDATE ON packages
  FOR EACH ROW
BEGIN
  UPDATE arch       SET packages = packages - 1 WHERE id = OLD.arch;
  UPDATE arch       SET packages = packages + 1 WHERE id = NEW.arch;
  UPDATE categories SET packages = packages - 1 WHERE id = OLD.category;
  UPDATE categories SET packages = packages + 1 WHERE id = NEW.category;
  UPDATE licenses   SET packages = packages - 1 WHERE id = OLD.license;
  UPDATE licenses   SET packages = packages + 1 WHERE id = NEW.license;
  UPDATE slackver   SET packages = packages - 1 WHERE id = OLD.slackver;
  UPDATE slackver   SET packages = packages + 1 WHERE id = NEW.slackver;
END |

DELIMITER ;

