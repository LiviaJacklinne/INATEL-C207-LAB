drop database if exists Faculdade;
create database Faculdade;
use Faculdade;

create table curso
(
	id int auto_increment primary key,
    nome varchar(50),
);

create table aluno
(
	id int auto_increment primary key,
    nome varchar(50) not null,
    idade int not null,
    idCurso int, # Chave estrangeira
    constraint fkCurso # 
		foreign key (idCurso) # Chave estrangeira
        references curso(id) # Referência do id, da tabela curso
			ON DELETE CASCADE 
            ON UPDATE CASCADE
);

create table professor
(
	id int auto_increment primary key,
    nome varchar (50)
);