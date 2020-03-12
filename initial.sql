CREATE DATABASE IF NOT EXISTS `sample`;
DROP TABLE IF EXISTS `sample`.`child`;
DROP TABLE IF EXISTS `sample`.`parent`;

CREATE TABLE `sample`.`parent`
(
  `id` INT NOT NULL AUTO_INCREMENT,
  `count` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `sample`.`parent`
ADD INDEX `idx_parent_count` (`count` ASC) VISIBLE;

CREATE TABLE `sample`.`child`
(
  `id` INT NOT NULL AUTO_INCREMENT,
  `parent_id` INT NOT NULL,
  `age` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`, `parent_id`),
  INDEX `idx_name` (`name` ASC),
  INDEX `idx_parent_id` (`parent_id` ASC),
  CONSTRAINT `fk_parent_id`
    FOREIGN KEY (`parent_id`)
    REFERENCES `sample`.`parent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- INSERT parent 指数関数的にデータを増やす
BEGIN;
INSERT INTO `sample`.`parent` (`id`,`count`) VALUES (1, CEIL(RAND() * 1000));
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`; /* 50万 */
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`; /* 100万 */
/* INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 1000) from `sample`.`parent`;*/ /* 200万ぐらいからめっちゃ時間かかるからコメントアウト */
COMMIT;

-- INSERT child
BEGIN;
INSERT INTO `sample`.`child` (`parent_id`, `age`, `name`) select id, CEIL(RAND() * 100), SUBSTRING(MD5(RAND()), 1, 10) from sample.parent ORDER BY RAND();
COMMIT;
