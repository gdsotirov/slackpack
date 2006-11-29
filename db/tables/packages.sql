CREATE TABLE packages (
  id          INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  `name`      VARCHAR(128)      NOT NULL,
  `version`   VARCHAR(20)       NOT NULL,
  releasedate DATE              NOT NULL DEFAULT '0000-00-00',
  build       VARCHAR(10)                DEFAULT NULL,
  license     CHAR(8)           NOT NULL DEFAULT '',
  arch        CHAR(8)           NOT NULL DEFAULT '',
  slackver    CHAR(8)           NOT NULL DEFAULT '',
  url         VARCHAR(256)               DEFAULT NULL,
  description TEXT,
  category    INT(10) UNSIGNED  NOT NULL,
  slackbuild  ENUM('no','yes')  NOT NULL DEFAULT 'no',
  frombinary  ENUM('no','yes')  NOT NULL DEFAULT 'no',
  filename    VARCHAR(256)      NOT NULL DEFAULT '',
  filesize    INT(10) UNSIGNED  NOT NULL DEFAULT '0',
  fileurl     VARCHAR(1024)     NOT NULL DEFAULT '',
  filemd5     CHAR(32)          NOT NULL DEFAULT '',
  filesign    TEXT,
  filedate    TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP,
  author      INT(10) UNSIGNED  NOT NULL,

  KEY name_idx (`name`),
  KEY version_idx (`version`),
  KEY arch_idx (arch),
  KEY lic_idx (license),
  KEY author_idx (author),
  KEY sb_idx (slackbuild),
  KEY sver_idx (slackver),
  KEY cat_idx (category),

  CONSTRAINT author_key FOREIGN KEY (author) REFERENCES authors (id),
  CONSTRAINT arch_key FOREIGN KEY (arch) REFERENCES arch (id),
  CONSTRAINT lic_key FOREIGN KEY (license) REFERENCES licenses (id),
  CONSTRAINT slackver_key FOREIGN KEY (slackver) REFERENCES slackver (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Slackwrare Packages Register';

