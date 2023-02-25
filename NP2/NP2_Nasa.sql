-- MySQL Workbench Forward Engineering

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Planeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Planeta` 
(
  `idPlaneta` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `massa` FLOAT NOT NULL,
  `tamanho` FLOAT NOT NULL,
  `habitavel` TINYINT NOT NULL,
  PRIMARY KEY (`idPlaneta`)
  );

-- -----------------------------------------------------
-- Table `mydb`.`Estrela`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estrela` (
  `idEstrela` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `massa` FLOAT NOT NULL,
  `tamanho` FLOAT NOT NULL,
  `luminosidade` FLOAT NOT NULL,
  `galaxia` VARCHAR(45) NOT NULL,
  `Planeta_idPlaneta` INT NOT NULL,
  PRIMARY KEY (`idEstrela`),
  CONSTRAINT `fk_Estrela_Planeta`
    FOREIGN KEY (`Planeta_idPlaneta`)
    REFERENCES `mydb`.`Planeta` (`idPlaneta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- -----------------------------------------------------
-- Table `mydb`.`Nave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nave` (
  `idNave` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `tripulantes` INT NOT NULL,
  `passageiros` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idNave`));

-- -----------------------------------------------------
-- Table `mydb`.`Mapa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mapa` (
  `idMapa` INT NOT NULL,
  `escala` FLOAT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `orientacoes` VARCHAR(45) NOT NULL,
  `obstaculos` INT NULL,
  PRIMARY KEY (`idMapa`));

-- -----------------------------------------------------
-- Table `mydb`.`Viagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Viagem` (
  `Planeta_idPlaneta` INT NOT NULL,
  `Nave_idNave` INT NOT NULL,
  `tempoDuracao` VARCHAR(45) NOT NULL,
  `distancia` FLOAT NOT NULL,
  `Mapa_idMapa` INT NOT NULL,
  PRIMARY KEY (`Planeta_idPlaneta`, `Nave_idNave`),
  CONSTRAINT `fk_Planeta_has_Nave_Planeta1`
    FOREIGN KEY (`Planeta_idPlaneta`)
    REFERENCES `mydb`.`Planeta` (`idPlaneta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Planeta_has_Nave_Nave1`
    FOREIGN KEY (`Nave_idNave`)
    REFERENCES `mydb`.`Nave` (`idNave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Viagem_Mapa1`
    FOREIGN KEY (`Mapa_idMapa`)
    REFERENCES `mydb`.`Mapa` (`idMapa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mydb`.`Passageiros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Passageiros` (
  `idPassageiros` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `profissao` VARCHAR(45) NULL,
  `Nave_idNave` INT NOT NULL,
  PRIMARY KEY (`idPassageiros`),
  CONSTRAINT `fk_Passageiros_Nave1`
    FOREIGN KEY (`Nave_idNave`)
    REFERENCES `mydb`.`Nave` (`idNave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Tripulantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tripulantes` (
  `idTripulante` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `profissao` VARCHAR(45) NOT NULL,
  `nomeSupervisor` VARCHAR(45) NOT NULL,
  `Nave_idNave` INT NOT NULL,
  `Tripulantes_idTripulante` INT NOT NULL,
  PRIMARY KEY (`idTripulante`),
  CONSTRAINT `fk_Tripulantes_Nave1`
    FOREIGN KEY (`Nave_idNave`)
    REFERENCES `mydb`.`Nave` (`idNave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tripulantes_Tripulantes1`
    FOREIGN KEY (`Tripulantes_idTripulante`)
    REFERENCES `mydb`.`Tripulantes` (`idTripulante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
