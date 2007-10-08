CREATE TABLE archs (
  id              CHAR(8)           NOT NULL DEFAULT '',
  `name`          VARCHAR(40)       NOT NULL              COMMENT 'Descriptive architecture name',
  def             ENUM('no','yes')  NOT NULL DEFAULT 'no' COMMENT 'Whether this architecture should be preselected in GUI elements such combos',
  packages_total  INT(10) UNSIGNED  NOT NULL DEFAULT '0'  COMMENT 'Total number of the packages for this acritecture',
  packages        INT(10) UNSIGNED  NOT NULL DEFAULT '0'  COMMENT 'Number of active packages for this architecture',

  PRIMARY KEY  (id),

  KEY name_idx (`name`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Slackware Architectures';

