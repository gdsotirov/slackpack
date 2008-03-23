CREATE TABLE vendors (
  id      INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  `name`  VARCHAR(32)       NOT NULL,
  title   VARCHAR(64)       NOT NULL,
  homeurl VARCHAR(256)      NOT NULL,

  PRIMARY KEY  (id),

  KEY idx_name (`name`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Software vendors register';

