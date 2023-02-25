use bancoav4;

delimiter //

drop function if exists fn_preco_com_desconto //
create function fn_preco_com_desconto (precoIngresso float, precoPipoca float, precoRefri float)
returns float deterministic

begin
	return ((precoIngresso + precoPipoca + precoRefri)*15)/100;
end // 
delimiter ;

select fn_preco_com_desconto(preco_ingresso, preco_pipoca,preco_refri) AS Desconto from Cinema;