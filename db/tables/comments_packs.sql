CREATE TABLE  comments_packs (
  id      INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  title   VARCHAR(64)       NOT NULL COMMENT 'Comment title',
  body    TEXT              NOT NULL COMMENT 'The comment itself',
  posted  TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  parent  INT(10) UNSIGNED  NOT NULL COMMENT 'Parent of the comment (in case of replays)',
  pack    INT(10) UNSIGNED  NOT NULL COMMENT 'Packge to which the comment is made',
  author  INT(10) UNSIGNED  NOT NULL COMMENT 'The author of the comment',

  PRIMARY KEY  (id),

  KEY idx_posted (posted),
  KEY fk_pack (pack),
  KEY fk_cp_author (author),
  KEY fk_cp_parent (parent),

  CONSTRAINT fk_cp_author
    FOREIGN KEY (author)
    REFERENCES users (id),
  CONSTRAINT fk_pack
    FOREIGN KEY (pack)
    REFERENCES packages (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Comments on packages';

