CREATE TABLE archs (
  id              CHAR(8)           NOT NULL,
  `name`          VARCHAR(40)       NOT NULL                COMMENT 'Descriptive architecture name',
  def             ENUM('no','yes')  NOT NULL  DEFAULT 'no'  COMMENT 'Default or not',
  packages_total  INT UNSIGNED      NOT NULL  DEFAULT '0'   COMMENT 'Total number of the packages for this architecture',
  packages        INT UNSIGNED      NOT NULL  DEFAULT '0'   COMMENT 'Number of active packages for this architecture',

  PRIMARY KEY (id),

  INDEX idx_name (`name`) USING BTREE
)
CHARSET = ascii
COLLATE = ascii_general_ci
COMMENT = 'Slackware Architectures'
ENGINE = InnoDB;

