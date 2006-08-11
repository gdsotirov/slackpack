DELIMITER |

CREATE TRIGGER cat_count_del
  AFTER DELETE ON packages
  FOR EACH ROW
BEGIN
  UPDATE categories SET `count` = `count` - 1 WHERE `id` = OLD.category;
END

DELIMITER ;

