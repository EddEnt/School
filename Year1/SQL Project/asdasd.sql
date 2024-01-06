-- MySQL Script generated by MySQL Workbench
-- Sat Apr  6 10:57:17 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema group30
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema group30
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `group30` DEFAULT CHARACTER SET utf8 ;
USE `group30` ;

-- -----------------------------------------------------
-- Table `group30`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`departments` (
  `department_id` INT NOT NULL,
  `manager_id` INT NOT NULL,
  `department_name` VARCHAR(30) NOT NULL,
  `floor` INT NOT NULL,
  `room_number` INT NULL,
  `phone_number` CHAR(12) NOT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `fk_Departments_Employees1_idx` (`manager_id` ASC) VISIBLE,
  CONSTRAINT `fk_Departments_Employees1`
    FOREIGN KEY (`manager_id`)
    REFERENCES `group30`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`employee_description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`employee_description` (
  `employee_type` VARCHAR(45) NOT NULL,
  `description` VARCHAR(10) NULL,
  `benefits` VARCHAR(20) NULL,
  `pay` VARCHAR(10) NULL,
  PRIMARY KEY (`employee_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`employees` (
  `employee_id` INT NOT NULL,
  `department_id` INT NULL,
  `employee_type` VARCHAR(45) NOT NULL,
  `spouse_id` INT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NULL,
  `birth_date` DATE NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `postal_code` CHAR(6) NULL,
  `SIN` CHAR(9) NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_Employees_Employees_idx` (`spouse_id` ASC) VISIBLE,
  INDEX `fk_Employees_Departments1_idx` (`department_id` ASC) VISIBLE,
  INDEX `fk_employees_employee_description1_idx` (`employee_type` ASC) VISIBLE,
  CONSTRAINT `fk_Employees_Employees`
    FOREIGN KEY (`spouse_id`)
    REFERENCES `group30`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employees_Departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `group30`.`departments` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_employee_description1`
    FOREIGN KEY (`employee_type`)
    REFERENCES `group30`.`employee_description` (`employee_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`dependants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`dependants` (
  `dependant_id` INT NOT NULL,
  `first_name` VARCHAR(30) NULL,
  `last_name` VARCHAR(30) NULL,
  `address` VARCHAR(30) NULL,
  `city` VARCHAR(30) NULL,
  `postal_code` CHAR(6) NULL,
  `birth_date` DATE NOT NULL,
  PRIMARY KEY (`dependant_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`clients` (
  `client_id` INT NOT NULL,
  `client_name` VARCHAR(30) NULL,
  `address` VARCHAR(30) NULL,
  `city` VARCHAR(30) NULL,
  `postal_code` CHAR(6) NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`projects` (
  `project_id` INT NOT NULL,
  `client_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `delivery_date` DATE NULL,
  `cost` DOUBLE NULL,
  PRIMARY KEY (`project_id`),
  INDEX `fk_Projects_Clients1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_Projects_Clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `group30`.`clients` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`vendors` (
  `vendor_id` INT NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `address` VARCHAR(30) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `city` VARCHAR(30) NOT NULL,
  `postal_code` CHAR(6) NOT NULL,
  `contact_name` VARCHAR(30) NULL,
  PRIMARY KEY (`vendor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`Skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`Skills` (
  `skill_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`skill_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`tasks` (
  `task_id` INT NOT NULL,
  `skills_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  `employee_id` INT NULL,
  `description` VARCHAR(45) NULL,
  `total_hours` INT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  PRIMARY KEY (`task_id`),
  INDEX `fk_Tasks_Skills1_idx` (`skills_id` ASC) VISIBLE,
  INDEX `fk_Tasks_Employees1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_Tasks_Projects1_idx` (`project_id` ASC) VISIBLE,
  CONSTRAINT `fk_Tasks_Skills1`
    FOREIGN KEY (`skills_id`)
    REFERENCES `group30`.`Skills` (`skill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tasks_Employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `group30`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tasks_Projects1`
    FOREIGN KEY (`project_id`)
    REFERENCES `group30`.`projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`models`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`models` (
  `model_id` INT NOT NULL,
  `model_name` VARCHAR(45) NULL,
  `model_desc` VARCHAR(45) NULL,
  `quantity_on_hand` INT NULL,
  PRIMARY KEY (`model_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`equipment` (
  `equipment_id` INT NOT NULL,
  `model_id` INT NOT NULL,
  `task_id` INT NULL,
  PRIMARY KEY (`equipment_id`),
  INDEX `fk_Equipment_Tasks1_idx` (`task_id` ASC) VISIBLE,
  INDEX `fk_equipment_models1_idx` (`model_id` ASC) VISIBLE,
  CONSTRAINT `fk_Equipment_Tasks1`
    FOREIGN KEY (`task_id`)
    REFERENCES `group30`.`tasks` (`task_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipment_models1`
    FOREIGN KEY (`model_id`)
    REFERENCES `group30`.`models` (`model_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`employee_dependants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`employee_dependants` (
  `dependant_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`dependant_id`, `employee_id`),
  INDEX `fk_Dependants_has_Employees_Employees1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_Dependants_has_Employees_Dependants1_idx` (`dependant_id` ASC) VISIBLE,
  CONSTRAINT `fk_Dependants_has_Employees_Dependants1`
    FOREIGN KEY (`dependant_id`)
    REFERENCES `group30`.`dependants` (`dependant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dependants_has_Employees_Employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `group30`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`employee_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`employee_skills` (
  `employee_id` INT NOT NULL,
  `skill_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `skill_id`),
  INDEX `fk_Employees_has_Skills_Skills1_idx` (`skill_id` ASC) VISIBLE,
  INDEX `fk_Employees_has_Skills_Employees1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_Employees_has_Skills_Employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `group30`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employees_has_Skills_Skills1`
    FOREIGN KEY (`skill_id`)
    REFERENCES `group30`.`Skills` (`skill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`invoices` (
  `invoice_id` INT NOT NULL,
  `vendor_id` INT NOT NULL,
  `model_id` VARCHAR(45) NULL,
  `quantity` VARCHAR(45) NULL,
  `total_cost` INT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `fk_invoices_vendors1_idx` (`vendor_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_vendors1`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `group30`.`vendors` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group30`.`models_invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group30`.`models_invoices` (
  `model_id` INT NOT NULL,
  `invoice_id` INT NOT NULL,
  `quantity` INT NULL,
  `model_cost` DOUBLE NULL,
  PRIMARY KEY (`model_id`, `invoice_id`),
  INDEX `fk_models_has_invoices_invoices1_idx` (`invoice_id` ASC) VISIBLE,
  INDEX `fk_models_has_invoices_models1_idx` (`model_id` ASC) VISIBLE,
  CONSTRAINT `fk_models_has_invoices_models1`
    FOREIGN KEY (`model_id`)
    REFERENCES `group30`.`models` (`model_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_models_has_invoices_invoices1`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `group30`.`invoices` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;