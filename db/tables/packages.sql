CREATE TABLE packages (
  id            INT UNSIGNED      NOT NULL  AUTO_INCREMENT,
  `name`        VARCHAR(128)      NOT NULL                  COMMENT 'Package UNIX name',
  title         VARCHAR(256)      NOT NULL                  COMMENT 'Package name',
  `version`     VARCHAR(20)       NOT NULL                  COMMENT 'Package version',
  releasedate   DATE              NULL      DEFAULT NULL    COMMENT 'Version release date',
  build         VARCHAR(10)       NOT NULL                  COMMENT 'Package build number',
  license       CHAR(8)           NOT NULL                  COMMENT 'Package license reference',
  arch          CHAR(8)           NOT NULL                  COMMENT 'Package architecture reference',
  slackver      INT UNSIGNED      NOT NULL                  COMMENT 'Package format (Slackware version) reference',
  url           VARCHAR(256)      NULL      DEFAULT NULL    COMMENT 'Project URL',
  vendor        INT UNSIGNED      NOT NULL,
  `description` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci'
                                  NULL      DEFAULT NULL    COMMENT 'Package description',
  serie         VARCHAR(8)        NOT NULL,
  category      INT UNSIGNED      NOT NULL                  COMMENT 'Package category',
  slackbuild    ENUM('no','yes')  NOT NULL  DEFAULT 'no'    COMMENT 'Is build script included',
  frombinary    ENUM('no','yes')  NOT NULL  DEFAULT 'no'    COMMENT 'Is it from binary release',
  filename      VARCHAR(256)      NOT NULL                  COMMENT 'Package file name',
  filesize      INT UNSIGNED      NOT NULL                  COMMENT 'Package file size',
  filemd5       CHAR(32)          NOT NULL                  COMMENT 'MD5 hash for the package file',
  filesign      TEXT              NOT NULL                  COMMENT 'GPG signature of the package file',
  filedate      TIMESTAMP         NOT NULL  DEFAULT CURRENT_TIMESTAMP
    COMMENT 'Package file creation date/time',
  author        INT UNSIGNED      NOT NULL                  COMMENT 'Package author reference',
  `status`      ENUM('ok',
                     'del',
                     'old',
                     'wait')      NOT NULL  DEFAULT 'ok'
    COMMENT 'Status of the package (ok - means active, old - means obsoleted, del - means deleted, wait - means not yet published)',
  versioned     ENUM('y','n','g') NULL      DEFAULT NULL,
  security_fix  TINYINT UNSIGNED  NULL      DEFAULT '0'     COMMENT 'Whether or not the package includes security fixes',
  contents      LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci'
                                  NULL                      COMMENT 'Dump of package contents',
  contents_json JSON              NULL                      COMMENT 'Package contents (files only) as JSON array',

  PRIMARY KEY (id),

  INDEX idx_name (`name`) USING BTREE,
  INDEX idx_version (`version`) USING BTREE,
  INDEX idx_arch (arch) USING BTREE,
  INDEX idx_license (license) USING BTREE,
  INDEX idx_author (author) USING BTREE,
  INDEX idx_slackbuild (slackbuild) USING BTREE,
  INDEX idx_slackver (slackver) USING BTREE,
  INDEX idx_category (category) USING BTREE,
  INDEX idx_status (`status`) USING BTREE,
  INDEX fk_vendor (vendor),
  INDEX fk_serie_idx (serie),

  CONSTRAINT fk_serie
    FOREIGN KEY (serie)
    REFERENCES soft_series (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_author
    FOREIGN KEY (author)
    REFERENCES users (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_arch
    FOREIGN KEY (arch)
    REFERENCES archs (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_license
    FOREIGN KEY (license)
    REFERENCES licenses (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_slackver
    FOREIGN KEY (slackver)
    REFERENCES slackvers (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_category
    FOREIGN KEY (category)
    REFERENCES categories (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_vendor
    FOREIGN KEY (vendor)
    REFERENCES vendors (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
CHARSET = ascii
COLLATE = ascii_general_ci
COMMENT = 'Slackware Packages Register'
ENGINE = InnoDB;

