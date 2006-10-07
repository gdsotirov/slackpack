CREATE TABLE authors (
  id          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`      VARCHAR(60)      NOT NULL DEFAULT '',
  firstname   VARCHAR(60)      NOT NULL DEFAULT '',
  email       VARCHAR(256)     NOT NULL DEFAULT '',
  `password`  VARCHAR(32)      NOT NULL,
  registered  TIMESTAMP        NOT NULL DEFAULT '0000-00-00 00:00:00',
  nickname    VARCHAR(30)               DEFAULT NULL,
  packs       INT(10) UNSIGNED NOT NULL DEFAULT '0',

  PRIMARY KEY  (id),

  KEY name_idx (`name`),
  KEY fname_idx (firstname),
  KEY nickname_idx (nickname)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Package authors register';

