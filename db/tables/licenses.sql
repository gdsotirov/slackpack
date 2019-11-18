CREATE TABLE licenses (
  id              CHAR(8)           CHARACTER SET ASCII NOT NULL  DEFAULT '',
  `name`          VARCHAR(30)       CHARACTER SET ASCII NOT NULL                COMMENT 'License name',
  description     TEXT                                                          COMMENT 'Short description',
  url             VARCHAR(256)                                    DEFAULT NULL  COMMENT 'URL with more info about the license or the official page of the license',
  def             ENUM('no','yes')  CHARACTER SET ASCII NOT NULL  DEFAULT 'no',
  packages_total  INT UNSIGNED                          NOT NULL  DEFAULT '0'   COMMENT 'Total number of the packages with this license',
  packages        INT UNSIGNED                          NOT NULL  DEFAULT '0'   COMMENT 'Number of active packages with this license',
  gpl_compat      ENUM('n','y')     CHARACTER SET ASCII           DEFAULT NULL  COMMENT 'Is the license GPL Compatible?',

  PRIMARY KEY  (id),

  KEY idx_name (`name`) USING BTREE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Software licenses catalog';

