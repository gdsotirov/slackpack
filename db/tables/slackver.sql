CREATE TABLE slackver (
  id        CHAR(8)           NOT NULL DEFAULT '',
  `name`    VARCHAR(30)       NOT NULL DEFAULT '',
  released  DATE                       DEFAULT NULL,
  `default` ENUM('no','yes')  NOT NULL DEFAULT 'no',

  PRIMARY KEY  (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COMMENT='Slackware Versions';

