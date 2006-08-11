DELIMITER |

CREATE TRIGGER cat_count_ins
  AFTER INSERT ON packages
  FOR EACH ROW
BEGIN
  UPDATE categories SET `count` = `count` + 1 WHERE `id` = NEW.category;
END |

DELIMITER ;

