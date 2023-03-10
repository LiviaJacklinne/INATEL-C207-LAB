use bancoFunctions;
set @auxiliar = '';

/* delimiter $$
drop procedure if exists geraEmail$$
create procedure geraEmail(in matricula int, in nome varchar(100), in curso varchar(3))
begin
	insert into aluno(matricula, curso, nome, email) values(matricula,curso,nome,concat(nome,"@",curso,".inatel.br"));
end$$

delimiter ;

call geraEmail(1731,"livia","gec");
select * from aluno;
*/
delimiter $$
drop procedure if exists media $$
create procedure media (in n1 float, in n2 float, out resultado varchar(30))
begin
	declare mediaNotas float;
    set mediaNotas = (n1+n2)/2;
    if mediaNotas >= 60 then set resultado = "Aprovado";
    else set resultado = "Fazer NP3";
    end if;
end $$
delimiter ;

call media(72, 80, @auxiliar);
select @auxiliar as resultado;


