DELIMITER |

CREATE TRIGGER packages_bu
  BEFORE UPDATE ON packages
  FOR EACH ROW
BEGIN
  IF NEW.contents IS NOT NULL AND NEW.contents_json IS NULL THEN
    SET NEW.contents_json = extract_files(NEW.contents);
  END IF;
END |

DELIMITER ;

