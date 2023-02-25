drop database if exists hogwarts;
create database hogwarts;

use hogwarts;

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
    
create user "hermione" identified by "111";
create user "ministro" identified by "222";
create user "dumbledore" identified by "333";
create user "hagrid" identified by "444";
create user "mcgonagall" identified by "555";
create user "doloresumbridge" identified by "666";
create user "harrypotter" identified by "777";
create user "snape" identified by "888";

grant usage on hogwarts.* to "hermione";

grant create on hogwarts.* to "ministro";
revoke create on hogwarts.* from "ministro"; # tira o privilégio de criar tabelo no banco 

show grants for "ministro";

grant all on hogwarts.* to "dumbledore";

grant insert, update on hogwarts.animal to "hagrid" with grant option;
 
 show grants for "hagrid";

grant UPDATE, SELECT on hogwarts.bruxos to "snape";
grant UPDATE, SELECT on hogwarts.bruxos to "mcgonagall";

grant all on hogwarts to "doloresumbridge" with grant option;
revoke grant option on hogwarts from "doloresumbridge";

grant update, delete on hogwarts.quadribol to "harrypotter";
revoke update, delete on hogwarts.quadribol from "harrypotter";