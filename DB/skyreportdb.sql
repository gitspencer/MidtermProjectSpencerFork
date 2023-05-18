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
  `caption` TEXT NULL,
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
INSERT INTO `location` (`id`, `address`, `city`, `zipcode`, `state`, `country`) VALUES (1, '4311 Washington Blvd', 'Nellis AFB', '89191', 'Nevada', 'United States');
INSERT INTO `location` (`id`, `address`, `city`, `zipcode`, `state`, `country`) VALUES (2, '', 'Roswell', '88201', 'New Mexico', 'United States');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture_url`, `location_id`, `first_name`, `last_name`, `about_me`, `date_created`, `last_update`) VALUES (1, 'admin', '1234', 1, 'ADMIN', 'https://www.researchgate.net/publication/335975371/figure/fig1/AS:806095123652619@1569199462871/Hacker-stock-photo-Image-credit-hacker-1-iaBeta-C-2017-Public-Domain.png', 1, 'John', 'Doe', 'd-_-b', '2023-05-18', '2023-05-18');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `category` (`id`, `name`, `description`, `picture_url`) VALUES (1, 'Wreckage', 'Tinfoil, rubber and thin wooden beams', 'https://www.menzelphoto.com/img-get/I0000Z9tcNGZAIuU/s/1200/I0000Z9tcNGZAIuU.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `known_object`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `known_object` (`id`, `name`, `description`, `picture_url`, `category_id`) VALUES (1, 'Weather balloon', 'High altitude weather balloon ladened with special equipment to monitor Soviet nuclear testing.', 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Transosonde.png', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sighting`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `sighting` (`id`, `sighting_date`, `picture_url`, `description`, `user_id`, `location_id`, `known_object_id`, `date_created`, `last_update`, `title`) VALUES (1, '1947-06-26', 'https://libraries.uta.edu/sites/default/files/styles/2_grid_width/public/2019-07/general-ramey.png?itok=a2oi0uS5', 'Found debris – tinfoil, rubber, and thin wooden beams – scattered across a square mile of desert.', 1, 2, 1, '1947-06-26', '2023-05-18', 'Roswell incident');

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `comment` (`id`, `content`, `user_id`, `sighting_id`, `in_reply_to`, `comment_date`) VALUES (1, 'Visiting the Roswell UFO site was fascinating. The mysterious crash and government cover-up added to the intrigue. Walking through the desert, I couldn\'t help but wonder about encounters with aliens.', 1, 1, NULL, '2023-05-18');
INSERT INTO `comment` (`id`, `content`, `user_id`, `sighting_id`, `in_reply_to`, `comment_date`) VALUES (2, 'The experience fueled my curiosity about extraterrestrial life and made me reflect on the mysteries of the universe. ', 1, 1, 1, '2023-05-18');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sighting_has_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `sighting_has_category` (`sighting_id`, `category_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sighting_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `sighting_image` (`id`, `image_url`, `caption`, `sighting_id`) VALUES (1, 'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-560w,f_auto,q_auto:best/newscms/2017_28/2070136/170712-roswell-mn-1245.jpg', 'Air Force personnel identify metallic fragments found by a farmer near Roswell, New Mexico, in 1947 as pieces of a weather balloon. The discovery of the fragments became the basis of the Roswell incident.', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sighting_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `sighting_rating` (`user_id`, `sighting_id`, `rating`, `rating_date`, `rating_comment`) VALUES (1, 1, 4, '2023-05-18', 'The OG');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `user_has_comment` (`user_id`, `comment_id`, `comment_vote`) VALUES (1, 1, 1);
INSERT INTO `user_has_comment` (`user_id`, `comment_id`, `comment_vote`) VALUES (1, 2, NULL);

COMMIT;

