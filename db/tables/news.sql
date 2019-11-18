CREATE TABLE news (
  id          INT     UNSIGNED  NOT NULL AUTO_INCREMENT,
  title       VARCHAR(128)      NOT NULL DEFAULT '',
  body        TEXT              NOT NULL,
  published   TIMESTAMP         NULL     DEFAULT NULL,
  updated     TIMESTAMP         NULL     DEFAULT NULL,
  author      INT     UNSIGNED  NOT NULL,

  PRIMARY KEY  (id),

  KEY idx_published (published) USING BTREE,
  KEY idx_update (updated) USING BTREE,
  KEY idx_author (author)  USING BTREE,

  CONSTRAINT fk_news_author
    FOREIGN KEY (author)
    REFERENCES users (id)
)
ENGINE=InnoDB DEFAULT
CHARSET=utf8
COMMENT='Site news';

