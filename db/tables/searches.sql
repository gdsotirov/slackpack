CREATE TABLE searches (
  id            INT(10) UNSIGNED        NOT NULL AUTO_INCREMENT,
  query         VARCHAR(128)            NOT NULL                            COMMENT 'The query as passed from the search form',
  `date`        TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT 'The data at which the query was processed',
  results       INT(10) UNSIGNED        NOT NULL                            COMMENT 'Count of the returned packages',
  arch          VARCHAR(8)                       DEFAULT NULL               COMMENT 'The selected architecture',
  slackver      INT(10) UNSIGNED                 DEFAULT NULL               COMMENT 'The selected Slackware version',
  f_latestonly  enum('n','y')                    DEFAULT NULL               COMMENT 'Whether ''Only latest'' was checked',
  f_gplonly     enum('n','y')                    DEFAULT NULL               COMMENT 'Whether ''Only GPL'' was checked',
  f_sponly      enum('n','y')                    DEFAULT NULL               COMMENT 'Whether ''Only with SlackBuild'' was checked',
  f_nobin       enum('n','y')                    DEFAULT NULL               COMMENT 'Whether ''no-binary'' was checked',

  PRIMARY KEY  (id),

  KEY idx_date (`date`),
  KEY idx_arch (arch),
  KEY idx_sver (slackver),
  KEY idx_flatestonly (f_latestonly),
  KEY idx_fgplonly (f_gplonly),
  KEY idx_fsponly (f_sponly),
  KEY idx_fnobin (f_nobin),
  FULLTEXT KEY idx_query (query)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8
COMMENT='Search queries register';
