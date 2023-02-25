use bancoFunctions;

#drop table produto;


insert into produto(nome, preco, quantidade) values("Arroz",25,3),("Feijão",15,3);

delimiter $$
drop function if exists calcTotal$$
# dado dois valores e a saida pode ser igual, é uma saida deterministica
create function calcTotal(preco float, qtd int) returns float deterministic
begin
	declare total float; 
    set total = preco * qtd;
    return total;
    end $$
    delimiter ;
    
    #select calcTotal(2,3);
    # Essas variaveis estão vindo do banco "banco function", da tabela produto
    select id, nome, preco, quantidade, calcTotal(preco, quantidade) as total from produto;
    select * from produto;
    
  
    