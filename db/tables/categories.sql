CREATE TABLE categories (
  id      INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  `name`  VARCHAR(32)       NOT NULL              COMMENT 'Category name',
  `count` INT(10) UNSIGNED  NOT NULL DEFAULT '0'  COMMENT 'Count of the packages in this category',

  PRIMARY KEY  (id)
)
ENGINE=InnoDB DEFAULT
CHARSET=utf8
COMMENT='Package categories';

