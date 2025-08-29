-- EXISTS
-- 1) Listar funcionários que são gerentes de algum departamento
SELECT F.Pnome, F.Unome, F.Cpf
FROM FUNCIONARIO F
WHERE EXISTS(SELECT 1 
				FROM DEPARTAMENTO AS D
				WHERE D.Cpf_gerente = F.Cpf
				);

-- 2) Listar departamentos que possuem projetos associados

SELECT D.Dnome, D.Dnumero
FROM DEPARTAMENTO AS D
WHERE EXISTS(
			SELECT *
			FROM PROJETO AS P
			WHERE P.Dnum = D.Dnumero
			);

-- ANY (QUALQUER/OR)
-- 1) Encontrar funcionários que ganham mais do que qualquer um dos funcionário do departamento de 'Administração'
SELECT F.Pnome, F.Unome, F.Salario
FROM FUNCIONARIO AS F
WHERE F.Salario > ALL (
					SELECT Salario
					FROM FUNCIONARIO
					INNER JOIN DEPARTAMENTO
					ON Dnr = Dnumero
					WHERE Dnome = 'Administração'
					);

-- ALL (TODOS/ALL)
-- 1) Encontrar projetos que exigem mais horas do que todos os projetos no local 'Itu' ou 'Santo André'
SELECT P.Projnome, SUM(TE.Horas)
FROM PROJETO AS P
INNER JOIN TRABALHA_EM AS TE
ON TE.Pnr = p.Projnumero
GROUP BY P.Projnome
HAVING SUM(TE.Horas) > ALL (
							SELECT SUM(TE.Horas)
							FROM PROJETO AS P
							INNER JOIN TRABALHA_EM AS TE
							ON TE.Pnr = P.Projnumero
							WHERE P.Projlocal = 'Itu' OR P.Projlocal = 'Santo André'
							GROUP BY P.Projlocal
);
