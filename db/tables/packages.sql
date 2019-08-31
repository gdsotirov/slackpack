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
  vendor      INT(10) UNSIGNED  NOT NULL,
  description TEXT                                    COMMENT 'Package description',
  serie       VARCHAR(8)                 DEFAULT NULL,
  category    INT(10) UNSIGNED  NOT NULL              COMMENT 'Package category',
  slackbuild  ENUM('no','yes')  NOT NULL DEFAULT 'no' COMMENT 'Is build script included',
  frombinary  ENUM('no','yes')  NOT NULL DEFAULT 'no' COMMENT 'Is it from binary release',
  filename    VARCHAR(256)      NOT NULL              COMMENT 'Package file name',
  filesize    INT(10) UNSIGNED  NOT NULL DEFAULT NULL COMMENT 'Package file size',
  fileurl     VARCHAR(1024)              DEFAULT NULL COMMENT 'Package relative file URL',
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
  versioned   ENUM('y','n')              DEFAULT NULL,
  security_fix  TINYINT(4)               DEFAULT '0'  COMMENT 'Whether or not the pacakge includes security fixes',
  contents    LONGTEXT          NULL                  COMMENT 'Dump of package contents',

  KEY idx_name (`name`) USING BTREE,
  KEY idx_version (`version`) USING BTREE,
  KEY idx_arch (arch) USING BTREE,
  KEY idx_license (license) USING BTREE,
  KEY idx_author (author) USING BTREE,
  KEY idx_slackbuild (slackbuild) USING BTREE,
  KEY idx_slackver (slackver) USING BTREE,
  KEY idx_category (category) USING BTREE,
  KEY idx_status (`status`) USING BTREE,
  KEY fk_vendor (vendor),
  KEY fk_serie_idx (serie),

  CONSTRAINT fk_serie
    FOREIGN KEY (serie)
    REFERENCES soft_series (id),
  CONSTRAINT fk_author
    FOREIGN KEY (author)
    REFERENCES users (id),
  CONSTRAINT fk_arch
    FOREIGN KEY (arch)
    REFERENCES archs (id)
    ON UPDATE CASCADE,
  CONSTRAINT fk_license
    FOREIGN KEY (license)
    REFERENCES licenses (id)
     ON UPDATE CASCADE,
  CONSTRAINT fk_slackver
    FOREIGN KEY (slackver)
    REFERENCES slackvers (id)
    ON UPDATE CASCADE,
  CONSTRAINT fk_category
    FOREIGN KEY (category)
    REFERENCES categories (id),
  CONSTRAINT fk_vendor
    FOREIGN KEY (vendor)
    REFERENCES vendors (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Slackwrare Packages Register';

