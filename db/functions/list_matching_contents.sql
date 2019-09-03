DELIMITER |

CREATE FUNCTION list_matching_contents(jdoc JSON, q VARCHAR(128))
  RETURNS TEXT CHARSET utf8
  DETERMINISTIC
BEGIN
  DECLARE res_paths JSON;
  DECLARE res_paths_len INTEGER;
  DECLARE res_paths_idx INTEGER DEFAULT 0;
  DECLARE cur_path VARCHAR(32);
  DECLARE mcntnts TEXT DEFAULT '';

  SET res_paths = JSON_SEARCH(jdoc, 'all', CONCAT('%', q, '%'));

  IF JSON_TYPE(res_paths) = 'STRING' THEN
    SET mcntnts = JSON_UNQUOTE(JSON_EXTRACT(jdoc, JSON_UNQUOTE(res_paths)));
  ELSEIF JSON_TYPE(res_paths) = 'ARRAY' THEN
    SET res_paths_len = JSON_LENGTH(res_paths);

    WHILE res_paths_idx < res_paths_len DO
      SET cur_path = JSON_EXTRACT(res_paths, CONCAT('$[', res_paths_idx, ']'));
      IF res_paths_idx > 0 THEN
        SET mcntnts = CONCAT(mcntnts, ', ', JSON_UNQUOTE(JSON_EXTRACT(jdoc, JSON_UNQUOTE(cur_path))));
      ELSE
        SET mcntnts = CONCAT(mcntnts, JSON_UNQUOTE(JSON_EXTRACT(jdoc, JSON_UNQUOTE(cur_path))));
      END IF;

      SET res_paths_idx = res_paths_idx + 1;
    END WHILE;
  ELSE
    SET mcntnts = '';
  END IF;

  RETURN mcntnts;
END |

DELIMITER ;

