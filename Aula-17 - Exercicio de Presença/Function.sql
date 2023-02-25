-- Usando o banco aula17
USE aula17;

-- definindo delimitadores
delimiter //

-- Dropando (excluindo) a função caso ela ja exista
-- Finalizando a linha com delimitador para executa-la antes do bloco BEGIN
drop function if exists fn_troco//

-- Criando a funçao troco, passando preço e pagamento como parametro
create function fn_troco(x_preco float, x_pagamento float) 
returns varchar(20) deterministic

-- Bloco de execução 
BEGIN
	-- variavel auxiliar
	declare aux varchar(20); 
    
    -- Bloco de condições 
    if (x_pagamento - x_preco) < 0.05 then set aux = "Sem Troco";
	elseif (x_pagamento - x_preco) <= 1 then set  aux = "Balinhas de Café";
	else set aux = "Em Dinheiro";
    
	-- Fechando o IF
	end if;
    
    -- retornando a variavel auxiliar
    return aux;
    
END // 
-- Redefinindo o caractere delimitador
delimiter ; 

select fn_troco(preco, pagamento) AS TROCO
from compra

 