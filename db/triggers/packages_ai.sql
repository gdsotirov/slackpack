DELIMITER |

CREATE TRIGGER counts_on_ins
  AFTER INSERT ON packages
  FOR EACH ROW
BEGIN
  UPDATE archs      SET packages_total = packages_total + 1 WHERE id = NEW.arch;
  UPDATE categories SET packages_total = packages_total + 1 WHERE id = NEW.category;
  UPDATE licenses   SET packages_total = packages_total + 1 WHERE id = NEW.license;
  UPDATE slackvers  SET packages_total = packages_total + 1 WHERE id = NEW.slackver;
  UPDATE vendors    SET packages_total = packages_total + 1 WHERE id = NEW.vendor;

  IF NEW.status = 'ok' THEN
    UPDATE archs      SET packages = packages + 1 WHERE id = NEW.arch;
    UPDATE categories SET packages = packages + 1 WHERE id = NEW.category;
    UPDATE licenses   SET packages = packages + 1 WHERE id = NEW.license;
    UPDATE slackvers  SET packages = packages + 1 WHERE id = NEW.slackver;
    UPDATE vendors    SET packages = packages + 1 WHERE id = NEW.vendor;
  END IF;
END |

DELIMITER ;

