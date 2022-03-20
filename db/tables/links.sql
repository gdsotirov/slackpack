CREATE TABLE links (
  id        INT UNSIGNED      NOT NULL  AUTO_INCREMENT,
  title     VARCHAR(64)       NOT NULL                    COMMENT 'Title in English',
  title_bg  VARCHAR(64)       NOT NULL                    COMMENT 'Title in Bulgarian',
  url       VARCHAR(256)      NOT NULL                    COMMENT 'Absolute URL to link to',
  `type`    ENUM('leftbar',
                 'about',
                 'other')   CHARACTER SET 'ascii'
                              NOT NULL  DEFAULT 'other'   COMMENT 'List type (i.e. where is link used)',
  priority  INT UNSIGNED      NOT NULL                    COMMENT 'Ordinal number for sorting in list',
  `status`  ENUM('active',
                 'inactive',
                 'pending') CHARACTER SET 'ascii'
                              NOT NULL  DEFAULT 'pending' COMMENT 'Status defining whether link is active or not',

  PRIMARY KEY (id),

  INDEX idx_type_status (`type`, `status`)
)
CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Site links lists'
ENGINE = InnoDB;

