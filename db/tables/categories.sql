CREATE TABLE categories (
  id        INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  `name`    VARCHAR(32)       NOT NULL              COMMENT 'Category name',
  name_bg   VARCHAR(32)       NOT NULL              COMMENT 'Category name in Bulgarian',
  packages  INT(10) UNSIGNED  NOT NULL DEFAULT '0'  COMMENT 'Number of the packages in this category',

  PRIMARY KEY  (id),

  KEY idx_name (`name`) USING BTREE
)
ENGINE=InnoDB DEFAULT
CHARSET=utf8
COMMENT='Package categories';

