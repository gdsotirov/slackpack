CREATE TABLE packages (
  id          INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  `name`      VARCHAR(128)      NOT NULL              COMMENT 'Package UNIX name',
  title       VARCHAR(256)      NOT NULL              COMMENT 'Package name',
  `version`   VARCHAR(20)       NOT NULL              COMMENT 'Package version',
  releasedate DATE                       DEFAULT NULL COMMENT 'Version release date',
  build       VARCHAR(10)       NOT NULL              COMMENT 'Package build number',
  license     CHAR(8) CHARACTER SET ASCII NOT NULL    COMMENT 'Package license reference',
  arch        CHAR(8)           NOT NULL              COMMENT 'Package architecture reference',
  slackver    INT(10) UNSIGNED  NOT NULL              COMMENT 'Package format (Slackware version) reference',
  url         VARCHAR(256)               DEFAULT NULL COMMENT 'Project URL',
  description TEXT                                    COMMENT 'Package description',
  category    INT(10) UNSIGNED  NOT NULL              COMMENT 'Package category',
  slackbuild  ENUM('no','yes')  NOT NULL DEFAULT 'no' COMMENT 'Is build script included',
  frombinary  ENUM('no','yes')  NOT NULL DEFAULT 'no' COMMENT 'Is it from binary release',
  filename    VARCHAR(256)      NOT NULL              COMMENT 'Package file name',
  filesize    INT(10) UNSIGNED  NOT NULL DEFAULT NULL COMMENT 'Package file size',
  fileurl     VARCHAR(1024)     NOT NULL              COMMENT 'Package relative file URL',
  filemd5     CHAR(32)          NOT NULL              COMMENT 'MD5 hash for the package file',
  filesign    TEXT                                    COMMENT 'GPG signature of the package file',
  filedate    TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP
    COMMENT 'Package file creation date/time',
  author      INT(10) UNSIGNED  NOT NULL              COMMENT 'Package author reference',
  `status`    ENUM('ok',
                   'del',
                   'old',
                   'wait')      NOT NULL DEFAULT 'ok'
    COMMENT 'Status of the package:\n''ok'' - means active, current pacakge\n''old'' - means obsoleted package\n''del'' - means deleted package\n''wait'' - means package which is not yet published',

  KEY idx_name USING BTREE (`name`),
  KEY idx_version USING BTREE (`version`),
  KEY idx_arch USING BTREE (arch),
  KEY idx_license USING BTREE (license),
  KEY idx_author USING BTREE (author),
  KEY idx_slackbuild USING BTREE (slackbuild),
  KEY idx_slackver USING BTREE (slackver),
  KEY idx_category USING BTREE (category),
  KEY idx_status USING BTREE (`status`),

  CONSTRAINT fk_author
    FOREIGN KEY (author)
    REFERENCES users (id),
  CONSTRAINT fk_arch
    FOREIGN KEY (arch)
    REFERENCES archs (id)
    ON UPDATE CASCADE,
  CONSTRAINT fk_license
    FOREIGN KEY (license)
    REFERENCES licenses (id),
  CONSTRAINT fk_slackver
    FOREIGN KEY (slackver)
    REFERENCES slackvers (id)
    ON UPDATE CASCADE,
  CONSTRAINT fk_category
    FOREIGN KEY (category)
    REFERENCES categories (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Slackwrare Packages Register';

