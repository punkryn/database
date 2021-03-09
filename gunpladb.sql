DROP DATABASE IF EXISTS `gunpladb` ;

CREATE DATABASE IF NOT EXISTS `gunpladb` 
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

USE `gunpladb` ;

CREATE TABLE `mechanic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  `manufacturer` VARCHAR(255) NULL,
  `armor` VARCHAR(255) NULL,
  `height` DECIMAL(7,2) NULL,
  `weight` DECIMAL(7,2) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;