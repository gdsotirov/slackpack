CREATE TABLE categories (
  id              INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
  `name`          VARCHAR(32)   NOT NULL                  COMMENT 'Category name in English',
  name_bg         VARCHAR(32)   NOT NULL                  COMMENT 'Category name in Bulgarian',
  packages_total  INT UNSIGNED  NOT NULL  DEFAULT '0'     COMMENT 'Total number of the packages in this category',
  packages        INT UNSIGNED  NOT NULL  DEFAULT '0'     COMMENT 'Number of active packages in this category',

  PRIMARY KEY (id),

  INDEX idx_name (`name`) USING BTREE
)
CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Package categories'
ENGINE = InnoDB;

