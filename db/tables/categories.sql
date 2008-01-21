CREATE TABLE categories (
  id        INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  `name`    VARCHAR(32)       NOT NULL              COMMENT 'Category name',
  packages  INT(10) UNSIGNED  NOT NULL DEFAULT '0'  COMMENT 'Number of the packages in this category',

  PRIMARY KEY  (id),

  KEY idx_name USING BTREE (`name`)
)
ENGINE=InnoDB DEFAULT
CHARSET=utf8
COMMENT='Package categories';

