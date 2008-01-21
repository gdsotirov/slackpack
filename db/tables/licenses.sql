CREATE TABLE licenses (
  id          CHAR(8)          NOT NULL DEFAULT '',
  `name`      VARCHAR(30)      NOT NULL               COMMENT 'License name',
  description TEXT                                    COMMENT 'Short description',
  url         VARCHAR(256)              DEFAULT NULL  COMMENT 'URL with more info about the license or the official page of the license',
  def         ENUM('no','yes') NOT NULL DEFAULT 'no',
  packages    INT(10) UNSIGNED NOT NULL DEFAULT '0'   COMMENT 'Number of the packages with this license',
  gpl_compat  ENUM('n','y')             DEFAULT NULL  COMMENT 'Is the license GPL Compatible?',

  PRIMARY KEY  (id),

  KEY idx_name USING BTREE (`name`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Software licenses catalog';

