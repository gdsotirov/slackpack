CREATE TABLE searches (
  id            INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
  query         VARCHAR(128)  CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci'
                              NOT NULL                            COMMENT 'The query as passed from the search form',
  `date`        TIMESTAMP     NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'The data at which the query was processed',
  results       INT UNSIGNED  NOT NULL                            COMMENT 'Count of the returned packages',
  arch          VARCHAR(8)    NULL      DEFAULT NULL              COMMENT 'The selected architecture',
  slackver      INT UNSIGNED  NULL      DEFAULT NULL              COMMENT 'The selected Slackware version',
  f_latestonly  ENUM('n','y') NULL      DEFAULT NULL              COMMENT 'Whether Only latest was checked',
  f_gplonly     ENUM('n','y') NULL      DEFAULT NULL              COMMENT 'Whether Only GPL was checked',
  f_sponly      ENUM('n','y') NULL      DEFAULT NULL              COMMENT 'Whether Only with SlackBuild was checked',
  f_nobin       ENUM('n','y') NULL      DEFAULT NULL              COMMENT 'Whether Exclude packages from binary releases was checked',

  PRIMARY KEY (id),

  INDEX idx_date (`date`),
  INDEX idx_arch (arch),
  INDEX idx_sver (slackver),
  INDEX idx_flatestonly (f_latestonly),
  INDEX idx_fgplonly (f_gplonly),
  INDEX idx_fsponly (f_sponly),
  INDEX idx_fnobin (f_nobin),
  FULLTEXT KEY idx_query (query)
)
CHARSET = ascii
COLLATE = ascii_general_ci
COMMENT = 'Search queries register'
ENGINE = InnoDB;

