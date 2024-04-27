-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `bookingID` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `tablenumber` INT NOT NULL,
  PRIMARY KEY (`bookingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `orderDate` DATETIME NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` DECIMAL NOT NULL,
  PRIMARY KEY (`orderID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order Delivery Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order Delivery Status` (
  `orderID` INT NOT NULL,
  `deliveryDate` DATETIME NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  UNIQUE INDEX `orderID_UNIQUE` (`orderID` ASC),
  CONSTRAINT `orderID`
    FOREIGN KEY (`orderID`)
    REFERENCES `mydb`.`Orders` (`orderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menu` (
  `idMenu` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `price` DATETIME NOT NULL,
  `itemName` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idMenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu_has_Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menu_has_Orders` (
  `Menu_idMenu` INT NOT NULL,
  `Orders_orderID` INT NOT NULL,
  PRIMARY KEY (`Menu_idMenu`, `Orders_orderID`),
  INDEX `fk_Menu_has_Orders_Orders1_idx` (`Orders_orderID` ASC) VISIBLE,
  INDEX `fk_Menu_has_Orders_Menu1_idx` (`Menu_idMenu` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_has_Orders_Menu1`
    FOREIGN KEY (`Menu_idMenu`)
    REFERENCES `mydb`.`Menu` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menu_has_Orders_Orders1`
    FOREIGN KEY (`Orders_orderID`)
    REFERENCES `mydb`.`Orders` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `customerid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customerid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff Info` (
  `idStaff` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`idStaff`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `idStaff` INT NOT NULL,
  `salary` DECIMAL(6,2) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStaff`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `customerid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customerid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings_has_Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings_has_Customers` (
  `Bookings_bookingID` INT NOT NULL,
  `Customers_customerid` INT NOT NULL,
  PRIMARY KEY (`Bookings_bookingID`, `Customers_customerid`),
  INDEX `fk_Bookings_has_Customers_Customers1_idx` (`Customers_customerid` ASC) VISIBLE,
  INDEX `fk_Bookings_has_Customers_Bookings1_idx` (`Bookings_bookingID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_has_Customers_Bookings1`
    FOREIGN KEY (`Bookings_bookingID`)
    REFERENCES `mydb`.`Bookings` (`bookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_has_Customers_Customers1`
    FOREIGN KEY (`Customers_customerid`)
    REFERENCES `mydb`.`Customers` (`customerid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
