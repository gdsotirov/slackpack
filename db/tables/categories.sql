CREATE TABLE categories (
  id              INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  `name`          VARCHAR(32)       NOT NULL              COMMENT 'Category name',
  packages_total  INT(10) UNSIGNED  NOT NULL DEFAULT '0'  COMMENT 'Total number of the packages in this category',
  packages        INT(10) UNSIGNED  NOT NULL DEFAULT '0'  COMMENT 'Number of active packages in this category',

  PRIMARY KEY  (id),

  KEY name_idx (`name`)
)
ENGINE=InnoDB DEFAULT
CHARSET=utf8
COMMENT='Package categories';

