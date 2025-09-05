-- IF/ELSE
-- 1 - Verificar o tamandho de um departamento, se tiver at� 1 funcion�rio o departamento � �pequeno�, se tiver de 2 a 3 pessoas o departamento � �medio�, se tiver mais de 3 � uma departamento �grande� 

DECLARE @QtdFuncionarios INT;

SELECT @QtdFuncionarios = COUNT(F.Cpf)
FROM FUNCIONARIO AS F
INNER JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
WHERE D.Dnome = 'TI';

IF(@QtdFuncionarios <= 1)
	PRINT 'Qtd Funcionarios: ' + CAST(@QtdFuncionarios AS VARCHAR(10)) + ' , Dep. Pequeno'
ELSE IF (@QtdFuncionarios >= 2 AND @QtdFuncionarios <=3)
	PRINT 'Qtd Funcionarios: ' + CAST(@QtdFuncionarios AS VARCHAR(10)) + ' , Dep. Medio'
ELSE
	PRINT 'Qtd Funcionarios: ' + CAST(@QtdFuncionarios AS VARCHAR(10)) + ' , Dep. Grande'

-- WHILE
-- 1) EXEMPLO
DECLARE @valor INT
SET @valor = 0

WHILE @valor < 10
  BEGIN
    PRINT 'N�mero: ' + CAST(@valor AS VARCHAR(2))
    SET @valor = @valor + 1
  END;

-- 2) Aumentar o sal�rio da �Joice Leite� em 5% repetidamente at� que ele chegue em R$ 30.000
DECLARE @salario DECIMAL(10,2);

SELECT @salario = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Joice' AND F.Unome = 'Leite';

PRINT 'Sal�rio inicial: ' + CAST(@salario AS VARCHAR(50));

WHILE(@salario <= 30000)
	BEGIN
		PRINT @salario;
		SET @salario = @salario * 1.05;
		PRINT @salario;
	END;

PRINT 'Sal�rio final: ' + CAST(@salario AS VARCHAR(50));