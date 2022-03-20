CREATE TABLE mirrors (
  id            INT UNSIGNED      NOT NULL  AUTO_INCREMENT,
  `name`        VARCHAR(128)      NOT NULL                  COMMENT 'Mirror name',
  home_url      VARCHAR(256)      NULL      DEFAULT NULL    COMMENT 'Mirror home page',
  loc_city      VARCHAR(64)       NULL      DEFAULT NULL    COMMENT 'Geographical location - city',
  loc_country   VARCHAR(32)       NOT NULL                  COMMENT 'Geographical location - country',
  loc_continent VARCHAR(16)       NOT NULL                  COMMENT 'Geographical location - continent',
  speed_local   INT UNSIGNED      NULL      DEFAULT NULL    COMMENT 'Local speed in bps',
  speed_int     INT UNSIGNED      NULL      DEFAULT NULL    COMMENT 'International speed in bps',
  sync_hours    INT UNSIGNED      NULL      DEFAULT NULL    COMMENT 'Synchronization is done every how many hours',
  sync_start    TIME              NULL      DEFAULT NULL    COMMENT 'First synchronization is done at what time',
  logo          BLOB              NULL      DEFAULT NULL    COMMENT 'Mirror logo image. Should be a png file with 88x31 dimension',
  prime         TINYINT UNSIGNED  NOT NULL  DEFAULT '0'     COMMENT 'Whether this is primary site or not',
  active        TINYINT UNSIGNED  NOT NULL  DEFAULT '0'     COMMENT 'Whether mirror is active or not',

  PRIMARY KEY (id),

  INDEX idx_name (`name`) USING BTREE,
  INDEX idx_location (loc_city, loc_country, loc_continent) USING BTREE
)
CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'SlackPack mirrors information'
ENGINE = InnoDB;

