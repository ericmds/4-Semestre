-- DECLARAÇÃO
DECLARE @idade INT,
		@nome VARCHAR(40),
		@data DATE,
		@grana MONEY;

-- ATRIBUIÇÃO
SET @nome = 'ÉRIC MARTINS DA SILVA';
SET	@data = '2000-07-11' -- AAAA-MM-DD;
SET @grana = 22;
SET @idade = YEAR(GETDATE()) - YEAR(@data);

-- EXIBIÇÃO
-- 1) SELECT
SELECT @nome AS 'Nome',
	@data AS 'Data de Nascimento',
	@idade AS 'Idade',
	@grana AS 'Dinheiro';

-- 2) PRINT
PRINT 'Meu nome é: ' + @nome
	+ ', nascido em: ' + CAST(@data AS VARCHAR(11))
	+ ', tenho ' + CAST(@idade AS VARCHAR(3)) + ' anos'
	+ ' e R$' + CAST(@grana AS VARCHAR(10));

-- ATRIBUIR VALOR COM SELECT
-- 1) Recupere o nome do departamento com Dnumero = 2
DECLARE @dpt_nome VARCHAR(100);

SELECT @dpt_nome = D.Dnome
FROM DEPARTAMENTO AS D
WHERE D.Dnumero = 4;

PRINT @dpt_nome;

-- 2) Calculando o novo salário com um aumento de 10%, para a Jennifer
DECLARE @nomeFuncionario VARCHAR(100),
		@salario DECIMAL(10,2),
		@aumento DECIMAL(10,2),
		@novoSalario DECIMAL(10,2);

SET @nomeFuncionario = 'Jennifer';
SET @aumento = 10;
SELECT @salario = F.Salario 
	FROM FUNCIONARIO AS F 
	WHERE F.Pnome = @nomeFuncionario
SET @novoSalario = @salario * (1 + (@aumento/100));

SELECT @nomeFuncionario AS 'Nome', 
	@salario AS 'Salário',
	@aumento AS 'Aumento (%)',
	@novoSalario AS 'Novo Salário';

-- 3) Calculando a idade da Jennifer
DECLARE @funcioarioNome VARCHAR(100),
	@idad INT

SET @funcioarioNome = 'Jennifer';

SELECT @idad = YEAR(GETDATE()) - YEAR(F.Datanasc)
FROM FUNCIONARIO AS F
WHERE F.Pnome = @funcioarioNome

PRINT 'Nome: ' + @funcioarioNome
PRINT 'Idade: ' + CAST(@idad AS VARCHAR(10)) + ' anos';

-- CAST
-- 1) Usando CAST para converter o salário decimal em uma string: O funcionário(a) Jennifer tem um salário de : R$ 43000.
DECLARE @Funcionario_Nome VARCHAR(100),
	@Funcionario_Salario DECIMAL(10,2);

SET @Funcionario_Nome = 'Jennifer';

SELECT @Funcionario_Salario = F.Salario
	FROM FUNCIONARIO AS F
	WHERE F.Pnome = @Funcionario_Nome;

PRINT 'O funcionario(a) ' + @Funcionario_Nome + ' tem seu salário = ' + CAST(@Funcionario_Salario AS VARCHAR(10));
PRINT 'O funcionario(a) ' + @Funcionario_Nome + ' tem seu salário = ' + CONVERT(VARCHAR(10), @Funcionario_Salario);

-- CONVERT
-- 1) Converta a data de nascimento para o padrão brasileiro: dd/mm/aaaa
SELECT f.Pnome, CONVERT(VARCHAR(10), F.Datanasc, 103) AS 'DATA DE NASCIMENTO'
FROM FUNCIONARIO AS F;

-- IF ELSE
-- 1) Verificar se um Funcionário Recebe Abaixo da Média Salarial
DECLARE @salario_medio DECIMAL(10,2),
	@salario_func DECIMAL(10,2),
	@nome_func VARCHAR(100) = 'Joice';

SELECT @salario_medio = AVG(F.Salario)
	FROM FUNCIONARIO AS F;

SELECT @salario_func = F.Salario
	FROM FUNCIONARIO AS F
	WHERE F.Pnome = @nome_func
	PRINT @salario_func

IF @salario_func < @salario_medio
	PRINT @nome_func + ' recebe abaixo da média'
ELSE
	PRINT @nome_func + ' recebe na média ou acima'

-- 2) Verificar se um Funcionário Está Próximo da Aposentadoria, considerar a idade para aposentadoria de 60 anos e se a idade for > 80 considerar Aposentadoria Compulsória
SELECT F.Pnome ,YEAR(GETDATE()) - YEAR(F.Datanasc) AS 'Data de Nascimento'
FROM FUNCIONARIO AS F;

DECLARE @nomeF VARCHAR(100) = 'Carlos',
	@idadeF INT;

SELECT @idadeF = YEAR(GETDATE()) - YEAR(F.Datanasc)
	FROM FUNCIONARIO AS F
	WHERE F.Pnome = @nomeF

IF @idadeF > 55 AND @idadeF <= 60
	PRINT @nomeF + ' Aposentadoria chegando'
ELSE IF @idadeF > 61 AND @idadeF < 80
	PRINT @nomeF + ' Devia estar aposentado'
ELSE IF @idadeF >= 80
	PRINT @nomeF + ' Já passou da hora'
ELSE
	PRINT @nomeF + ' Trabalha escravo'

-- 3) DATA CORRETA
SELECT F.Pnome ,YEAR(GETDATE()) - YEAR(F.Datanasc) AS 'Data de Nascimento'
FROM FUNCIONARIO AS F;

DECLARE @nomeFu VARCHAR(100) = 'Carlos',
	@idadeFu INT;

SELECT @idadeFu = YEAR(GETDATE()) - YEAR(F.Datanasc)
	FROM FUNCIONARIO AS F
	WHERE F.Pnome = @nomeFu
