drop database if exists aula17;
create database if not exists aula17;

use aula17;

create table if not exists aluno
(
	matricula int,
    curso varchar(3),
    nome varchar(100),
    email varchar(50),
    primary key(matricula, curso)
);

create table if not exists produto
(
	id int auto_increment primary key,
    nome varchar(40),
    preco float,
    quantidade int
);

create table if not exists compra
(
	id int auto_increment primary key,
    preco float,
    pagamento float
);

-- Criando aluno
insert into aluno(matricula, curso, nome, email) values 
(1731, "GEC", "Livia", "livia@inatel.br"),
(1732, "GEC", "Ana", "ana@inatel.br"),
(1733, "GES", "Pedro", "pedro@inatel.br");

-- Criando produto
insert into produto(id, nome, preco, quantidade) values 
(1, "Café", 1.50, 2),
(2, "Coca-Cola", 2.50, 1),
(3, "Salgado", 3.0, 1);

-- Criando Compra 
-- OBS: coluna ID é de auto increment, não precisa declarar nem inserir valor
insert into compra(preco, pagamento) values 
(1.50, 2.50),
(2.50, 2.50),
(3.0, 5.00);

#set sql_safe_updates = 0;

