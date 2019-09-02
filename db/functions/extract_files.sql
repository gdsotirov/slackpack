DELIMITER |

CREATE FUNCTION extract_files(cntnts LONGTEXT)
  RETURNS JSON
  DETERMINISTIC
BEGIN
  DECLARE jstr JSON DEFAULT '[]';
  DECLARE nl_pos INTEGER DEFAULT INSTR(cntnts, '\n');
  DECLARE ln VARCHAR(1024);

  WHILE nl_pos > 0 DO
    SET ln = SUBSTRING(cntnts, 1, nl_pos - 1);

    IF LENGTH(ln) > 0 AND ln NOT LIKE 'd%' THEN /* not an empty line and not directory */
      /* The string after last space should be the file name */
      SET jstr = JSON_ARRAY_APPEND(jstr, '$', SUBSTRING_INDEX(ln, ' ', -1));
    END IF;

    SET cntnts = SUBSTR(cntnts, nl_pos + 1);
    SET nl_pos = INSTR(cntnts, '\n'); /* next line */
  END WHILE;

  RETURN jstr;
END |

DELIMITER ;

