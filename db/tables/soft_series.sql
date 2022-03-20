CREATE TABLE soft_series (
  id    VARCHAR(8)  NOT NULL,
  title TEXT        NOT NULL COMMENT 'Description',

  PRIMARY KEY (id)
)
CHARSET = ascii
COLLATE = ascii_general_ci
COMMENT = 'Software series'
ENGINE = InnoDB;

