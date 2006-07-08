CREATE TABLE licenses (
  id        CHAR(8)          NOT NULL DEFAULT '',
  `name`    VARCHAR(30)      NOT NULL DEFAULT '',
  `desc`    TEXT,
  url       VARCHAR(256)              DEFAULT NULL,
  `default` ENUM('no','yes') NOT NULL DEFAULT 'no',

  PRIMARY KEY  (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Software licenses catalog';

