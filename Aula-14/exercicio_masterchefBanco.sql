drop database if exists masterchef;
create database masterchef;

use masterchef;
#RELACIONAMENTO N:M ENTRE JURADO E COMPETIDOR
#JULGAR É A TABELA INTERMEDIARIA
create table Competidor(
	id int not null auto_increment,
    nome varchar(100) not null,
    idade int not null,
    profissao varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(2) not null,
    primary key(id)
);

create table Jurado(
	id int not null auto_increment,
    nome varchar(100) not null,
    paisOrigem varchar(100) not null,
    primary key(id)
);

create table Julgar(
	idCompetidor int not null,
    idJurado int not null,
	CONSTRAINT fk1
    foreign key (idCompetidor) 
    references Competidor (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    CONSTRAINT fk2
    foreign key (idJurado) 
    references Jurado (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    PRIMARY KEY(idCompetidor, idJurado)
);

create table Prato(
	id int not null auto_increment,
    tipoCulinaria varchar(50) not null,
    idCompetidor int not null,
    nota float not null,
    primary key(id),
    CONSTRAINT fk3
    foreign key (idCompetidor) 
    references Competidor (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

insert into Competidor(nome, idade, profissao, cidade, estado) values
('Janaina Caetano', '38', 'Taróloga', 'Diadema', 'SP'), #1
('Rodrigo Massoni', '33', 'Engenheiro Ambiental', 'Osasco', 'SP'), #2
('Lorena Dayse', '35', 'Enfermeira', 'Teresina', 'PI'), #3
('Helton Oliveira', '19', 'Estudante', 'Jacutinga', 'MG'),#4
('Haila Santuá', '25', 'Publicitária', 'Chapadão do Céu', 'GO'), #5
('Uttoni','20', 'Estudante', 'Borda da Mata', 'MG');#6

insert into Jurado(nome, paisOrigem) values
('Paola Carosella', 'Argentina'),
('Érick Jacquin', 'França'),
('Henrique Fogaça', 'Brasil');

insert into Julgar(idJurado, idCompetidor) values
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('2', '3'),
('2', '5'),
('3', '1'),
('3', '2'),
('3', '4');

insert into Prato(tipoCulinaria, nota, idCompetidor) values
('Japonesa', '9.5', '1'),
('Italiana', '8.7', '1'),
('Francesa', '9.2', '2'),
('Brasileira', '4.6', '3'),
('Francesa', '2.7', '4'),
('Francesa', '8.0', '4'),
('Chinesa', '7.5', '4'),
('Japonesa', '3.0', '5');

#Busca 1
select Prato.nota, Competidor.nome,Competidor.idade, Competidor.cidade, Competidor.estado from Prato, Competidor where Competidor.estado = "SP";
# Busca 2
select Competidor.nome, Competidor.idade, Competidor.profissao from Competidor, Jurado where Jurado.nome = "Paola Carosella";
# Busca 3
select AVG(Prato.nota) from Prato, Competidor where Competidor.profissao like "E%";
# Busca 4
select * from Prato, Competidor where Prato.nota = (select max(Prato.nota) from Prato) and Competidor.idade < 28;
# Busca 5
select Jurado.nome, Jurado.pais, Competidor.nome, Competidor.idade, Competidor.cidade from Competidor, Jurado where Competidor.estado != "SP";
# Busca 6
select distinct(Prato.tipoCulinaria) from Prato, Competidor where Competidor.estado = "SP";


