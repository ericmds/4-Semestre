USE EMPRESA;

-- • INNER JOIN: 
-- 1) Selecionar o primeiro nome, último nome, endereço dos funcionários que trabalham no departamento de “Pesquisa”.
SELECT F.Pnome, F.Unome, D.Dnome
FROM FUNCIONARIO AS F
INNER JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
WHERE D.Dnome = 'Pesquisa';

-- 2) Liste o nome dos funcionários que estão desenvolvendo o “ProdutoX”.
SELECT F.Pnome, F.Unome, P.Projnome
FROM FUNCIONARIO AS F
INNER JOIN TRABALHA_EM AS TE
	ON TE.Fcpf = F.Cpf
INNER JOIN PROJETO AS P
	ON TE.Pnr = P.Projnumero
WHERE P.Projnome = 'ProdutoX';

-- 3) Para cada projeto localizado em “Mauá”, liste o número do projeto, o número do departamento que o controla e o sobrenome, endereço e data de nascimento do gerente do departamento.
SELECT P.Projnumero, 
	D.Dnumero, 
	F.Pnome, 
	F.Unome, 
	F.Endereco, 
	F.Datanasc
FROM PROJETO AS P
INNER JOIN DEPARTAMENTO AS D
	ON P.Dnum = D.Dnumero
INNER JOIN FUNCIONARIO AS F
	ON D.Cpf_gerente = F.Cpf
WHERE P.Projlocal = 'Mauá';

-- • LEFT JOIN
-- 1) Liste o último nome de TODOS os funcionários e o último nome dos respectivos gerentes, caso possuam
SELECT 
	F.Pnome AS 'F_Nome', 
	F.Unome AS 'F_Sobrenome',
	G.Pnome AS 'Supervisor'
FROM FUNCIONARIO AS F -- Funcionarios
LEFT JOIN FUNCIONARIO AS G -- Gerentes
	ON F.Cpf = G.Cpf_supervisor;

-- 2) Encontre os departamentos que não possuem funcionários a eles vinculados
--		• AUTORELACIONAMENTO
SELECT *
FROM DEPARTAMENTO AS D
LEFT JOIN FUNCIONARIO AS F
	ON D.Dnumero = F.Dnr
WHERE F.Cpf IS NULL;

-- 3) Encontre os funcionários que não possuem um departamento a eles vinculado
SELECT *
FROM FUNCIONARIO AS F
LEFT JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
WHERE D.Dnumero IS NULL

-- RIGHT JOIN
-- 1) Encontre os departamentos que não possuem nenhum funcionário
SELECT *
FROM FUNCIONARIO AS F
RIGHT JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
WHERE F.Cpf IS NULL;

-- CROSS JOIN / FULL JOIN
-- 1) Teste entre as relações Funcionários e Departamento
SELECT *
FROM FUNCIONARIO AS F
FULL JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero

-- SELF JOIN: UTILIZADO PARA AUTORELACIONAMENTO
-- 1) Teste entre as relações Funcionários e Departamento
SELECT *
FROM FUNCIONARIO AS T1
JOIN FUNCIONARIO AS T2
	ON T1.Cpf = T2.Cpf_supervisor;

-- UNION
-- 1) Listar todos os nomes, sexo e data de nascimento de todas as pessoas do banco.
SELECT F.Pnome, F.Sexo, F.Datanasc
FROM FUNCIONARIO AS F
UNION
SELECT D.Nome_dependente, D.Sexo, D.Datanasc
FROM DEPENDENTE AS D

-- 2) Imagine que a diretoria da empresa quer uma lista de todas as cidades onde a empresa possui alguma atividade, seja a localização de um departamento ou a localização de um projeto.
SELECT P.Projlocal
FROM PROJETO AS P
UNION
SELECT L.Dlocal
FROM LOCALIZACAO_DEP AS L

-- UNION ALL
SELECT P.Projlocal
FROM PROJETO AS P
UNION ALL
SELECT L.Dlocal
FROM LOCALIZACAO_DEP AS L

-- EXCEPT
-- 1) Listar os CPFs dos funcionários que não são gerentes de nenhum departamento
SELECT F.Cpf
FROM FUNCIONARIO AS F
EXCEPT
SELECT D.Cpf_gerente
FROM DEPARTAMENTO AS D

-- 2) Encontre os Funcionários que NÃO são Supervisores
SELECT F.Cpf
FROM FUNCIONARIO AS F
EXCEPT
SELECT S.Cpf_supervisor
FROM FUNCIONARIO AS S

-- 3) Encontre os nomes e sobrenomes dos Funcionários que NÃO são Supervisores
SELECT F.Pnome, F.Unome
FROM FUNCIONARIO AS F
WHERE F.Cpf IN (
				SELECT F.Cpf
				FROM FUNCIONARIO AS F
				EXCEPT
				SELECT S.Cpf_supervisor
				FROM FUNCIONARIO AS S
);

-- INTERSECT
-- 1) Encontre os Funcionários que são Supervisores
SELECT F.Cpf
FROM FUNCIONARIO AS F
INTERSECT
SELECT S.Cpf_supervisor
FROM FUNCIONARIO AS S

-- Contar o número de funcionários por departamento
-- 1) Contar o número de funcionários por departamento
SELECT COUNT(F.Cpf) AS 'N_Func', D.Dnome AS 'Dpt'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome;

-- 2) Somar os salários por departamento
SELECT SUM(F.Salario) AS 'Total_Salario', D.Dnome AS 'Dpt'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome;

-- 3) Média de horas trabalhadas por projeto
SELECT AVG(T.Horas) AS 'Horas', P.Projnome 'Nome_Projeto'
FROM PROJETO AS P
JOIN TRABALHA_EM AS T
	ON P.Projnumero = T.Pnr
GROUP BY P.Projnome;

-- 4) Quantidade de funcionários por sexo
SELECT COUNT(F.Sexo) AS 'QTD', F.Sexo
FROM FUNCIONARIO AS F
GROUP BY F.Sexo

-- 5) Maior salário em cada departamento
SELECT MAX(F.Salario) AS 'Total_Salario', D.Dnome AS 'Dpt'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome;

-- HAVING 
-- 1) Listar projetos que exigem mais de 100 horas de trabalho no total
SELECT COUNT(F.Cpf) AS 'Num_Funcionarios', D.Dnome AS 'Dpt'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome
HAVING COUNT(F.Cpf) > 3;

-- 2) Listar projetos que exigem no mínimo 50 horas de trabalho no total
SELECT SUM(T.Horas) AS 'Horas', P.Projnome 'Nome_Projeto'
FROM PROJETO AS P
JOIN TRABALHA_EM AS T
	ON P.Projnumero = T.Pnr
GROUP BY P.Projnome
HAVING SUM(T.Horas) >= 50;

-- EXISTS
-- 1) Listar funcionários que são gerentes de algum departamento
SELECT F.Pnome, F.Unome, F.Cpf
FROM FUNCIONARIO F
WHERE EXISTS(SELECT 1 
				FROM DEPARTAMENTO AS D
				WHERE D.Cpf_gerente = F.Cpf
				);
