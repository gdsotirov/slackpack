CREATE TABLE package_deps (
  id          INT           NOT NULL AUTO_INCREMENT,
  pack_id     INT UNSIGNED  NOT NULL COMMENT 'For package',
  dep_type    ENUM('req',
                   'sugg',
                   'conf')  NOT NULL COMMENT 'Dependency type - requires, suggests, conflicts',
  dep_name    VARCHAR(64)   NOT NULL,
  dep_sign    VARCHAR(4)    NULL,
  dep_version VARCHAR(128)  NULL,

  PRIMARY KEY (id),
  INDEX fk_pkgdeps_pack_id (pack_id),

  CONSTRAINT fk_pkgdeps_pack_id
    FOREIGN KEY (pack_id)
    REFERENCES packages (id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Packages dependencies register';

