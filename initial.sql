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
  PRIMARY KEY (`id`, `parent_id`),
  INDEX `idx_parent_id` (`parent_id` ASC),
  CONSTRAINT `fk_parent_id`
    FOREIGN KEY (`parent_id`)
    REFERENCES `sample`.`parent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- INSERT parent 指数関数的にデータを増やす
BEGIN;
INSERT INTO `sample`.`parent` (`id`,`count`) VALUES (1, CEIL(RAND() * 100));
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
SELECT sleep(1);
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
SELECT sleep(1);
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
SELECT sleep(1);
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
INSERT INTO `sample`.`parent` (`count`) select CEIL(RAND() * 100) from `sample`.`parent`;
COMMIT;

-- INSERT child
BEGIN;
INSERT INTO `sample`.`child` (`parent_id`, `age`) select id, 10 from sample.parent ORDER BY RAND();
COMMIT;
