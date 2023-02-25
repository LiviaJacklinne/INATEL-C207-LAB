drop database if exists teste; 
create database teste;
use teste;
create table teste 
(
	conta int,
    nome varchar (50),
    saldo double,
    ag varchar (50),
    primary key (conta)
);

insert into teste () values (666, "Pink", 11.50, "BB" );
insert into teste () values (777, "Yellow", 15, "BB" );
insert into teste () values (111, "Purple",18.50, "Nubank" );
insert into teste () values (999, "Dark", 10, "Sicob" );
select * from teste;
update teste set ag  = "Nubank" where conta = 666;
select * from teste;
select distinct(ag) from teste;
select * from teste where nome like "P%";
select * from teste where nome like "%k";
select ag, conta from teste where nome like "P_rp%%";
select * from teste where nome like "%ll%";
select nome, ag from teste where saldo >= 15;
select saldo from teste where saldo < 11;
select * from teste where saldo = (select min(saldo) from teste);
select * from teste where saldo = (select max(saldo) from teste);
select AVG(saldo) from teste;
select count(conta) from teste; 
select * from teste;
select * from ag limit 2;
select * from teste where not ag = "Nubank";
select nome from teste where saldo > 13 and ag = "Nubank";
delete from teste where conta = 111;
select * from teste;

# Desativando modo seguido
set sql_safe_updates = 0;



/*
# Essa é uma função q verifica se o banco q criamos já é existente, se ele já existe vamos dropar ele e adicionar de novo (para não dar erro)
drop database if exists teste;

# Para criar um banco usamos "create database"
create database teste;

# Usando o banco "teste"
use teste;

# Criando uma tabela
create table teste 
(
	conta int,
    nome varchar (50),
    saldo double,
    ag varchar (50),
    primary key (conta)
);
# Inserindo dados na tabela
insert into teste () values (666, "Pink", 11.50, "BB" );
insert into teste () values (777, "Yellow", 15, "BB" );
insert into teste () values (111, "Purple",18.50, "Nubank" );
insert into teste () values (999, "Dark", 10, "Sicob" );

# Lendo a tabela
select * from teste;

# Alterando um dado da tabela
update teste set ag  = "Nubank" where conta = 666;
select * from teste;

# Seleciona todas as agencias diferentes
select distinct(ag) from teste;

# Lendo nomes que começam com P
select * from teste where nome like "P%";

# Lendo nomes que terminam com K
select * from teste where nome like "%k";
select ag, conta from teste where nome like "P_rp%%";

# Lendo nomes que tem "2 L" no meio
select * from teste where nome like "%ll%";

# Lendo nome e agencia, para saldos maior igual à 15
select nome, ag from teste where saldo >= 15;

# Lendo saldo, para saldos menores que 11
select saldo from teste where saldo < 11;

# Lendo o menor saldo
select * from teste where saldo = (select min(saldo) from teste);

# Lendo o maior saldo
select * from teste where saldo = (select max(saldo) from teste);

# Calculando a média dos saldos
select AVG(saldo) from teste;

# Calculando quantas contas, existem na tabela
select count(conta) from teste; 
select * from teste;

# Lendo DUAS, agencias apenas
select * from ag limit 2;

# Lendo as agencias diferentes de "nubank"
select * from teste where not ag = "Nubank";

# Lendo o nome, com saldo maior que 13, da agencia Nubank
select nome from teste where saldo > 13 and ag = "Nubank";

# Deletando uma conta
delete from teste where conta = 111;
select * from teste;

*/