CREATE TABLE donations (
  id            INT(11)         NOT NULL AUTO_INCREMENT,
  `from`        VARCHAR(256)    NOT NULL COMMENT 'This can be person name or email address',
  `to`          VARCHAR(256)    NOT NULL COMMENT 'This can be person name or email address',
  merchant      VARCHAR(16)     NOT NULL COMMENT 'Merchant number',
  `transaction` VARCHAR(32)     NOT NULL COMMENT 'Trasaction number',
  amount        DECIMAL(10,2)   NOT NULL COMMENT 'Transaction amount',
  currency      CHAR(3)         NOT NULL COMMENT 'ISO-4217 Currency code of the amount',
  `status`      ENUM('ok','ko') NOT NULL COMMENT 'Record status',
  mb_status     TINYINT(4)               DEFAULT NULL  COMMENT 'MoneyBookers specific status of the record',
  orig_amount   DECIMAL(10,2)   NOT NULL COMMENT 'Orignal transaction amount',
  orig_currency CHAR(3)         NOT NULL COMMENT 'ISO-4217 Currency code of the original amount',
  mb_md5sig     CHAR(32)                 DEFAULT NULL  COMMENT 'MoneyBookers MD5 signature for data verification',
  received      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Record received time/date',

  PRIMARY KEY  (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='Donations register';

