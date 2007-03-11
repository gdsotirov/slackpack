CREATE TABLE mirrors (
  id            INT(11)       NOT NULL auto_increment,
  `name`        VARCHAR(128)  NOT NULL                  COMMENT 'Mirror name',
  home_url      VARCHAR(256)            DEFAULT NULL    COMMENT 'Mirror home page',
  protocol      ENUM('http',
                     'ftp',
                     'rsync') NOT NULL  DEFAULT 'http'  COMMENT 'Mirror protocol',
  rel_url       VARCHAR(256)  NOT NULL                  COMMENT 'Relative url to the package repositories',
  loc_city      VARCHAR(64)             DEFAULT NULL    COMMENT 'Geographical location - city',
  loc_country   VARCHAR(32)   NOT NULL                  COMMENT 'Geographical location - country',
  loc_continent VARCHAR(16)   NOT NULL                  COMMENT 'Geographical location - continent',
  conn_info     VARCHAR(128)            DEFAULT NULL    COMMENT 'Connection information. How the host is connection to\nInternet',
  logo          BLOB                                    COMMENT 'Mirror logo image. Should be a png file with 88x31 dimension',

  PRIMARY KEY  (id),

  KEY name_idx (`name`),
  KEY proto_idx (protocol),
  KEY loc_idx (loc_city,loc_country)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='SlackPack mirrors information';

