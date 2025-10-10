-- CASE
-- 1) Classificar funcionários por faixa salarial usando CASE
--	  ➥ Até 20.000 ------------→ Baixo
--	  ➥ Entre 20.000 - 40.000 -→ Médio
--	  ➥ Acima de 40.000 -------→ Alto

SELECT 
	Pnome AS 'Nome',
	Unome AS 'Sobrenome',
	Salario,
	CASE
		WHEN Salario < 20000 THEN 'Baixo'
		WHEN Salario BETWEEN 20000 AND 40000 THEN 'Médio'
		WHEN Salario > 40000 THEN 'Alto'
		ELSE 'Sem registro'
	END AS 'Categoria'
FROM FUNCIONARIO;

-- 2) Utilizando CASE, verificar se o funcionário foi contratado nos últimos 6 meses
INSERT INTO FUNCIONARIO(Pnome, Unome, Minicial, Cpf, Data_Admissao, Datanasc)
VALUES ('Guilherme', 'Frazzon', 'R', '12345678900', '2025-10-10', '2006-01-20')

SELECT
	F.Pnome AS 'Nome',
	F.Unome AS 'Sobrenome',
	F.Data_Admissao AS 'Data de Admissão',
	CAST(GETDATE() AS DATE) AS 'Hoje',
	CASE
		WHEN DATEDIFF(DAY, Data_Admissao, GETDATE()) <= 180 THEN 'Recém-Admitido'
		ELSE 'Admitido há mais de 6 meses'
	END AS 'Status'
FROM FUNCIONARIO AS F

-- 3) Atualizar o salário do Calor para 30.000
--	  ➥ Jeito errado, sem TRANSATION, muda o salário de duas pessoas
SELECT * FROM FUNCIONARIO AS F WHERE F.Pnome = 'Carlos'

UPDATE FUNCIONARIO
SET Salario = 30000
WHERE Pnome = 'Carlos'

-- Jeito certo, com TRANSATION
BEGIN TRAN;

DECLARE @registroAfetado INT = 0;

UPDATE FUNCIONARIO
SET Salario = 30000
WHERE Pnome = 'Carlos' AND Unome = 'Silva';
SET @registroAfetado = @@ROWCOUNT + @registroAfetado;

IF @registroAfetado <> 1
BEGIN
	ROLLBACK TRAN;
	PRINT 'Alteração NÃO realizada!'
END;

ELSE
BEGIN
	COMMIT TRAN;
	PRINT 'Alteração realizada com sucesso!'
END;

-- 4) Tentativa de demonstrar a Consistência do ACID, tentando fazer rodar duas TRANSACTION
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

-- Transação 1
BEGIN TRAN;
SELECT * FROM FUNCIONARIO;
PRINT 'SELECT concluído em: ' + CONVERT(VARCHAR(23), SYSDATETIME(), 121);
 -- Pausa de 20 segundos
WAITFOR DELAY '00:00:20'
COMMIT TRAN;
PRINT 'COMMIT em: ' + CONVERT(VARCHAR(23), SYSDATETIME(), 121);

-- Transação 2
BEGIN TRAN;
INSERT INTO FUNCIONARIO(Pnome, Minicial, Unome, Cpf)
VALUES ('Herysson', 'R', 'Figueiredo', '0287679888');
PRINT 'INSERT concluído em: ' + CONVERT(VARCHAR(23), SYSDATETIME(), 121);
COMMIT TRAN;
PRINT 'COMMIT em: ' + CONVERT(VARCHAR(23), SYSDATETIME(), 121);

-- 5) Dar uma bonificação de aumento de salário de 10% para o Departamento de Pesquisa

-- 6) Demostração do SAVE POINT
BEGIN TRAN;

INSERT INTO Departamento (Dnome, Dnumero)
VALUES ('Marketing', 88);

SAVE TRAN dptOk;

INSERT INTO Departamento (Dnome, Dnumero)
VALUES ('Construção', 99);

ROLLBACK TRAN dptOK; -- SE DAR ERRO, VOLTA PARA O SAVE E DA COMMIT NO QUE TA FEITO ATÉ O SAVE POINT

COMMIT TRANSACTION

SELECT * FROM DEPARTAMENTO

-- TRY CATCH
-- 1) EXEMPLO 1
BEGIN TRY
	PRINT 'Olá mundo!'
	SELECT 1/0; -- Erro
	PRINT 'Não cheguei aqui';
END TRY
BEGIN CATCH
	PRINT 'DEU ERRO!';
	PRINT 'Número: ' + CAST(ERROR_NUMBER() AS VARCHAR (10));
	PRINT 'Mensagem: ' + ERROR_MESSAGE();
END CATCH

-- 2) EXEMPLO 2 - TRANSACTION COM TRY CATCH
--	  ➥ Mudar o departamento DA Jeniffer
BEGIN TRY
	BEGIN TRAN;

	UPDATE FUNCIONARIO
	SET Salario = 666666 -- Departamento 1: Matriz
	WHERE Cpf = '98765432168' -- Cpf: Jeniffer
	SELECT * FROM FUNCIONARIO WHERE Cpf = '98765432168'

	UPDATE FUNCIONARIO
	SET Dnr = 666 -- Departamento 1: Matriz
	WHERE Cpf = '98765432168' -- Cpf: Jeniffer
	SELECT * FROM FUNCIONARIO WHERE Cpf = '98765432168'

	COMMIT TRAN;
	PRINT 'Pacto com o dianho realizado!'
END TRY

BEGIN CATCH
	-- XACT_STATE() → Retorna o estado da ultima transação
	--				→ 1 = Transação em aberto
	--				→ 0 = Não existe transação em aberto
	IF XACT_STATE() <> 0
		ROLLBACK TRAN;
	PRINT 'DEU ERRO!';
	PRINT 'Número: ' + CAST(ERROR_NUMBER() AS VARCHAR (10));
	PRINT 'Mensagem: ' + ERROR_MESSAGE();
END CATCH
