drop database if exists aula;
create database aula;
use aula;

create table dono
(
	id int auto_increment primary key,
    nome varchar(50),
    idade int,
    cidade varchar(50)
);

create table pet
(
	id int auto_increment primary key,
    especie varchar(50),
    nome varchar (50),
    idade int,
    peso float,
    idDono int,
		constraint fk_dono
			foreign key (idDono)
			references dono(id)
            on update cascade
            on delete cascade
);

create table vacina
(
	id int auto_increment primary key,
    nome varchar(50),
    quantidadeML float,
    preco float
);

create table pet_has_vacina
(
	idPet int,
    idVacina int,
    primary key (idPet, idVacina),
    dataApicacao varchar(50),
		constraint fk_pet
			foreign key (idPet)
			references pet(id)
            on update cascade
            on delete cascade,
		constraint fk_vacina
			foreign key (idVacina)
			references vacina(id)
            on update cascade
            on delete cascade
);

insert into dono() values(default, "Luna", 20, "Santa Rita"), 
(default, "Wilmar", 25,"santa rita"),
(default, "yasmin", 22,"borda da mata"),
(default, "alexia", 21,"lisboa");

select*from dono;

#O DEFAULT É O "ID", A FUNÇÃO DELE É VERIFICAR SE A POSIÇÃO "ESTA NULA"
insert into pet() values(default, "gato", "pretinha",3,2.2,1),
(default, "gato", "gohan", 5, 2.5, 1),
(default,"cachorro","toddy", 7, 7.3, 2),
(default,"cachorro", "belinha", 9, 3.5, 3),
(default,"cachorro", "bernardo", 7,6.5,4),
(default, "papagaio", "encrenqueiro", 3, 0.3, 4);

select*from pet;

insert into vacina() values(default, "Raiva", '10', '0'),
(default, "V4", '15', '50'),
(default, "V5", '12', '70'),
(default, "Panleucopenia", '8', '100');

select*from vacina;

insert into pet_has_vacina() values(1, 1, '02/11/2021'),
(1, 2, '02/11/2021'),
(1, 3, '02/11/2021'),
(1, 4, '02/11/2021'),
(1, 5, '02/11/2021'),
(2, 1, '02/11/2021'),
(2, 2, '02/11/2021'),
(4, 4, '02/11/2021'),
(3, 3, '02/11/2021');
