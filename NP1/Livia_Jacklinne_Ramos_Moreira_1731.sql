# Livia Jacklinne Ramos Moreira, GEC 1731

# Resposta questão 1: A chave primária é usada como parametro principal para acessar os elementos da tabela

# Questão 2
drop database if exists bebidas; 
create database bebidas;
use bebidas;

# Criando tabela
create table bebidas
(
	codigo int,
    nome varchar(50),
    marca varchar (50),
    sabor varchar (50),
    tamanho int,
    alcoolico varchar (5),
    preco double,
    primary key (codigo)
);

# Inserindo dados
insert into bebidas () values (123, "Vodka", "Taiga", "Aguinha", 1000, "Sim", 17.5);
insert into bebidas () values (456, "Vodka", "Askov", "Puro fogo", 1000, "Sim", 12);
insert into bebidas () values (789, "Suco", "Ades", "Maracujá", 200, "Não", 3.45);
insert into bebidas () values (135, "Cerveja", "Quinta do morgado", "Suavezinho", 250, "Sim", 16.5);
insert into bebidas () values (579, "Vinho", "Pinheirense", "Extrato de açai", 3000, "Não", 14.9);
insert into bebidas () values (246, "Hidromel", "Berga", "Tente a sorte", 330, "Sim", 10);

select * from bebidas;

# Questão 3 Alterando dados
update bebidas set nome  = "Vinho" where codigo = 135;

# Questão 4 Deletando dados
delete from bebidas where codigo = 456;

# Desativando modo seguido
set sql_safe_updates = 0;

# Questão 5 Buscando nomes distintos de bebidas 
# A
select distinct(nome) from bebidas;   	

# B
select max(tamanho) from bebidas where alcoolico = "Sim" ;

# C
select nome, marca from bebidas where tamanho < 500 or preco > 15;

# D
select nome, marca, sabor, tamanho, preco from bebidas where nome like "v%o" and tamanho < 1000;











