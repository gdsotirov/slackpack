CREATE TABLE news (
  id          INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  title       VARCHAR(128)      NOT NULL DEFAULT '',
  body        TEXT              NOT NULL,
  `datetime`  TIMESTAMP         NOT NULL DEFAULT '0000-00-00 00:00:00',
  author      INT(10) UNSIGNED  NOT NULL DEFAULT '0',

  PRIMARY KEY  (id)
)
ENGINE=InnoDB DEFAULT
CHARSET=utf8
COMMENT='Site news';

