DELIMITER |

CREATE TRIGGER packages_ad
  AFTER DELETE ON packages
  FOR EACH ROW
BEGIN
  UPDATE archs      SET packages_total = packages_total - 1 WHERE id = OLD.arch;
  UPDATE categories SET packages_total = packages_total - 1 WHERE id = OLD.category;
  UPDATE licenses   SET packages_total = packages_total - 1 WHERE id = OLD.license;
  UPDATE slackvers  SET packages_total = packages_total - 1 WHERE id = OLD.slackver;
  UPDATE vendors    SET packages_total = packages_total - 1 WHERE id = OLD.vendor;

  IF OLD.status = 'ok' THEN
    UPDATE archs      SET packages = packages - 1 WHERE id = OLD.arch;
    UPDATE categories SET packages = packages - 1 WHERE id = OLD.category;
    UPDATE licenses   SET packages = packages - 1 WHERE id = OLD.license;
    UPDATE slackvers  SET packages = packages - 1 WHERE id = OLD.slackver;
    UPDATE vendors    SET packages = packages - 1 WHERE id = OLD.vendor;
  END IF;
END |

DELIMITER ;

