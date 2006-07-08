CREATE TABLE arch (
  id        CHAR(8)           NOT NULL DEFAULT '',
  `name`    VARCHAR(40)       NOT NULL DEFAULT '',
  `default` ENUM('no','yes')  NOT NULL DEFAULT 'no',

  PRIMARY KEY  (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Slackware Architectures';

