drop database if exists cinema;
CREATE DATABASE IF NOT EXISTS cinema;

USE cinema;

CREATE TABLE IF NOT EXISTS Filme(
	id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    tempo INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Ator(
	id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    dataNasc varchar(40) NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    idFilme INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_ator_filme
		FOREIGN KEY(idFilme)
        REFERENCES filme(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

# Adicionando dados da tabela 
alter table Ator ADD pais varchar (50);
alter table Ator ADD idioma varchar (50);

select * from Ator;
select * from Filme;

# Alterando dados da tabela. Mudando dataNasc para idade, do tipo int e not null;
alter table Ator change dataNasc idade int not null;

# Removendo coluna da tabela
alter table Ator drop column sexo;

# Inserindo dados na tabela Filme
insert into Filme() values(1, "Jogos Vorazes", "açao", 143);
insert into Filme() values(2, "O destino de jupiter", "ficçao", 127);

# Inserindo dados na tabela Ator
insert into Ator() values(1, "Jennifer Lawrence", 30, 1, "EUA");


