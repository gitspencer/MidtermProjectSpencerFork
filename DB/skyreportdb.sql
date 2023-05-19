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
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `location_id` INT NOT NULL,
  `date_created` DATETIME NULL,
  `last_update` DATETIME NULL,
  `about_me` TEXT NULL,
  `profile_picture_url` VARCHAR(2000) NULL,
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
  `category_id` INT NULL,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `picture_url` VARCHAR(2000) NULL,
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
  `user_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `known_object_id` INT NULL,
  `sighting_date` DATETIME NULL,
  `title` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `date_created` DATETIME NULL,
  `picture_url` VARCHAR(2000) NULL,
  `last_update` DATETIME NULL,
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
  `user_id` INT NOT NULL,
  `sighting_id` INT NOT NULL,
  `in_reply_to` INT NULL,
  `comment_date` DATETIME NULL,
  `content` TEXT NULL,
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
  `sighting_id` INT NOT NULL,
  `caption` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
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
INSERT INTO `location` (`id`, `address`, `city`, `zipcode`, `state`, `country`) VALUES (3, '2922 Gibson Pl', 'Hammond', '46323', 'Indiana', 'United States');
INSERT INTO `location` (`id`, `address`, `city`, `zipcode`, `state`, `country`) VALUES (4, '28186 CO-74 #1', 'Evergreen', '80439', 'Colorado', 'United States');
INSERT INTO `location` (`id`, `address`, `city`, `zipcode`, `state`, `country`) VALUES (5, '116 S Center St', 'Princeton', '27569', 'North Carolina', 'United States');
INSERT INTO `location` (`id`, `address`, `city`, `zipcode`, `state`, `country`) VALUES (6, '959 N State St', 'St Ignace', '49781', 'Michigan', 'United States');
INSERT INTO `location` (`id`, `address`, `city`, `zipcode`, `state`, `country`) VALUES (7, NULL, 'Carteret', '07008', 'New Jersey', 'United States');
INSERT INTO `location` (`id`, `address`, `city`, `zipcode`, `state`, `country`) VALUES (8, NULL, 'Amelia Island', '32034', 'Florida', 'United States');
INSERT INTO `location` (`id`, `address`, `city`, `zipcode`, `state`, `country`) VALUES (9, NULL, 'Stanfield', '85172', 'Arizona', 'United States');
INSERT INTO `location` (`id`, `address`, `city`, `zipcode`, `state`, `country`) VALUES (10, '9027 W Long Lake Rd', 'Alpena', '49707', 'Michigan', 'United States');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `enabled`, `role`, `location_id`, `date_created`, `last_update`, `about_me`, `profile_picture_url`) VALUES (1, 'admin', '1234', 'John', 'Doe', 1, 'ADMIN', 1, '2023-05-18', '2023-05-18', 'd-_-b', 'https://www.researchgate.net/publication/335975371/figure/fig1/AS:806095123652619@1569199462871/Hacker-stock-photo-Image-credit-hacker-1-iaBeta-C-2017-Public-Domain.png');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `enabled`, `role`, `location_id`, `date_created`, `last_update`, `about_me`, `profile_picture_url`) VALUES (2, 'tiawright', '1234', 'Tia', 'Wright', 1, 'USER', 3, '2023-05-19', '2023-05-19', 'Indiana based Java developer', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `enabled`, `role`, `location_id`, `date_created`, `last_update`, `about_me`, `profile_picture_url`) VALUES (3, 'jacobvan', '1234', 'Jacob', 'Van', 1, 'USER', 5, '2023-05-19', '2023-05-19', 'North Carolina based Java developer', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `enabled`, `role`, `location_id`, `date_created`, `last_update`, `about_me`, `profile_picture_url`) VALUES (4, 'nickspeidell', '1234', 'Nick', 'Speidell', 1, 'USER', 4, '2023-05-19', '2023-05-19', 'Colorado based Java developer', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `enabled`, `role`, `location_id`, `date_created`, `last_update`, `about_me`, `profile_picture_url`) VALUES (5, 'spencerwilliams', '1234', 'Spencer', 'Williams', 1, 'USER', 6, '2023-05-19', '2023-05-19', 'Michigan based Java developer', 'https://avatars.githubusercontent.com/u/125230970?s=96&v=4');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `category` (`id`, `name`, `description`, `picture_url`) VALUES (1, 'Wreckage', 'Debris or debris/field', 'https://www.hollywoodreporter.com/wp-content/uploads/2016/01/fm2_2250_-_h_2016.jpg?w=2000&h=1126&crop=1');
INSERT INTO `category` (`id`, `name`, `description`, `picture_url`) VALUES (2, 'UFO', 'Unidentified Flying Object', 'https://i.cbc.ca/1.3125437.1435122259!/fileImage/httpImage/image.jpg_gen/derivatives/original_1180/irrelevant-show-aliens.jpg');
INSERT INTO `category` (`id`, `name`, `description`, `picture_url`) VALUES (3, 'Comet', 'Icy, small Solar System body that warms and releases gases when passing close to the Sun', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Lspn_comet_halley.jpg/800px-Lspn_comet_halley.jpg');
INSERT INTO `category` (`id`, `name`, `description`, `picture_url`) VALUES (4, 'Plane', 'Fixed-wing aircraft', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Lockheed_SR-71_Blackbird_%28modified%29.jpg/220px-Lockheed_SR-71_Blackbird_%28modified%29.jpg');
INSERT INTO `category` (`id`, `name`, `description`, `picture_url`) VALUES (5, 'Aurora', 'Northern lights - natural light display in Earth\'s sky', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Church_of_light.jpg/800px-Church_of_light.jpg');
INSERT INTO `category` (`id`, `name`, `description`, `picture_url`) VALUES (6, 'Blimp', 'Blimp or non-rigid airship', 'https://www.slashgear.com/img/gallery/the-mind-boggling-truth-about-blimps/intro-1657748200.webp');

COMMIT;


-- -----------------------------------------------------
-- Data for table `known_object`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `known_object` (`id`, `category_id`, `name`, `description`, `picture_url`) VALUES (1, 1, 'Weather balloon', 'High altitude weather balloon ladened with special equipment to monitor Soviet nuclear testing.', 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Transosonde.png');
INSERT INTO `known_object` (`id`, `category_id`, `name`, `description`, `picture_url`) VALUES (2, 3, 'Comet', 'Icy, small Solar System body that warms and releases gases when passing close to the Sun', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Hubble%27s_Last_Look_at_Comet_ISON_Before_Perihelion.jpg/1280px-Hubble%27s_Last_Look_at_Comet_ISON_Before_Perihelion.jpg');
INSERT INTO `known_object` (`id`, `category_id`, `name`, `description`, `picture_url`) VALUES (3, 5, 'Aurora Borealis', 'Northern lights - natural light display in Earth\'s sky', 'https://th-thumbnailer.cdn-si-edu.com/7dDu-8Sn__AcgQ8vcK98QUIPTQw=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/9c/3c/9c3c8348-46db-48fc-ae33-e0f3461a88a1/istock-487516034.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sighting`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `sighting` (`id`, `user_id`, `location_id`, `known_object_id`, `sighting_date`, `title`, `description`, `date_created`, `picture_url`, `last_update`) VALUES (1, 1, 2, 1, '1947-06-26', 'Roswell incident', 'Found debris – tinfoil, rubber, and thin wooden beams – scattered across a square mile of desert.', '2023-05-18', 'https://libraries.uta.edu/sites/default/files/styles/2_grid_width/public/2019-07/general-ramey.png?itok=a2oi0uS5', '2023-05-18');
INSERT INTO `sighting` (`id`, `user_id`, `location_id`, `known_object_id`, `sighting_date`, `title`, `description`, `date_created`, `picture_url`, `last_update`) VALUES (2, 4, 7, NULL, '2001-07-14', 'Lights Above New Jersey Turnpike', 'Strange orange-and-yellow lights in a V formation over the Arthur Kill Waterway between Staten Island, New York, and Carteret, New Jersey.', '2023-05-19', NULL, '2023-05-19');
INSERT INTO `sighting` (`id`, `user_id`, `location_id`, `known_object_id`, `sighting_date`, `title`, `description`, `date_created`, `picture_url`, `last_update`) VALUES (3, 3, 8, NULL, '2015-01-01', 'East Coast GO FAST', 'Seen along the East Coast on a Raytheon Advanced Targeting Forward-Looking Infrared (ATFLIR) Pod, the craft was similar to that spotted off San Diego in 2004: a fast-moving white oval about 45-feet-long without wings or exhaust plume. \n\nThe pilots tracked the object at 25,000 feet above the Atlantic Ocean as it flew away and simultaneously rotated on its axis. No explanation ever emerged.\n\n', '2023-05-19', 'https://www.navytimes.com/resizer/97FTDT6oyEkt2PalZsOlCk7wKaw=/1024x0/filters:format(png):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/archetype/7HWSGU2RDFCMLJ6K24SDEIT54A.png', '2023-05-19');
INSERT INTO `sighting` (`id`, `user_id`, `location_id`, `known_object_id`, `sighting_date`, `title`, `description`, `date_created`, `picture_url`, `last_update`) VALUES (4, 2, 9, 2, '1995-07-23', 'Comet Hale-Bopp', 'Comet Hale–Bopp (formally designated C/1995 O1) is a comet that was one of the most widely observed of the 20th century and one of the brightest seen for many decades.', '2023-05-19', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Comet_Hale-Bopp_1995O1.jpg/1280px-Comet_Hale-Bopp_1995O1.jpg', '2023-05-19');
INSERT INTO `sighting` (`id`, `user_id`, `location_id`, `known_object_id`, `sighting_date`, `title`, `description`, `date_created`, `picture_url`, `last_update`) VALUES (5, 5, 10, 3, '2023-03-24', 'Alpena Northern Lights', 'Green and purple lights dancing in sky', '2023-05-19', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.visitalpena.com%2Fwhere-to-chase-northern-lights-in-alpena%2F&psig=AOvVaw0ZhpSuRGjcNBKA0K5ejBU5&ust=1684596750117000&source=images&cd=vfe&ved=0CA0QjRxqFwoTCPDjhovagf8CFQAAAAAdAAAAABAD', '2023-05-19');

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `comment` (`id`, `user_id`, `sighting_id`, `in_reply_to`, `comment_date`, `content`) VALUES (1, 1, 1, NULL, '2023-05-18', 'Visiting the Roswell UFO site was fascinating. The mysterious crash and government cover-up added to the intrigue. Walking through the desert, I couldn\'t help but wonder about encounters with aliens.');
INSERT INTO `comment` (`id`, `user_id`, `sighting_id`, `in_reply_to`, `comment_date`, `content`) VALUES (2, 1, 1, 1, '2023-05-18', 'The experience fueled my curiosity about extraterrestrial life and made me reflect on the mysteries of the universe. ');
INSERT INTO `comment` (`id`, `user_id`, `sighting_id`, `in_reply_to`, `comment_date`, `content`) VALUES (3, 2, 2, NULL, '2023-05-19', 'Whoa! That 2001 UFO sighting above the New Jersey Turnpike is seriously mind-blowing! The lights were so bright and moved in a crazy cool way. It\'s like something out of a sci-fi movie!');
INSERT INTO `comment` (`id`, `user_id`, `sighting_id`, `in_reply_to`, `comment_date`, `content`) VALUES (4, 3, 4, NULL, '2023-05-19', 'I remember seeing it in the night sky and being totally mesmerized. The comet had this beautiful tail that stretched across the heavens, and it was like something out of a dream');
INSERT INTO `comment` (`id`, `user_id`, `sighting_id`, `in_reply_to`, `comment_date`, `content`) VALUES (5, 4, 5, NULL, '2023-05-19', 'The recent Northern lights sighting in Michigan must have been absolutely breathtaking! I can only imagine the awe-inspiring colors dancing across the night sky. Nature truly knows how to put on a show.');
INSERT INTO `comment` (`id`, `user_id`, `sighting_id`, `in_reply_to`, `comment_date`, `content`) VALUES (6, 5, 2, 2, '2023-05-19', 'No way! I can\'t believe I missed that UFO sighting above the New Jersey Turnpike in 2001! Your description sounds absolutely incredible');
INSERT INTO `comment` (`id`, `user_id`, `sighting_id`, `in_reply_to`, `comment_date`, `content`) VALUES (7, 3, 5, 5, '2023-05-19', 'I\'ve always wanted to witness the vibrant colors and graceful movements of the auroras. It must have been an unforgettable experience to witness nature\'s light show firsthand. ');
INSERT INTO `comment` (`id`, `user_id`, `sighting_id`, `in_reply_to`, `comment_date`, `content`) VALUES (8, 2, 1, 2, '2023-05-19', 'A crashed UFO and rumored extraterrestrial beings? It\'s mind-blowing to think about what might have really happened. ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sighting_has_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `sighting_has_category` (`sighting_id`, `category_id`) VALUES (1, 1);
INSERT INTO `sighting_has_category` (`sighting_id`, `category_id`) VALUES (2, 2);
INSERT INTO `sighting_has_category` (`sighting_id`, `category_id`) VALUES (3, 2);
INSERT INTO `sighting_has_category` (`sighting_id`, `category_id`) VALUES (4, 3);
INSERT INTO `sighting_has_category` (`sighting_id`, `category_id`) VALUES (5, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sighting_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `sighting_image` (`id`, `sighting_id`, `caption`, `image_url`) VALUES (1, 1, 'Air Force personnel identify metallic fragments found by a farmer near Roswell, New Mexico, in 1947 as pieces of a weather balloon. The discovery of the fragments became the basis of the Roswell incident.', 'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-560w,f_auto,q_auto:best/newscms/2017_28/2070136/170712-roswell-mn-1245.jpg');
INSERT INTO `sighting_image` (`id`, `sighting_id`, `caption`, `image_url`) VALUES (2, 3, 'A fast-moving white oval about 45-feet-long without wings or exhaust plume.', 'https://www.navytimes.com/resizer/97FTDT6oyEkt2PalZsOlCk7wKaw=/1024x0/filters:format(png):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/archetype/7HWSGU2RDFCMLJ6K24SDEIT54A.png');
INSERT INTO `sighting_image` (`id`, `sighting_id`, `caption`, `image_url`) VALUES (3, 4, 'Comet Hale-Boppm, shortly after passing perihelion in April 1997.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Comet_Hale-Bopp_1995O1.jpg/1280px-Comet_Hale-Bopp_1995O1.jpg');
INSERT INTO `sighting_image` (`id`, `sighting_id`, `caption`, `image_url`) VALUES (4, 5, 'Northern lights spotted in Alpena, MI.', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.visitalpena.com%2Fwhere-to-chase-northern-lights-in-alpena%2F&psig=AOvVaw0ZhpSuRGjcNBKA0K5ejBU5&ust=1684596750117000&source=images&cd=vfe&ved=0CA0QjRxqFwoTCPDjhovagf8CFQAAAAAdAAAAABAD');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sighting_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `sighting_rating` (`user_id`, `sighting_id`, `rating`, `rating_date`, `rating_comment`) VALUES (1, 1, 4, '2023-05-18', 'The OG');
INSERT INTO `sighting_rating` (`user_id`, `sighting_id`, `rating`, `rating_date`, `rating_comment`) VALUES (2, 3, 5, '2023-05-19', NULL);
INSERT INTO `sighting_rating` (`user_id`, `sighting_id`, `rating`, `rating_date`, `rating_comment`) VALUES (3, 4, 3, '2023-05-19', NULL);
INSERT INTO `sighting_rating` (`user_id`, `sighting_id`, `rating`, `rating_date`, `rating_comment`) VALUES (4, 3, 5, '2023-05-19', NULL);
INSERT INTO `sighting_rating` (`user_id`, `sighting_id`, `rating`, `rating_date`, `rating_comment`) VALUES (5, 1, 5, '2023-05-19', NULL);
INSERT INTO `sighting_rating` (`user_id`, `sighting_id`, `rating`, `rating_date`, `rating_comment`) VALUES (5, 3, 5, '2023-05-19', NULL);
INSERT INTO `sighting_rating` (`user_id`, `sighting_id`, `rating`, `rating_date`, `rating_comment`) VALUES (4, 5, 4, '2023-05-19', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `skyreportdb`;
INSERT INTO `user_has_comment` (`user_id`, `comment_id`, `comment_vote`) VALUES (1, 1, 1);
INSERT INTO `user_has_comment` (`user_id`, `comment_id`, `comment_vote`) VALUES (1, 2, NULL);
INSERT INTO `user_has_comment` (`user_id`, `comment_id`, `comment_vote`) VALUES (2, 3, NULL);
INSERT INTO `user_has_comment` (`user_id`, `comment_id`, `comment_vote`) VALUES (2, 8, NULL);
INSERT INTO `user_has_comment` (`user_id`, `comment_id`, `comment_vote`) VALUES (3, 4, NULL);
INSERT INTO `user_has_comment` (`user_id`, `comment_id`, `comment_vote`) VALUES (3, 7, NULL);
INSERT INTO `user_has_comment` (`user_id`, `comment_id`, `comment_vote`) VALUES (4, 5, NULL);
INSERT INTO `user_has_comment` (`user_id`, `comment_id`, `comment_vote`) VALUES (5, 6, NULL);

COMMIT;

