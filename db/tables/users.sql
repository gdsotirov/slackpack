CREATE TABLE users (
  id          INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
  `name`      VARCHAR(60)   NOT NULL                  COMMENT 'Name',
  firstname   VARCHAR(60)   NOT NULL                  COMMENT 'First name',
  nick        VARCHAR(30)   NULL      DEFAULT NULL    COMMENT 'Nickname',
  pkgsid      VARCHAR(5)    NOT NULL                  COMMENT 'The identifier used on packages',
  email       VARCHAR(256)  NOT NULL                  COMMENT 'E-mail address of user',
  `password`  VARCHAR(32)   NOT NULL                  COMMENT 'User password as md5 hash',
  registered  TIMESTAMP     NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of registration',
  packages    INT UNSIGNED  NOT NULL  DEFAULT '0'     COMMENT 'Number of the packages for this user',
  lp_user     VARCHAR(10)   NULL      DEFAULT NULL    COMMENT 'Username in linuxpackages.net',
  lp_pass     BLOB          NULL      DEFAULT NULL    COMMENT 'Password in linuxpackages.net encoded with AES',

  PRIMARY KEY (id),

  KEY idx_name (`name`) USING BTREE,
  KEY idx_firstname (firstname) USING BTREE,
  KEY idx_nick (nick) USING BTREE
)
CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Package authors register'
ENGINE = InnoDB;

