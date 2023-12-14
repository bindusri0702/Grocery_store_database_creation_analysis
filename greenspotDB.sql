-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema greenspotDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema greenspotDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `greenspotDB` DEFAULT CHARACTER SET utf8 ;
USE `greenspotDB` ;

-- -----------------------------------------------------
-- Table `greenspotDB`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greenspotDB`.`items` (
  `item_num` INT NOT NULL,
  `description` TEXT NOT NULL,
  `vendor` VARCHAR(80) NULL,
  `item_type` VARCHAR(40) NOT NULL,
  `unit` VARCHAR(25) NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`item_num`),
  UNIQUE INDEX `item_num_UNIQUE` (`item_num` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `greenspotDB`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greenspotDB`.`purchase` (
  `purchase_id` INT NOT NULL,
  `item_num` INT(11) NOT NULL,
  `purchase_date` DATE NOT NULL,
  `cost` FLOAT NOT NULL,
  `items_item_num` INT NOT NULL,
  PRIMARY KEY (`purchase_id`),
  UNIQUE INDEX `purchase_id_UNIQUE` (`purchase_id` ASC) ,
  INDEX `fk_purchase_items1_idx` (`items_item_num` ASC) ,
  CONSTRAINT `fk_purchase_items1`
    FOREIGN KEY (`items_item_num`)
    REFERENCES `greenspotDB`.`items` (`item_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `greenspotDB`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greenspotDB`.`stock` (
  `stock_id` INT NOT NULL,
  `item_num` INT NOT NULL,
  `in_stock` INT NOT NULL,
  `date` DATE NULL,
  `items_item_num` INT NOT NULL,
  PRIMARY KEY (`stock_id`),
  INDEX `fk_stock_items_idx` (`items_item_num` ASC) ,
  CONSTRAINT `fk_stock_items`
    FOREIGN KEY (`items_item_num`)
    REFERENCES `greenspotDB`.`items` (`item_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `greenspotDB`.`customer_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greenspotDB`.`customer_details` (
  `cust_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cust_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `greenspotDB`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greenspotDB`.`orders` (
  `order_id` INT NOT NULL,
  `cust_id` INT NULL,
  `date_sold` DATE NOT NULL,
  `customer_details_cust_id` INT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_customer_details1_idx` (`customer_details_cust_id` ASC) ,
  CONSTRAINT `fk_orders_customer_details1`
    FOREIGN KEY (`customer_details_cust_id`)
    REFERENCES `greenspotDB`.`customer_details` (`cust_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `greenspotDB`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greenspotDB`.`order_items` (
  `order_item_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `item_num` VARCHAR(45) NOT NULL,
  `price` FLOAT NOT NULL,
  `quantity` INT NOT NULL,
  `orders_order_id` INT NOT NULL,
  `items_item_num` INT NOT NULL,
  PRIMARY KEY (`order_item_id`, `orders_order_id`, `items_item_num`),
  INDEX `fk_order_items_orders1_idx` (`orders_order_id` ASC) ,
  INDEX `fk_order_items_items1_idx` (`items_item_num` ASC) ,
  CONSTRAINT `fk_order_items_orders1`
    FOREIGN KEY (`orders_order_id`)
    REFERENCES `greenspotDB`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_items_items1`
    FOREIGN KEY (`items_item_num`)
    REFERENCES `greenspotDB`.`items` (`item_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
