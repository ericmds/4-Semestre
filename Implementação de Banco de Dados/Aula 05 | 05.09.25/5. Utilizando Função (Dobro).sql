SELECT dbo.fn_Dobro(5) AS 'Resultado';

SELECT F.Pnome, F.Unome, F.Unome, F.Salario, dbo.fn_Dobro(f.Salario) AS 'Dobro'
FROM FUNCIONARIO AS F;