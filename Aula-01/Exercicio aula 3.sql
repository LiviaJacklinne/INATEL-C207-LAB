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

# Inserindo dados
insert into produto () values (1234, "Óleo", 8, "Soya");
insert into produto () values (1357, "Arroz", 28, "BeansHouse");
insert into produto () values (3698, "Feijão", 7.5, "BeansHouse");
insert into produto () values (2370, "Batata Baroa", 3, "Legumes - To Go");
insert into produto () values (564, "Batata Doce", 3.5, "Legumes - To Go");
insert into produto () values (2141, "Miojo", 0.9, "Nissin");

# Mostrando banco de dados
select * from produto;

# Atualizando dados
update produto set fornecedor = 'Lisa' where codigo = 1234;

# Desativando modo seguido
set sql_safe_updates = 0;

# Deletando dados
delete from produto where codigo = 2141;

# Retorna todos os fornecedores diferentes do banco 
select distinct(fornecedor) from produto;

# Buscar os produtos que tem nome Batata
select * from produto where nome like "Batata%";

# Buscar nome e fornecedor de produtos acima de 5 reais
select nome, fornecedor from produto where preco > 5;

# Desafio 

# Menor preço da tabela
select * from produto where preco = (select min(preco) from produto);

# Média dos produtos
select AVG(preco) from produto;

# Total de produtos na tabela
select count(codigo) from produto; 