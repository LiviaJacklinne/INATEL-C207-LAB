# Criando o banco de dados
create database if not exists bancoAula3;

# Usando o banco de dados
use bancoAula3;

# Criando tabelas
create table aluno
(
	cpf varchar(20) primary key,
    nome varchar(50),
    idade int,
    curso varchar(3)
);

# Inserir valores
insert into aluno() values (1234, 'joao', 23, 'get');
insert into aluno (cpf, nome, idade) values (4321,'Joyce',19);
insert into aluno() values (12345, 'joao ryan', 20, 'ges');
insert into aluno() values (123, 'Livia', 19, 'gec');
insert into aluno() values (84651, 'Matheus', 20, 'gec');

# Mostrando banco de dados
select * from aluno;

# Desativando modo seguido
set sql_safe_updates = 0;

# Atualizando dados
update aluno set curso = 'gec' where cpf = 4321;

# Deletando dados
delete from aluno where cpf = 1234;

# Busca com filtro
select nome, curso from aluno where idade < 20 and curso = 'gec';

# O % serve para buscar o nome de alguem. Quando o % ta depois da letra, ele entente que a letra anterior é a primeira
# Se colocar o % no inicio, ele entende que tem letra antes da que vc quer
# Se coloar % antes e depois da letra, ele entende que tem texto antes e depois
select cpf, curso from aluno where nome like "m%";
# O anderline serve para um caracter que eu não sei
select nome, curso from aluno where nome like "j_a%";
select * from aluno where curso = "gec";
# Comando para pegar a maior idade, ele retorna a maior idade só
select max(idade) from aluno;
# Ele retorna todas as maiores idades (quando iguais)
select * from aluno where idade = (select max(idade) from aluno);
# Limita a busca a dois alunos
select * from aluno limit 2;
# Retorna todos os cursos diferentes do banco 
select distinct(curso) from aluno;
# Retorna os alunos que não tem a idade igual a 23
# Pode usar != para negar tambem, se usar os dois está negando 2x
select * from aluno where not idade = 20;


