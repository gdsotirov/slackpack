CREATE TABLE vendors (
  id              INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
  `name`          VARCHAR(16)   NOT NULL                  COMMENT 'Vendor''s short name',
  title           VARCHAR(64)   NOT NULL                  COMMENT 'Vendor''s full name',
  homeurl         VARCHAR(256)  NOT NULL                  COMMENT 'Vendor''s URL',
  packages_total  INT UNSIGNED  NOT NULL  DEFAULT 0       COMMENT 'Total number of packages for the vendor',
  packages        INT UNSIGNED  NOT NULL  DEFAULT 0       COMMENT 'Number of avtive packages for the vendor',

  PRIMARY KEY  (id),

  KEY idx_name (`name`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Software vendors register';

