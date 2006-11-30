DELIMITER |

CREATE TRIGGER counts_on_del
  AFTER DELETE ON packages
  FOR EACH ROW
BEGIN
  UPDATE archs      SET packages = packages - 1 WHERE id = OLD.arch;
  UPDATE categories SET packages = packages - 1 WHERE id = OLD.category;
  UPDATE licenses   SET packages = packages - 1 WHERE id = OLD.license;
  UPDATE slackvers  SET packages = packages - 1 WHERE id = OLD.slackver;
END |

DELIMITER ;

