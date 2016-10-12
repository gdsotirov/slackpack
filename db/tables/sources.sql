CREATE TABLE sources (
  `name`          VARCHAR(32)   NOT NULL      COMMENT 'Source pacakges and resources',
  homepage_url    VARCHAR(128)  NOT NULL      COMMENT 'Official site URL',
  downloads_url   VARCHAR(128)  DEFAULT NULL  COMMENT 'Downloads URL',
  src_repo_url    VARCHAR(128)  DEFAULT NULL  COMMENT 'Source code repository URL',
  annon_ml_url    VARCHAR(128)  DEFAULT NULL  COMMENT 'Release announcements mailing list URL',
  annon_feed_url  VARCHAR(128)  DEFAULT NULL  COMMENT 'Release announcements feed URL',
  since           DATETIME      DEFAULT NULL  COMMENT 'Information effective since',

  PRIMARY KEY (`name`),

  CONSTRAINT fk_src_pack
    FOREIGN KEY (`name`)
    REFERENCES packages (`name`)
    ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8;

