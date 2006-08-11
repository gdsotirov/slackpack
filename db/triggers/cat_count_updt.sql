DELIMITER |

CREATE TRIGGER cat_count_updt
  AFTER UPDATE ON packages
  FOR EACH ROW
BEGIN
  UPDATE categories SET `count` = `count` - 1 WHERE `id` = OLD.category;
  UPDATE categories SET `count` = `count` + 1 WHERE `id` = NEW.category;
END |

DELIMITER ;

