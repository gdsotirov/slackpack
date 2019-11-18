CREATE TABLE soft_series (
  id    VARCHAR(8)  NOT NULL,
  title TEXT        NOT NULL COMMENT 'Description',

  PRIMARY KEY (id),

  UNIQUE INDEX idx_softseries_id_unq (id ASC)
)
COMMENT = 'Software series';

