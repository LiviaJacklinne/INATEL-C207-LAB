-- Usando o banco aula17
USE aula17;
/*
-- Criando delimitador temporário 
delimiter // 

-- Dropando (excluindo) o precedimento caso ele ja exista
-- Finalizando a linha  com delimitador para executa-la antes do bloco BEGIN
drop procedure if exists apagarDados//

-- Criando procedimento
create procedure apagarDados(in x_matricula int, in x_curso varchar(3))
begin
	delete from aluno where matricula = x_matricula and curso = x_curso;
    
end // 
delimiter ;

call apagarDados(1731,"GEC");

select * from aluno;
*/
----------------------------------------------------------------------------

-- Criando delimitador temporário 
delimiter // 
drop procedure if exists alterarDados //
create procedure alterarDados(in id_matricula int, in id_curso varchar(3), in id_nome varchar(100))
begin
	update aluno set nome = id_nome, email = concat(nome, "@inatel.br") where (matricula = id_matricula and curso = id_curso);
end // 
delimiter ;

#set sql_safe_updates = 0;

call alterarDados (1731,"GEC","duda");

select * from aluno;

