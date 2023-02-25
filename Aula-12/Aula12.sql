drop database if exists locadora;
create database locadora;

use locadora;

create table filme
(
	id int auto_increment primary key,
    nome varchar(50) not null,
    tempo float not null,
    preco float not null
);


create user 'dono' identified by '123';

show grants for 'dono';

grant insert on locadora.filme to 'dono'; # permissão para inserir dados
grant update, delete on locadora.filme to 'dono'; # atualizar/apagar dados
grant select on locadora.filme to 'dono'; # permissão para ver os dados

select*from filme;

revoke select on locadora.filme from 'dono'; # tira o privilégio de ver o banco

# permite o usuário ver só o id, nome e tempo
grant select (id, nome, tempo) on locadora.filme to 'dono';
