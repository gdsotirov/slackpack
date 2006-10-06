CREATE TABLE licenses (
  id        CHAR(8)          NOT NULL DEFAULT '',
  `name`    VARCHAR(30)      NOT NULL               COMMENT 'License name',
  `desc`    TEXT                                    COMMENT 'Short description',
  url       VARCHAR(256)              DEFAULT NULL  COMMENT 'URL with more info about the license or the official page of the license',
  `default` ENUM('no','yes') NOT NULL DEFAULT 'no',
  `count`   INT(10) UNSIGNED NOT NULL DEFAULT '0'   COMMENT 'Count of the packages with this license',

  PRIMARY KEY  (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Software licenses catalog';

