DELIMITER |

CREATE TRIGGER counts_on_ins
  AFTER INSERT ON packages
  FOR EACH ROW
BEGIN
  UPDATE archs      SET packages = packages + 1 WHERE id = NEW.arch;
  UPDATE categories SET number   = number   + 1 WHERE id = NEW.category;
  UPDATE licenses   SET packages = packages + 1 WHERE id = NEW.license;
  UPDATE slackvers  SET packages = packages + 1 WHERE id = NEW.slackver;
END |

DELIMITER ;

