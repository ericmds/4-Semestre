-- FUNÇÃO ESALARES
-- 1) EXEMPLO
CREATE FUNCTION fn_Dobro(@Numero INT)
RETURNS INT --> Tipo de retorno da função
AS
BEGIN --> Aqui começa o bloco da função
	RETURN @Numero * 2; --> Retorno da função
END;