DELIMITER |

CREATE TRIGGER counts_on_ins
  AFTER INSERT ON packages
  FOR EACH ROW
BEGIN
  /* Update counters */
  UPDATE archs      SET packages = packages + 1 WHERE id = NEW.arch;
  UPDATE categories SET packages = packages + 1 WHERE id = NEW.category;
  UPDATE licenses   SET packages = packages + 1 WHERE id = NEW.license;
  UPDATE slackvers  SET packages = packages + 1 WHERE id = NEW.slackver;

  /* Obsolete older packages */
  UPDATE packages
     SET status = 'old'
   WHERE name     = NEW.name
     AND arch     = NEW.arch
     AND slackver = NEW.slackver
     AND status   = 'ok'
     AND id      != NEW.id;
END |

DELIMITER ;

