CREATE TABLE news (
  id          INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
  title       VARCHAR(128)  NOT NULL,
  body        TEXT          NOT NULL,
  published   TIMESTAMP     NULL      DEFAULT NULL,
  updated     TIMESTAMP     NULL      DEFAULT NULL,
  author      INT UNSIGNED  NOT NULL,

  PRIMARY KEY (id),

  INDEX idx_published (published) USING BTREE,
  INDEX idx_update (updated) USING BTREE,
  INDEX idx_author (author) USING BTREE,

  CONSTRAINT fk_news_author
    FOREIGN KEY (author)
    REFERENCES users (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Site news'
ENGINE = InnoDB;

