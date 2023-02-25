# Livia Jacklinne Ramos Moreira 1731

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

# Tabela endereço
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` 
(
  `idEndereco` INT NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereco`)
  );

# Tabela Cliente
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` 
(
  `CPF` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `idade` INT NOT NULL,
  `dataNascimento` VARCHAR(15) NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`CPF`),
  CONSTRAINT `fk_Cliente_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `mydb`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

# Tabela aparelho
CREATE TABLE IF NOT EXISTS `mydb`.`Aparelho` 
(
  `idAparelho` INT NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `RAM` VARCHAR(45) NOT NULL,
  `anoFabricacao` INT NOT NULL,
  `preco` VARCHAR(45) NOT NULL,
  `memoria` VARCHAR(45) NOT NULL,
  `Cliente_CPF` INT NOT NULL,
  PRIMARY KEY (`idAparelho`),
  INDEX `fk_Aparelho_Cliente_idx` (`Cliente_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Aparelho_Cliente`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `mydb`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );


-- -----------------------------------------------------
-- Table `mydb`.`App`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`App` 
(
  `idApp` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idApp`)
  );


-- -----------------------------------------------------
-- Table `mydb`.`Download`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Download` 
(
  `App_idApp` INT NOT NULL,
  `Aparelho_idAparelho` INT NOT NULL,
  `hora` VARCHAR(45) NOT NULL,
  `versao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`App_idApp`, `Aparelho_idAparelho`),
  CONSTRAINT `fk_App_has_Aparelho_App1`
    FOREIGN KEY (`App_idApp`)
    REFERENCES `mydb`.`App` (`idApp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_App_has_Aparelho_Aparelho1`
    FOREIGN KEY (`Aparelho_idAparelho`)
    REFERENCES `mydb`.`Aparelho` (`idAparelho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

-- -----------------------------------------------------
-- Table `mydb`.`Conexao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Conexao` 
(
  `Aparelho_idAparelho` INT NOT NULL,
  `Aparelho_idAparelho1` INT NOT NULL,
  `tipoConexao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Aparelho_idAparelho`, `Aparelho_idAparelho1`),
  CONSTRAINT `fk_Aparelho_has_Aparelho_Aparelho1`
    FOREIGN KEY (`Aparelho_idAparelho`)
    REFERENCES `mydb`.`Aparelho` (`idAparelho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aparelho_has_Aparelho_Aparelho2`
    FOREIGN KEY (`Aparelho_idAparelho1`)
    REFERENCES `mydb`.`Aparelho` (`idAparelho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

# Apagar SET no começo e no final do código
# Apagar "Engineer"
# Apagar INDEX