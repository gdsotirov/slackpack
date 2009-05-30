CREATE TABLE links (
  id        INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  title     VARCHAR(64)       NOT NULL                    COMMENT 'Link''s title',
  title_bg  VARCHAR(64)       NOT NULL                    COMMENT 'Link''s title in Bulgarian',
  url       VARCHAR(256)      NOT NULL                    COMMENT 'Link''s URL',
  `type`    ENUM('leftbar',
                 'other')     NOT NULL DEFAULT 'other'    COMMENT 'Type of the link - where it''s used',
  priority  INT(10) UNSIGNED  NOT NULL,
  `status`  ENUM('active',
                 'inactive',
                 'pending')   NOT NULL DEFAULT 'pending'  COMMENT 'Link''s status',

  PRIMARY KEY  (id),

  KEY idx_type_status (`type`,`status`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8;

