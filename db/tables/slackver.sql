CREATE TABLE slackver (
  id        CHAR(8)           NOT NULL DEFAULT '',
  `name`    VARCHAR(30)       NOT NULL              COMMENT 'Descriptive version name',
  released  DATE                       DEFAULT NULL COMMENT 'Release date',
  `default` ENUM('no','yes')  NOT NULL DEFAULT 'no' COMMENT 'Whether this version should be preselected in GUI elements such combos',
  `count`   INT(10) UNSIGNED  NOT NULL DEFAULT '0'  COMMENT 'Count of the packages for this Slackware version',

  PRIMARY KEY  (id),

  KEY rel_idx (released),
  KEY name_idx (`name`)
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COMMENT='Slackware Versions';

