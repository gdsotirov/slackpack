CREATE TABLE sources (
  `id`            INT(11)       NOT NULL AUTO_INCREMENT,
  `name`          VARCHAR(32)   NOT NULL      COMMENT 'Source pacakges and resources',
  since           DATE          DEFAULT NULL  COMMENT 'Information effective since',
  homepage_url    VARCHAR(128)  NOT NULL      COMMENT 'Official site URL',
  downloads_url   VARCHAR(128)  DEFAULT NULL  COMMENT 'Downloads URL',
  src_repo_url    VARCHAR(128)  DEFAULT NULL  COMMENT 'Source code repository URL',
  bugs_url        VARCHAR(128)  DEFAULT NULL,
  annon_ml_url    VARCHAR(128)  DEFAULT NULL  COMMENT 'Release announcements mailing list URL',
  annon_feed_url  VARCHAR(128)  DEFAULT NULL  COMMENT 'Release announcements feed URL',
  news_url        VARCHAR(128)  DEFAULT NULL  COMMENT 'URL of news webpage',
  advert_url      VARCHAR(128)  DEFAULT NULL  COMMENT 'URL back to SlackPack',

  PRIMARY KEY (id),

  KEY fk_src_pack_idx (`name`),

  CONSTRAINT fk_src_pack
    FOREIGN KEY (`name`)
    REFERENCES packages (`name`)
    ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8;

