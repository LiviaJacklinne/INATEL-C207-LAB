drop database if exists mercado;
create database mercado;

use mercado;

create table produto(
	codigo int,
    nome varchar(50),
    preco float,
    fornecedor varchar(50),
    primary key(codigo)
);

insert into produto(codigo, nome, preco,fornecedor) value (1234, 'Óleo', 8,'Soya');
insert into produto(codigo, nome, preco,fornecedor) value (1357, 'Arroz', 28,'BeansHouse');
insert into produto(codigo, nome, preco,fornecedor) value (3698, 'Feijão', 7.5,'BeansHouse');
insert into produto(codigo, nome, preco,fornecedor) value (2370, 'Batata Baroa', 3,'Legumes - To Go');
insert into produto(codigo, nome, preco,fornecedor) value (564, 'Batata Doce', 3.5,'Legumes - To Go');
insert into produto(codigo, nome, preco,fornecedor) value (2141, 'Miojo', 0.9,'Nissin');

select * from produto;

update produto set fornecedor = 'Lisa' where codigo= 1234;

delete from produto where codigo = 1234;

select fornecedor from produto limit 3;

select *from produto where nome like 'Batata %';

select nome,fornecedor from produto where preco>5;

select min(preco) from produto;

select avg(preco) from produto;

select count(*) from produto;


