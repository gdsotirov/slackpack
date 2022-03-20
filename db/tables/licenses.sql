CREATE TABLE licenses (
  id              CHAR(8)           NOT NULL,
  `name`          VARCHAR(30)       NOT NULL                COMMENT 'License name',
  `description`   TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci'
                                    NULL      DEFAULT NULL  COMMENT 'Short description',
  url             VARCHAR(256)      NULL      DEFAULT NULL  COMMENT 'URL with more info about the license or the official page of the license',
  def             ENUM('no','yes')  NOT NULL  DEFAULT 'no',
  packages_total  INT UNSIGNED      NOT NULL  DEFAULT '0'   COMMENT 'Total number of the packages with this license',
  packages        INT UNSIGNED      NOT NULL  DEFAULT '0'   COMMENT 'Number of active packages with this license',
  gpl_compat      ENUM('n','y')     NULL      DEFAULT NULL  COMMENT 'Is the license GPL Compatible?',

  PRIMARY KEY (id),

  INDEX idx_name (`name`) USING BTREE
)
CHARSET = ascii
COLLATE = ascii_general_ci
COMMENT = 'Software licenses catalog'
ENGINE = InnoDB;

