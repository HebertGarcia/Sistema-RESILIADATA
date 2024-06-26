-- MySQL Script generated by MySQL Workbench
-- Mon May  6 20:35:33 2024
-- Model: Sakila Full    Version: 2.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sakila
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sakila
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sakila` ;
USE `sakila` ;

-- -----------------------------------------------------
-- Table `sakila`.`colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`colaborador` (
  `idcolaborador` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NULL,
  `empresa_id` INT NULL,
  PRIMARY KEY (`idcolaborador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`empresa` (
  `idempresa` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `setor` VARCHAR(45) NULL,
  `colaborador_idcolaborador` INT NOT NULL,
  PRIMARY KEY (`idempresa`),
  INDEX `fk_empresa_colaborador_idx` (`colaborador_idcolaborador` ASC),
  CONSTRAINT `fk_empresa_colaborador`
    FOREIGN KEY (`colaborador_idcolaborador`)
    REFERENCES `sakila`.`colaborador` (`idcolaborador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila`.`tecnologia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`tecnologia` (
  `idtecnologia` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `área` VARCHAR(45) NULL,
  `empresa_id` INT NULL,
  PRIMARY KEY (`idtecnologia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila`.`empresa_has_tecnologia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`empresa_has_tecnologia` (
  `empresa_idempresa` INT NOT NULL,
  `tecnologia_idtecnologia` INT NOT NULL,
  PRIMARY KEY (`empresa_idempresa`, `tecnologia_idtecnologia`),
  INDEX `fk_empresa_has_tecnologia_tecnologia1_idx` (`tecnologia_idtecnologia` ASC),
  INDEX `fk_empresa_has_tecnologia_empresa1_idx` (`empresa_idempresa` ASC),
  CONSTRAINT `fk_empresa_has_tecnologia_empresa1`
    FOREIGN KEY (`empresa_idempresa`)
    REFERENCES `sakila`.`empresa` (`idempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_has_tecnologia_tecnologia1`
    FOREIGN KEY (`tecnologia_idtecnologia`)
    REFERENCES `sakila`.`tecnologia` (`idtecnologia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila`.`colaborador_tecnologia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`colaborador_tecnologia` (
  `colaborador_id` INT NOT NULL,
  `tecnologia_id` INT NOT NULL,
  PRIMARY KEY (`colaborador_id`, `tecnologia_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila`.`colaborador_has_colaborador_tecnologia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`colaborador_has_colaborador_tecnologia` (
  `colaborador_idcolaborador` INT NOT NULL,
  `colaborador_tecnologia_colaborador_id` INT NOT NULL,
  `colaborador_tecnologia_tecnologia_id` INT NOT NULL,
  PRIMARY KEY (`colaborador_idcolaborador`, `colaborador_tecnologia_colaborador_id`, `colaborador_tecnologia_tecnologia_id`),
  INDEX `fk_colaborador_has_colaborador_tecnologia_colaborador_tecno_idx` (`colaborador_tecnologia_colaborador_id` ASC, `colaborador_tecnologia_tecnologia_id` ASC),
  INDEX `fk_colaborador_has_colaborador_tecnologia_colaborador1_idx` (`colaborador_idcolaborador` ASC),
  CONSTRAINT `fk_colaborador_has_colaborador_tecnologia_colaborador1`
    FOREIGN KEY (`colaborador_idcolaborador`)
    REFERENCES `sakila`.`colaborador` (`idcolaborador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_colaborador_has_colaborador_tecnologia_colaborador_tecnolo1`
    FOREIGN KEY (`colaborador_tecnologia_colaborador_id` , `colaborador_tecnologia_tecnologia_id`)
    REFERENCES `sakila`.`colaborador_tecnologia` (`colaborador_id` , `tecnologia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila`.`tecnologia_has_colaborador_tecnologia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`tecnologia_has_colaborador_tecnologia` (
  `tecnologia_idtecnologia` INT NOT NULL,
  `colaborador_tecnologia_colaborador_id` INT NOT NULL,
  `colaborador_tecnologia_tecnologia_id` INT NOT NULL,
  PRIMARY KEY (`tecnologia_idtecnologia`, `colaborador_tecnologia_colaborador_id`, `colaborador_tecnologia_tecnologia_id`),
  INDEX `fk_tecnologia_has_colaborador_tecnologia_colaborador_tecnol_idx` (`colaborador_tecnologia_colaborador_id` ASC, `colaborador_tecnologia_tecnologia_id` ASC),
  INDEX `fk_tecnologia_has_colaborador_tecnologia_tecnologia1_idx` (`tecnologia_idtecnologia` ASC),
  CONSTRAINT `fk_tecnologia_has_colaborador_tecnologia_tecnologia1`
    FOREIGN KEY (`tecnologia_idtecnologia`)
    REFERENCES `sakila`.`tecnologia` (`idtecnologia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tecnologia_has_colaborador_tecnologia_colaborador_tecnolog1`
    FOREIGN KEY (`colaborador_tecnologia_colaborador_id` , `colaborador_tecnologia_tecnologia_id`)
    REFERENCES `sakila`.`colaborador_tecnologia` (`colaborador_id` , `tecnologia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
