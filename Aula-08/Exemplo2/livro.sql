drop database if exists integracao2;
create database integracao2;

use integracao2;

create table livro
(
	id int auto_increment primary key,
    nome varchar(20) not null,
	editora varchar(20) not null,
	ano int not null
);

select*from livro;