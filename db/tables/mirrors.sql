CREATE TABLE mirrors (
  id            INT           NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(128)  NOT NULL                  COMMENT 'Mirror name',
  home_url      VARCHAR(256)            DEFAULT NULL    COMMENT 'Mirror home page',
  loc_city      VARCHAR(64)             DEFAULT NULL    COMMENT 'Geographical location - city',
  loc_country   VARCHAR(32)   NOT NULL                  COMMENT 'Geographical location - country',
  loc_continent VARCHAR(16)   NOT NULL                  COMMENT 'Geographical location - continent',
  speed_local   INT     UNSIGNED        DEFAULT NULL    COMMENT 'Local speed in bps',
  speed_int     INT     UNSIGNED        DEFAULT NULL    COMMENT 'International speed in bps',
  sync_hours    INT     UNSIGNED        DEFAULT NULL    COMMENT 'Synchronization is done every how many hours',
  sync_start    TIME                    DEFAULT NULL    COMMENT 'First synchronization is done at what time',
  logo          BLOB                                    COMMENT 'Mirror logo image. Should be a png file with 88x31 dimension',
  prime         TINYINT       NOT NULL  DEFAULT '0'     COMMENT 'Whether this is primary site or not',
  active        TINYINT       NOT NULL  DEFAULT '0',

  PRIMARY KEY  (id),

  KEY idx_name (`name`) USING BTREE,
  KEY idx_location (loc_city,loc_country,loc_continent) USING BTREE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='SlackPack mirrors information';

