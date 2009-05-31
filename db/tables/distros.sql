CREATE TABLE distros (
  id      CHAR(10)      NOT NULL COMMENT 'Distribution id',
  `name`  VARCHAR(16)   NOT NULL COMMENT 'Distribution name',
  `desc`  TEXT          NOT NULL COMMENT 'Short description',
  url     VARCHAR(128)  NOT NULL COMMENT 'Official site',

  PRIMARY KEY  (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Slackware Distributions';

