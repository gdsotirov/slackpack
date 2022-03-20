CREATE TABLE vendors (
  id              INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
  `name`          VARCHAR(16)   NOT NULL                  COMMENT 'Short name of vendor',
  title           VARCHAR(64)   NOT NULL                  COMMENT 'Full name of vendor',
  homeurl         VARCHAR(256)  NOT NULL                  COMMENT 'Homepage URL',
  packages_total  INT UNSIGNED  NOT NULL  DEFAULT 0       COMMENT 'Total number of packages for the vendor',
  packages        INT UNSIGNED  NOT NULL  DEFAULT 0       COMMENT 'Number of avtive packages for the vendor',

  PRIMARY KEY (id),

  INDEX idx_name (`name`)
)
CHARSET = ascii
COLLATE = ascii_general_ci
COMMENT='Software vendors register'
ENGINE = InnoDB;

