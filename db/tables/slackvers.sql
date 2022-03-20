CREATE TABLE slackvers (
  id              INT UNSIGNED      NOT NULL,
  `name`          VARCHAR(30)       NOT NULL                COMMENT 'Descriptive version name',
  released        DATETIME          NULL      DEFAULT NULL  COMMENT 'Release date and time in UTC',
  annon_url       VARCHAR(128)      NULL                    COMMENT 'Announcement URL (if any)',
  eol             DATE              NULL                    COMMENT 'End of life date (if any)',
  def             ENUM('no','yes')  NOT NULL  DEFAULT 'no'  COMMENT 'Whether this version should be preselected in GUI elements such combos',
  packages_total  INT UNSIGNED      NOT NULL  DEFAULT '0'   COMMENT 'Total number of the packages for this Slackware version',
  packages        INT UNSIGNED      NOT NULL  DEFAULT '0'   COMMENT 'Number of active packages for this Slackware version',
  `str`           VARCHAR(10)       NOT NULL                COMMENT 'Version as a string',
  active          TINYINT UNSIGNED  NOT NULL  DEFAULT 1     COMMENT 'Open for package registration',

  PRIMARY KEY (id),

  INDEX idx_released (released) USING BTREE,
  INDEX idx_name (`name`) USING BTREE
)
CHARSET = ascii
COLLATE = ascii_general_ci
COMMENT = 'Slackware Versions'
ENGINE = InnoDB;

