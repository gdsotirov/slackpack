DELIMITER |

CREATE TRIGGER counts_on_updt
  AFTER UPDATE ON packages
  FOR EACH ROW
BEGIN
  IF OLD.arch <> NEW.arch THEN
    UPDATE archs SET packages_total = packages_total - 1 WHERE id = OLD.arch;
    UPDATE archs SET packages_total = packages_total + 1 WHERE id = NEW.arch;
  END IF;

  IF OLD.category <> NEW.category THEN
    UPDATE categories SET packages_total = packages_total - 1 WHERE id = OLD.category;
    UPDATE categories SET packages_total = packages_total + 1 WHERE id = NEW.category;
  END IF;

  IF OLD.license <> NEW.license THEN
    UPDATE licenses SET packages_total = packages_total - 1 WHERE id = OLD.license;
    UPDATE licenses SET packages_total = packages_total + 1 WHERE id = NEW.license;
  END IF;

  IF OLD.slackver <> NEW.slackver THEN
    UPDATE slackvers SET packages_total = packages_total - 1 WHERE id = OLD.slackver;
    UPDATE slackvers SET packages_total = packages_total + 1 WHERE id = NEW.slackver;
  END IF;

  IF OLD.vendor <> NEW.vendor THEN
    UPDATE vendors SET packages_total = packages_total - 1 WHERE id = OLD.vendor;
    UPDATE vendors SET packages_total = packages_total + 1 WHERE id = NEW.vendor;
  END IF;

  IF NEW.status = 'ok' THEN
    UPDATE archs      SET packages = packages + 1 WHERE id = NEW.arch;
    UPDATE categories SET packages = packages + 1 WHERE id = NEW.category;
    UPDATE licenses   SET packages = packages + 1 WHERE id = NEW.license;
    UPDATE slackvers  SET packages = packages + 1 WHERE id = NEW.slackver;
    UPDATE vendors    SET packages = packages + 1 WHERE id = NEW.vendor;
  END IF;

  IF OLD.status = 'ok' THEN
    UPDATE archs      SET packages = packages - 1 WHERE id = OLD.arch;
    UPDATE categories SET packages = packages - 1 WHERE id = OLD.category;
    UPDATE licenses   SET packages = packages - 1 WHERE id = OLD.license;
    UPDATE slackvers  SET packages = packages - 1 WHERE id = OLD.slackver;
    UPDATE vendors    SET packages = packages - 1 WHERE id = OLD.vendor;
  END IF;
END |

DELIMITER ;

