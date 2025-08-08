# Estrutura SELECT, FROM, WHERE
|COMANDO|FUNÇÃO|EXEMPLO|
|-------|------|-------|
|**SELECT**|Lista de Atributos|
|**FROM**| Lista de tabelas|
|**WHERE**|Condição|

```sql
-- DISTINCT: RETORNA SOMENTE OS VALORES DIFERENTES DE ALGUM CAMPO
SELECT DISTINCT F.Salario
FROM FUNCIONARIO AS F;

-- WHERE
SELECT * 
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'João';

SELECT *
FROM FUNCIONARIO AS F
WHERE F.Salario <= 30000;

-- AND, OR, NOT
SELECT * 
FROM FUNCIONARIO AS F
WHERE f.Sexo = 'M' 
AND f.Salario >= 30000;

SELECT * 
FROM FUNCIONARIO AS F
WHERE F.Endereco LIKE '%São Paulo%' 
OR F.Endereco LIKE '%Curitiba%';

SELECT * 
FROM FUNCIONARIO AS F
WHERE F.Endereco NOT LIKE '%São Paulo%'

SELECT * 
FROM FUNCIONARIO AS F
ORDER BY F.Salario DESC;

-- IS NULL, IS NOT NULL
SELECT * 
FROM FUNCIONARIO AS F
WHERE F.Cpf_supervisor IS NULL;

SELECT * 
FROM FUNCIONARIO AS F
WHERE F.Cpf_supervisor IS NOT NULL;

-- SELECT TOP (IGUAL AO LIMIT)
SELECT TOP 3 * 
FROM FUNCIONARIO AS F
ORDER BY F.Salario DESC

-- MIN(): RECEBE UMA COLONA E RETORNA O VALOR MINIMO DA COLUNA
SELECT MIN(F.Salario)
FROM FUNCIONARIO AS F;

-- SELECT ALINHADO: USA AS INFOMAÇÕES DA FUNÇÃO MIN()
SELECT *
FROM FUNCIONARIO AS F
WHERE F.Salario = (SELECT MIN(F.Salario)
FROM FUNCIONARIO AS F);

-- OUTRA FORMA DE RESOLVER - DECLARE @VARIAVEL,: CRIA UMA VARIAVEL - A VARIAVEL SÓ EXISTE EM TEMPO DE EXECUÇÃO
DECLARE @Salario_min DECIMAL(10,2);
/*
SELECT @Salario_min = (SELECT MIN(F.Salario) 
						FROM FUNCIONARIO AS F);
*/
SET @Salario_min = (SELECT MIN(F.Salario) 
						FROM FUNCIONARIO AS F);

PRINT @Salario_min;

SELECT *
FROM FUNCIONARIO AS F
WHERE F.Salario = @Salario_min

-- MAX:
SELECT MAX(F.Salario)
FROM FUNCIONARIO AS F;

DECLARE @Salario_max DECIMAL(10,2);

SET @Salario_max = (SELECT MAX(F.Salario) 
						FROM FUNCIONARIO AS F);

PRINT @Salario_max;

SELECT *
FROM FUNCIONARIO AS F
WHERE F.Salario = @Salario_max

-- COUNT
SELECT COUNT(F.Cpf)
FROM FUNCIONARIO AS F

SELECT COUNT(*)
FROM FUNCIONARIO AS F

SELECT COUNT(*)
FROM DEPENDENTE AS D

SELECT
	(SELECT COUNT(*) FROM FUNCIONARIO) AS Nr_Funcionarios,
	(SELECT COUNT(*) FROM DEPENDENTE) AS Nr_Dependentes,
	(SELECT COUNT(*) FROM FUNCIONARIO) + (SELECT COUNT(*) FROM DEPENDENTE) AS total;

-- OUTRA FORMA
DECLARE @nr_funcionarios INT;
DECLARE @nr_dependentes INT;

SET @nr_funcionarios = (SELECT COUNT(*) FROM FUNCIONARIO);
SET @nr_dependentes = (SELECT COUNT(*) FROM DEPENDENTE);
PRINT @nr_funcionarios + @nr_dependentes;

SELECT @nr_funcionarios + @nr_dependentes AS total;

-- AVG()
SELECT AVG(f.Salario)
FROM FUNCIONARIO AS F;

-- SUM()
SELECT SUM(f.Salario)
FROM FUNCIONARIO AS F;

-- Quanto a pessoa que tem o menor salário ganha a menos que a média salarial
DECLARE @menorSalario DECIMAL(10,2);
DECLARE @mediaSalario DECIMAL(10,2);

SET @menorSalario = (SELECT MIN(F.Salario) FROM FUNCIONARIO AS F);
SET @mediaSalario = (SELECT AVG(F.Salario) FROM FUNCIONARIO AS F);

PRINT @mediaSalario - @menorSalario

SELECT @mediaSalario - @menorSalario AS desvio;

-- LIKE: Recupere o(s) funcionários(s) nascidos(s) no ano de 72
SELECT *
FROM FUNCIONARIO AS F
WHERE Datanasc LIKE '%72%';

-- OU

SELECT *
FROM FUNCIONARIO AS F
WHERE YEAR(F.Datanasc) LIKE '__72';

-- IN: Recupera as informações dos funcionários que recebem 25000 e 3000 reais
SELECT *
FROM FUNCIONARIO AS F
WHERE F.Salario IN (25000, 30000);

-- Recupere os registros dos funcionários que trabalham (TRABALHA_EM) no mesmo projeto e na mesma quantidade de horas do “Fernando” (Fcpf = “33344555587” )
SELECT F.Pnome, TE.*
FROM FUNCIONARIO AS F
JOIN TRABALHA_EM AS TE ON F.Cpf = TE.Fcpf

/* --OU--
SELECT F.Pnome, TE.*
FROM FUNCIONARIO AS F, TRABALHA_EM AS TE
WHERE F.Cpf = TE.Fcpf;
*/

DECLARE @cpfFernando CHAR(11);

SET @cpfFernando = (SELECT F.Cpf FROM FUNCIONARIO AS F 
						WHERE F.Pnome = 'Fernando');

SELECT F.Pnome, TE.*
FROM FUNCIONARIO AS F
JOIN TRABALHA_EM AS TE ON F.Cpf = TE.Fcpf
WHERE TE.Pnr IN(SELECT Pnr FROM TRABALHA_EM WHERE Fcpf = @cpfFernando)
AND TE.Horas IN(SELECT Horas FROM TRABALHA_EM WHERE Fcpf = @cpfFernando)
AND NOT F.Pnome = 'Fernando';
```
