CREATE TABLE errors (
  id      INT(10) UNSIGNED                  NOT NULL AUTO_INCREMENT,
  errid   VARCHAR(16) CHARACTER SET ASCII   NOT NULL COMMENT 'Internal error code',
  errcode VARCHAR(16) CHARACTER SET ASCII   DEFAULT NULL COMMENT 'External error code',
  errmsg  VARCHAR(256)                      NOT NULL COMMENT 'Text of the error message',
  source  VARCHAR(256) CHARACTER SET ASCII  DEFAULT NULL COMMENT 'Source of the error (program name, etc)',
  `type`  ENUM('db','sys','usr','sp')       NOT NULL COMMENT 'Type of the error - database, system, user, slackpack',
  `level` enum('info','warn','err')         NOT NULL COMMENT 'Error level',
  `date`  DATETIME                          NOT NULL COMMENT 'Date and time at which the error was recorded',

  PRIMARY KEY  (id),

  KEY idx_type (`type`),
  KEY idx_date (`date`),
  KEY new_level (`level`),
  KEY idx_errid (errid),
  KEY idx_errcode (errcode),
  FULLTEXT KEY idx_errmsg (errmsg)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='Register for all errors that SlackPack encounters';

