CREATE TABLE arch (
  id        CHAR(8)           NOT NULL DEFAULT '',
  `name`    VARCHAR(40)       NOT NULL              COMMENT 'Descriptive architecture name',
  `default` ENUM('no','yes')  NOT NULL DEFAULT 'no' COMMENT 'Whether this architecture should be preselected in GUI elements such combos',
  `count`   INT(10) UNSIGNED  NOT NULL DEFAULT '0'  COMMENT 'Count of the packages for this acritecture',

  PRIMARY KEY  (id),

  KEY name_idx (`name`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Slackware Architectures';

