-- FUN��O ESALARES
-- 1) EXEMPLO
CREATE FUNCTION fn_Dobro(@Numero INT)
RETURNS INT --> Tipo de retorno da fun��o
AS
BEGIN --> Aqui come�a o bloco da fun��o
	RETURN @Numero * 2; --> Retorno da fun��o
END;