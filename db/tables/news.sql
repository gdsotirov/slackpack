CREATE TABLE news (
  id          INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  title       VARCHAR(128)      NOT NULL DEFAULT '',
  body        TEXT              NOT NULL,
  published   TIMESTAMP         NOT NULL DEFAULT '0000-00-00 00:00:00',
  updated     TIMESTAMP         NOT NULL DEFAULT '0000-00-00 00:00:00',
  author      INT(10) UNSIGNED  NOT NULL,

  PRIMARY KEY  (id),

  KEY author_news_key (author),

  CONSTRAINT author_news_key
    FOREIGN KEY (author)
    REFERENCES authors (id)
)
ENGINE=InnoDB DEFAULT
CHARSET=utf8
COMMENT='Site news';

