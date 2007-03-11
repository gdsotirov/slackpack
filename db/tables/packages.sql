CREATE TABLE packages (
  id          INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  `name`      VARCHAR(128)      NOT NULL                      COMMENT 'Package UNIX name',
  title       VARCHAR(256)      NOT NULL                      COMMENT 'Package name',
  `version`   VARCHAR(20)       NOT NULL                      COMMENT 'Package version',
  releasedate DATE              NOT NULL DEFAULT '0000-00-00' COMMENT 'Version release date',
  build       VARCHAR(10)       NOT NULL                      COMMENT 'Package build number',
  license     CHAR(8)           NOT NULL                      COMMENT 'Package license reference',
  arch        CHAR(8)           NOT NULL                      COMMENT 'Package architecture reference',
  slackver    INT(10) UNSIGNED  NOT NULL                      COMMENT 'Package format (Slackware version) reference',
  url         VARCHAR(256)               DEFAULT NULL         COMMENT 'Project URL',
  description TEXT                                            COMMENT 'Package description',
  category    INT(10) UNSIGNED  NOT NULL                      COMMENT 'Package category',
  slackbuild  ENUM('no','yes')  NOT NULL DEFAULT 'no'         COMMENT 'Is build script included',
  frombinary  ENUM('no','yes')  NOT NULL DEFAULT 'no'         COMMENT 'Is it from binary release',
  filename    VARCHAR(256)      NOT NULL                      COMMENT 'Package file name',
  filesize    INT(10) UNSIGNED  NOT NULL DEFAULT '0'          COMMENT 'Package file size',
  fileurl     VARCHAR(1024)     NOT NULL                      COMMENT 'Package relative file URL',
  filemd5     CHAR(32)          NOT NULL                      COMMENT 'MD5 hash for the package file',
  filesign    TEXT                                            COMMENT 'GPG signature of the package file',
  filedate    TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Package file creation date/time',
  author      INT(10) UNSIGNED  NOT NULL                      COMMENT 'Package author reference',
  `status`    ENUM('del','ok')  NOT NULL DEFAULT 'ok',

  KEY name_idx (`name`),
  KEY version_idx (`version`),
  KEY arch_idx (arch),
  KEY lic_idx (license),
  KEY author_idx (author),
  KEY sb_idx (slackbuild),
  KEY sver_idx (slackver),
  KEY cat_idx (category),
  KEY status_idx (`status`),

  CONSTRAINT author_key FOREIGN KEY (author) REFERENCES users (id),
  CONSTRAINT arch_key
    FOREIGN KEY (arch)
    REFERENCES archs (id)
    ON UPDATE CASCADE,
  CONSTRAINT lic_key
    FOREIGN KEY (license)
    REFERENCES licenses (id)
    ON UPDATE CASCADE,
  CONSTRAINT slackver_key
    FOREIGN KEY (slackver)
    REFERENCES slackvers (id)
    ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Slackwrare Packages Register';

