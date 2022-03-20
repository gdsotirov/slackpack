CREATE TABLE errors (
  id      INT UNSIGNED                NOT NULL  AUTO_INCREMENT,
  errcode VARCHAR(32)                 NOT NULL                  COMMENT 'Internal error code',
  errmsg  VARCHAR(256) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci'
                                      NULL      DEFAULT NULL    COMMENT 'Text of the error message',
  source  VARCHAR(256)                NULL      DEFAULT NULL    COMMENT 'Source of the error (program name, etc)',
  `type`  ENUM('db','sys','usr','sp') NOT NULL                  COMMENT 'Type of the error - database, system, user, slackpack',
  `level` ENUM('info','warn','err')   NOT NULL                  COMMENT 'Error level',
  `date`  DATETIME                    NOT NULL                  COMMENT 'Date and time at which the error was recorded',

  PRIMARY KEY (id),

  INDEX idx_errcode (errcode),
  INDEX idx_type (`type`),
  INDEX idx_level (`level`),
  INDEX idx_date (`date`),
  FULLTEXT INDEX idx_errmsg (errmsg)
)
CHARSET = ascii
COLLATE = ascii_general_ci
COMMENT = 'Register for all errors that SlackPack encounters'
ENGINE = InnoDB;

