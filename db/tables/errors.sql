CREATE TABLE errors (
  id      INT(10) UNSIGNED                  NOT NULL AUTO_INCREMENT,
  `type`  ENUM('db','sys','usr','sp')       NOT NULL COMMENT 'Type of the error - database, system, user, slackpack',
  error   VARCHAR(256) CHARACTER SET ASCII  NOT NULL COMMENT 'Text of the error message',
  `date`  DATETIME                          NOT NULL COMMENT 'Date and time at which the error was recorded',
  source  VARCHAR(32) CHARACTER SET ASCII   NOT NULL COMMENT 'Source of the error',
  `level` ENUM('info','warn','err')         NOT NULL COMMENT 'Error level',

  PRIMARY KEY  (id),

  KEY idx_type (`type`),
  KEY idx_date (`date`),
  KEY new_level (`level`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='Register for all errors that SlackPack encounters';

