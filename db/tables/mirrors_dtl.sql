CREATE TABLE mirrors_dtl (
  id        INT UNSIGNED      NOT NULL  AUTO_INCREMENT,
  mirror    INT UNSIGNED      NOT NULL                  COMMENT 'Reference to the general mirror info',
  protocol  ENUM('ftp',
                 'http',
                 'rsync') CHARACTER SET 'ascii'
                              NOT NULL                  COMMENT 'Protocol name',
  url       VARCHAR(1024)     NOT NULL                  COMMENT 'Relative URL to the repositories',
  active    TINYINT UNSIGNED  NOT NULL  DEFAULT '0'     COMMENT 'Whether URL is active or not',

  PRIMARY KEY (id),

  INDEX idx_mirror (mirror) USING BTREE,

  CONSTRAINT fk_mirror
    FOREIGN KEY (mirror)
    REFERENCES mirrors (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Definitions of mirror protocols'
ENGINE = InnoDB;

