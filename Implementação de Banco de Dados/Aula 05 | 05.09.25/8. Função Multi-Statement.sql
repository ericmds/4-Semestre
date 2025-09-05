-- FUN��O MULTI-STATEMENT
-- 1) Criar uma fun��o que retorna nome completo dos funcion�rios e o valor do sal�rio anual, com f�rias e d�cimoterceiro;
CREATE FUNCTION fn_SalarioAnual()
RETURNS @Tabela TABLE
(
	NomeCompleto VARCHAR(255),
	SalarioMensal DECIMAL(10,2),
	SalarioAnual DECIMAL(12,2)
)
AS
BEGIN
	INSERT INTO @Tabela
	SELECT
		CONCAT(F.Pnome, ' ', F.Minicial, '. ',F.Unome),
		F.Salario,
		F.Salario * 12
	FROM FUNCIONARIO AS F

	RETURN;
END;

SELECT * FROM dbo.fn_SalarioAnual();