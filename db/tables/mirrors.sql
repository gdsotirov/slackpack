CREATE TABLE mirrors (
  id            INT(11)       NOT NULL auto_increment,
  `name`        VARCHAR(128)  NOT NULL                  COMMENT 'Mirror name',
  home_url      VARCHAR(256)            DEFAULT NULL    COMMENT 'Mirror home page',
  loc_city      VARCHAR(64)             DEFAULT NULL    COMMENT 'Geographical location - city',
  loc_country   VARCHAR(32)   NOT NULL                  COMMENT 'Geographical location - country',
  loc_continent VARCHAR(16)   NOT NULL                  COMMENT 'Geographical location - continent',
  speed_local   int(10) UNSIGNED        DEFAULT NULL    COMMENT 'Local speed in bps',
  speed_int     int(10) UNSIGNED        DEFAULT NULL    COMMENT 'International speed in bps',
  sync_hours    int(10) UNSIGNED        DEFAULT NULL    COMMENT 'Synchronization is done every how many hours',
  sync_start    time                    DEFAULT NULL    COMMENT 'First synchronization is done at what time',
  logo          BLOB                                    COMMENT 'Mirror logo image. Should be a png file with 88x31 dimension',

  PRIMARY KEY  (id),

  KEY name_idx (`name`),
  KEY loc_idx (loc_city,loc_country)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='SlackPack mirrors information';

