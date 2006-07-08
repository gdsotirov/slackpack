CREATE TABLE packages (
  id          INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  name        VARCHAR(128)      NOT NULL,
  version     VARCHAR(20)       NOT NULL,
  build       VARCHAR(10)                DEFAULT NULL,
  license     CHAR(8)           NOT NULL DEFAULT '',
  arch        CHAR(8)           NOT NULL DEFAULT '',
  slackver    CHAR(8)           NOT NULL DEFAULT '',
  url         VARCHAR(256)               DEFAULT NULL,
  `desc`      TEXT,
  slackbuild  ENUM('no','yes')  NOT NULL DEFAULT 'no',
  filename    VARCHAR(256)      NOT NULL DEFAULT '',
  filesize    INT(10) UNSIGNED  NOT NULL DEFAULT '0',
  fileurl     VARCHAR(1024)     NOT NULL DEFAULT '',
  filemd5     CHAR(32)          NOT NULL DEFAULT '',
  filesign    TEXT,
  author      INT(10) UNSIGNED  NOT NULL,
  `date`      DATE                       DEFAULT NULL,
  `time`      TIME                       DEFAULT NULL,

  PRIMARY KEY  (id,author),
  KEY name_idx (`name`),
  KEY name_idx (name),
  KEY version_idx (version),
  KEY slackver_idx (slackver),
  KEY lic_key (license),
  KEY author_key (author),

  CONSTRAINT author_key FOREIGN KEY (author) REFERENCES authors (id),
  CONSTRAINT arch_key FOREIGN KEY (arch) REFERENCES arch (id),
  CONSTRAINT lic_key FOREIGN KEY (license) REFERENCES licenses (id),
  CONSTRAINT slackver_key FOREIGN KEY (slackver) REFERENCES slackver (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Slackwrare Packages Register';

