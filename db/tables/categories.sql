CREATE TABLE categories (
  id              INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  `name`          VARCHAR(32)   NOT NULL                COMMENT 'Category name',
  name_bg         VARCHAR(32)   NOT NULL                COMMENT 'Category name in Bulgarian',
  packages_total  INT UNSIGNED  NOT NULL DEFAULT '0'    COMMENT 'Total number of the packages in this category',
  packages        INT UNSIGNED  NOT NULL DEFAULT '0'    COMMENT 'Number of active packages in this category',

  PRIMARY KEY  (id),

  KEY idx_name (`name`) USING BTREE
)
ENGINE=InnoDB DEFAULT
CHARSET=utf8
COMMENT='Package categories';

