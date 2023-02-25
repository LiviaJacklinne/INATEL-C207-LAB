use bancoav4;
set @auxiliar = ' ';
set @auxiliar2 = ' ';

delimiter //

drop procedure if exists calcula_gasto //
create procedure calcula_gasto (in precoIngresso float, in precoPipoca float, in precoRefri float, 
out precoTotal float, in idCliente int)

begin

	set precoTotal = (precoPipoca + precoRefri);
	insert Cinema set preco_ingresso = precoIngresso, preco_pipoca = precoPipoca, preco_refri = precoRefri,
    preco_total = precoTotal, idCliente = idCliente ;
	      
end // 
delimiter ;

call calcula_gasto(15, 5, 5, @auxiliar, @axiliar2);

select @auxiliar AS Resultado;
select @auxiliar2 AS ID;
select * from cinema;
