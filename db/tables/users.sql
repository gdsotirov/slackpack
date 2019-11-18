CREATE TABLE users (
  id          INT     UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`      VARCHAR(60)      NOT NULL                 COMMENT 'Name',
  firstname   VARCHAR(60)      NOT NULL                 COMMENT 'First name',
  nick        VARCHAR(30)               DEFAULT NULL    COMMENT 'Nickname',
  pkgsid      VARCHAR(5)       NOT NULL                 COMMENT 'The identifier used on packages',
  email       VARCHAR(256)     NOT NULL                 COMMENT 'Users''s email',
  `password`  VARCHAR(32)      NOT NULL                 COMMENT 'Users''s password as md5 hash',
  registered  TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of registration',
  packages    INT     UNSIGNED NOT NULL DEFAULT '0'     COMMENT 'Number of the packages for this user',
  lp_user     VARCHAR(10)               DEFAULT NULL    COMMENT 'Username in linuxpackages.net',
  lp_pass     BLOB                                      COMMENT 'Password in linuxpackages.net encoded with AES',

  PRIMARY KEY  (id),

  KEY idx_name (`name`) USING BTREE,
  KEY idx_firstname (firstname) USING BTREE,
  KEY idx_nick (nick) USING BTREE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Package authors register';

