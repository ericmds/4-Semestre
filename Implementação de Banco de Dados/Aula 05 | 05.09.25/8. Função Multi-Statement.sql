-- FUNÇÃO MULTI-STATEMENT
-- 1) Criar uma função que retorna nome completo dos funcionários e o valor do salário anual, com férias e décimoterceiro;
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