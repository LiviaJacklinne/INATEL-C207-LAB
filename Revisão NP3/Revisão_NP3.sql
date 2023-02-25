drop database if exists hogwarts; # Criando o banco
create database hogwarts; # Tabela hogwarts
use hogwarts; # Usando a tabela

create table animal
(
	id int auto_increment primary key,
    animal varchar(50)
);

create table bruxos
(
	id int auto_increment primary key,
    nome varchar(50),
    sobrenome varchar(50)
);

create table quadribol
(
	id int auto_increment primary key,
    participante varchar(50)
);

# Criando usuários e seus identificadores;
create user "hermione" identified by "111";
create user "ministro" identified by "222";
create user "dumbledore" identified by "33";
create user "hagrid" identified by "444";
create user "mcgonagall" identified by "555";
create user "doloresumbridge" identified by "666";
create user "harrypotter" identified by "777";
create user "snape" identified by "888";

# Permite que o usuário apenas use o banco, e todas as suas tabelas *
grant usage on hogwarts.* to "hermione";

# Perimite que o usuário crie novas tabelas no banco hogwarts *
grant create on hogwarts.* to "ministro";

# Remove o privilégio de criar tabelo no banco
revoke create on hogwarts.* from "ministro"; 

/* Mostra o que o ministro pode fazer no banco (GRANT USAGE ON *.* TO `ministro`@`%`)
no caso ele não pode "fazer nada", pois nós atribuimos e tiramos o "poder" dele*/
show grants for "ministro";

# Permite que o usuário altere todos os dados do banco (*)
grant all on hogwarts.* to "dumbledore";

# Perminte que o usuário insira e altere os dados na tabela animal, que pertence ao banco hogwarts
grant insert, update on hogwarts.animal to "hagrid" with grant option;

#Mostra o que o Hargrid pode fazer no banco
show grants for "hagrid";

# Permite que o usuário altere e veja os dados da tabela bruxo, do banco hogwarts
grant UPDATE, SELECT on hogwarts.bruxos to "snape";
grant UPDATE, SELECT on hogwarts.bruxos to "mcgonagall";

# Permite que um usuário dê permissão para outro usuário 
# Opção alternatuva = grant all on hogwarts to "doloresumbridge" with grant option;
grant grant option on hogwarts to "doloresumbridge";


grant all on hogwarts to "doloresumbridge";
revoke grant option on hogwarts from "doloresumbridge";

grant update, delete on hogwarts.quadribol to "harrypotter";
revoke update, delete on hogwarts.quadribol from "harrypotter";