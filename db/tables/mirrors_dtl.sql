CREATE TABLE mirrors_dtl (
  id        INT(11)       NOT NULL AUTO_INCREMENT,
  mirror    INT(11)       NOT NULL COMMENT 'Reference to the general mirror info',
  protocol  ENUM('FTP',
                 'HTTP',
                 'RSYNC') NOT NULL COMMENT 'Protocol name',
  url       VARCHAR(1024) NOT NULL COMMENT 'Relative URL to the repositories',

  PRIMARY KEY  (id),

  KEY idx_mirror (mirror) USING BTREE,

  CONSTRAINT fk_mirror
    FOREIGN KEY (mirror)
    REFERENCES mirrors (id)
    ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Definitions of mirror protocols';

