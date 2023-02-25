drop database if exists artesanato;
create database artesanato;
use artesanato;

create table cliente
(
	CPF varchar(14) not null primary key,
    nome varchar (45) not null,
    telefone varchar (45) not null
);

create table produto
(
	codigo int not null primary key,
    nome varchar (45) not null,
    tipoMadeira varchar (45) not null,
    preco int not null,
    qtdEstoque int not null
);

#drop table compra;
create table compra 
( 
	clienteCPF varchar (45) not null,
    produtoCodigo int not null,
    dataCompra date not null,
    qntComprada int not null,
    taxaEntrega float not null,
    primary key (clienteCPF, produtoCodigo),
		constraint cliente_cpf_fk
				foreign key (clienteCPF)
				references cliente(CPF)
                on delete no action
                on update cascade,
		constraint produto_codigo_fk
			foreign key (produtoCodigo)
            references produto(codigo)
            on delete no action
            on update cascade
);

# Questão 1
# A
alter table cliente ADD cep varchar (9);
# B
alter table produto change preco preco float not null;
# C
alter table compra drop column taxaEntrega;

insert into cliente(CPF, nome, telefone) values
('492.441.760-25','Luciano', '(35)99875-5572'),
('456.841.862-03','Flavio','(35)3473-8562'),
('192.041.526-14','Paola','(35)3471-1519'),
('556.851.862-88','Aline','(11)99822-9639');

insert into produto(codigo,nome,tipoMadeira,preco,qtdEstoque) values
(0300,'Baleia Azul','Carvalho', 29.90, 3),
(0301,'Moinho de Vento', 'Ipê',24.90,2),
(0400, 'Conjunto de Banquinhos', 'Carvalho', 42,4),
(0500, 'Porta-chaves','Goiabão', 8.90,7),
(0501,'Mini Avião', 'Mongo', 27.9,4),
(0502, 'Tronco esculpido','Goiabão', 69.90,2),
(0503,'Vaso de flores','Aroeira', 9.90,4),
(0504, 'Urso Pardo','Aroeira',28.90,2),
(0505,'Peixe Dourado','Ipê',37.90,2),
(0800,'Galinha Pintada', 'Carvalho',11.90,4),
(0801,'Flauta','Mongo',18.90,2),
(0802,'Guitarra', 'Alder', 1000,5),
(0900,'Tábua de Corte', 'Carvalho', 8.90,4);

# Questão 2
# A
#alter table cliente.cep update '37460-153' where cliente.cpf = '556.851.862-88';

#update cep;


insert into compra(clienteCPF,produtoCodigo,dataCompra,qntComprada) values
('492.441.760-25','0301','2018-08-20','1'),
('556.851.862-88','0503','2020-11-12','2'),
('456.841.862-03','0802','2020-10-30','1');

# Questão 3
select cliente.nome,produto.nome,compra.dataCompra, compra.qntComprada from cliente, produto,compra;

# Questão 4
# A
create user "Rodrigo" identified by "123";
grant all on artesanato.* to "Rodrigo";

# B
create user "Secretaria" identified by "456";
grant select, update, delete, insert, alter on artesanato.* to "Secretaria";

# C
revoke alter on artesanato.* from "Secretaria";

# D
#delete "Secretaria";








