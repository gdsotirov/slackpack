CREATE TABLE  comments_news (
  id      INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  title   VARCHAR(64)       NOT NULL,
  body    BLOB              NOT NULL,
  posted  TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  parent  INT(10) UNSIGNED           DEFAULT NULL,
  news    INT(10) UNSIGNED  NOT NULL,
  author  INT(10) UNSIGNED  NOT NULL,

  PRIMARY KEY  (id),

  KEY fk_news (news),
  KEY idx_parent USING BTREE (parent),
  KEY fk_cn_author (author),

  CONSTRAINT fk_cn_author
    FOREIGN KEY (author)
    REFERENCES users (id),
  CONSTRAINT fk_cn_parent
    FOREIGN KEY (parent)
    REFERENCES comments_news (id),
  CONSTRAINT fk_news
    FOREIGN KEY (news)
    REFERENCES news (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Comments on news';

