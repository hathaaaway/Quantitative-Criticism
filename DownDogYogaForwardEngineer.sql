-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema alba0261DownDogYoga
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `alba0261DownDogYoga` ;

-- -----------------------------------------------------
-- Schema alba0261DownDogYoga
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `alba0261DownDogYoga` DEFAULT CHARACTER SET utf8 ;
USE `alba0261DownDogYoga` ;

-- -----------------------------------------------------
-- Table `Classes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Classes` ;

CREATE TABLE IF NOT EXISTS `Classes` (
  `ClassId` INT NOT NULL AUTO_INCREMENT,
  `ClassName` VARCHAR(45) NULL,
  `DifficultyLevel` VARCHAR(45) NULL,
  `Length` INT NULL,
  PRIMARY KEY (`ClassId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studios` ;

CREATE TABLE IF NOT EXISTS `Studios` (
  `StudioID` INT NOT NULL AUTO_INCREMENT,
  `StudioName` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  PRIMARY KEY (`StudioID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Memberships`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Memberships` ;

CREATE TABLE IF NOT EXISTS `Memberships` (
  `MembershipID` INT NOT NULL AUTO_INCREMENT,
  `MembershipType` VARCHAR(45) NULL,
  `Cost` INT NULL,
  PRIMARY KEY (`MembershipID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Students` ;

CREATE TABLE IF NOT EXISTS `Students` (
  `StudentID` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `age` INT NULL,
  PRIMARY KEY (`StudentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Volunteers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Volunteers` ;

CREATE TABLE IF NOT EXISTS `Volunteers` (
  `VolunteerID` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `age` INT NULL,
  `volunteerhours` INT NULL,
  PRIMARY KEY (`VolunteerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Staff` ;

CREATE TABLE IF NOT EXISTS `Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClassSchedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ClassSchedule` ;

CREATE TABLE IF NOT EXISTS `ClassSchedule` (
  `ClassScheduleID` INT NOT NULL AUTO_INCREMENT,
  `ClassId` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `StudioID` INT NOT NULL,
  `VolunteerID` INT NOT NULL,
  `Time` VARCHAR(45) NULL,
  `ClassDate` DATE NULL,
  INDEX `fk_Schedule_Classes1_idx` (`ClassId` ASC),
  INDEX `fk_Schedule_Staff1_idx` (`StaffID` ASC),
  INDEX `fk_Schedule_Studios1_idx` (`StudioID` ASC),
  INDEX `fk_Schedule_Volunteers1_idx` (`VolunteerID` ASC),
  PRIMARY KEY (`ClassScheduleID`),
  CONSTRAINT `fk_Schedule_Classes1`
    FOREIGN KEY (`ClassId`)
    REFERENCES `Classes` (`ClassId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Staff1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Studios1`
    FOREIGN KEY (`StudioID`)
    REFERENCES `Studios` (`StudioID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Volunteers1`
    FOREIGN KEY (`VolunteerID`)
    REFERENCES `Volunteers` (`VolunteerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Members` ;

CREATE TABLE IF NOT EXISTS `Members` (
  `StudentID` INT NOT NULL,
  `MembershipID` INT NOT NULL,
  `StartDate` DATE NULL,
  `EndDate` DATE NULL,
  INDEX `fk_Students_has_Memberships_Memberships1_idx` (`MembershipID` ASC),
  INDEX `fk_Students_has_Memberships_Students_idx` (`StudentID` ASC),
  CONSTRAINT `fk_Students_has_Memberships_Students`
    FOREIGN KEY (`StudentID`)
    REFERENCES `Students` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_has_Memberships_Memberships1`
    FOREIGN KEY (`MembershipID`)
    REFERENCES `Memberships` (`MembershipID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ClassesTaken`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ClassesTaken` ;

CREATE TABLE IF NOT EXISTS `ClassesTaken` (
  `StudentID` INT NOT NULL,
  `ClassScheduleID` INT NOT NULL,
  INDEX `fk_Students_has_ClassSchedule_ClassSchedule1_idx` (`ClassScheduleID` ASC),
  INDEX `fk_Students_has_ClassSchedule_Students1_idx` (`StudentID` ASC),
  CONSTRAINT `fk_Students_has_ClassSchedule_Students1`
    FOREIGN KEY (`StudentID`)
    REFERENCES `Students` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_has_ClassSchedule_ClassSchedule1`
    FOREIGN KEY (`ClassScheduleID`)
    REFERENCES `ClassSchedule` (`ClassScheduleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
