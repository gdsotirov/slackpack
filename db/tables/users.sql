CREATE TABLE users (
  id          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`      VARCHAR(60)      NOT NULL DEFAULT '',
  firstname   VARCHAR(60)      NOT NULL DEFAULT '',
  email       VARCHAR(256)     NOT NULL DEFAULT '',
  `password`  VARCHAR(32)      NOT NULL,
  registered  TIMESTAMP        NOT NULL DEFAULT '0000-00-00 00:00:00',
  nick        VARCHAR(30)      NULL     DEFAULT NULL,
  packages    INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of the packages for this user',

  PRIMARY KEY  (id),

  KEY name_idx (`name`),
  KEY fname_idx (firstname),
  KEY nickname_idx (nick)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Package authors register';

