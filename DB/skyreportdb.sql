-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema skyreportdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `skyreportdb` ;

-- -----------------------------------------------------
-- Schema skyreportdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `skyreportdb` DEFAULT CHARACTER SET utf8 ;
USE `skyreportdb` ;

-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(200) NULL,
  `city` VARCHAR(100) NOT NULL,
  `zipcode` VARCHAR(45) NULL,
  `state` VARCHAR(100) NOT NULL,
  `country` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `profile_picture_url` VARCHAR(2000) NULL,
  `location_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `about_me` TEXT NULL,
  `date_created` DATETIME NULL,
  `last_update` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_location1_idx` (`location_id` ASC),
  CONSTRAINT `fk_user_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `picture_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `known_object`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `known_object` ;

CREATE TABLE IF NOT EXISTS `known_object` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `picture_url` VARCHAR(2000) NULL,
  `category_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_known_object_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_known_object_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sighting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sighting` ;

CREATE TABLE IF NOT EXISTS `sighting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sighting_date` DATETIME NULL,
  `picture_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  `user_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `known_object_id` INT NULL,
  `date_created` DATETIME NULL,
  `last_update` DATETIME NULL,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sighting_user1_idx` (`user_id` ASC),
  INDEX `fk_sighting_location1_idx` (`location_id` ASC),
  INDEX `fk_sighting_known_object1_idx` (`known_object_id` ASC),
  CONSTRAINT `fk_sighting_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sighting_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sighting_known_object1`
    FOREIGN KEY (`known_object_id`)
    REFERENCES `known_object` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `user_id` INT NOT NULL,
  `sighting_id` INT NOT NULL,
  `in_reply_to` INT NULL,
  `comment_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_sighting1_idx` (`sighting_id` ASC),
  INDEX `fk_comment_comment1_idx` (`in_reply_to` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_sighting1`
    FOREIGN KEY (`sighting_id`)
    REFERENCES `sighting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`in_reply_to`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sighting_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sighting_has_category` ;

CREATE TABLE IF NOT EXISTS `sighting_has_category` (
  `sighting_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`sighting_id`, `category_id`),
  INDEX `fk_sighting_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_sighting_has_category_sighting1_idx` (`sighting_id` ASC),
  CONSTRAINT `fk_sighting_has_category_sighting1`
    FOREIGN KEY (`sighting_id`)
    REFERENCES `sighting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sighting_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sighting_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sighting_image` ;

CREATE TABLE IF NOT EXISTS `sighting_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(2000) NULL,
  `caption` VARCHAR(150) NULL,
  `sighting_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sighting_image_sighting1_idx` (`sighting_id` ASC),
  CONSTRAINT `fk_sighting_image_sighting1`
    FOREIGN KEY (`sighting_id`)
    REFERENCES `sighting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sighting_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sighting_rating` ;

CREATE TABLE IF NOT EXISTS `sighting_rating` (
  `user_id` INT NOT NULL,
  `sighting_id` INT NOT NULL,
  `rating` INT NULL,
  `rating_date` DATETIME NULL,
  `rating_comment` TEXT NULL,
  PRIMARY KEY (`user_id`, `sighting_id`),
  INDEX `fk_user_has_sighting_sighting1_idx` (`sighting_id` ASC),
  INDEX `fk_user_has_sighting_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_sighting_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_sighting_sighting1`
    FOREIGN KEY (`sighting_id`)
    REFERENCES `sighting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_comment` ;

CREATE TABLE IF NOT EXISTS `user_has_comment` (
  `user_id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  `comment_vote` TINYINT NULL,
  PRIMARY KEY (`user_id`, `comment_id`),
  INDEX `fk_user_has_comment_comment1_idx` (`comment_id` ASC),
  INDEX `fk_user_has_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_comment_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS admin@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `location` (`id`, `address`, `city`, `zipcode`, `state`, `country`) VALUES (1, 'a', 'a', 'a', 'a', 'a');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture_url`, `location_id`, `first_name`, `last_name`, `about_me`, `date_created`, `last_update`) VALUES (1, 'admin', '1234', 1, 'ADMIN', NULL, 1, NULL, NULL, NULL, NULL, NULL);

COMMIT;

