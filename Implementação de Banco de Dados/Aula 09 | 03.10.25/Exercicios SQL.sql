-- 1. Inserir um funcionário novo e um departamento já existente, declarar uma variavel erro, e verificar se teve erro em cada comando

BEGIN TRANSACTION;

DECLARE @e INT = 0;

INSERT INTO FUNCIONARIO(Pnome, Unome, Minicial, Cpf)
VALUES ('Eric', 'Silva', 'M', 12345678902);
SET @e = @@ERROR + @e;

SELECT * FROM FUNCIONARIO;

INSERT INTO DEPARTAMENTO(Dnome, Dnumero)
VALUES('Matriz', 1);
SET @e = @@ERROR + @e;

SELECT * FROM DEPARTAMENTO;


IF @e <> 0
	BEGIN
		ROLLBACK TRANSACTION;
		PRINT 'Erro detectado! Transação revertida!';
	END
ELSE
	BEGIN
		COMMIT TRANSACTION;
		PRINT 'Transação concluída com sucesso!';
	END

-- 2. Inserir vários funcionarios com nome iguais, dar update no salário, e verificar se houve erro
BEGIN TRANSACTION;

DECLARE @e INT = 0;

INSERT INTO FUNCIONARIO(Pnome, Unome, Minicial, Cpf, Salario)
VALUES ('João', 'Silva', 'A', 12345678902, 1000);
SET @e = @@ERROR + @e;

INSERT INTO FUNCIONARIO(Pnome, Unome, Minicial, Cpf, Salario)
VALUES ('João', 'Silva', 'A', 12345678902, 2000);
SET @e = @@ERROR + @e;

INSERT INTO FUNCIONARIO(Pnome, Unome, Minicial, Cpf, Salario)
VALUES ('João', 'Silva', 'A', 12345678902, 3000);
SET @e = @@ERROR + @e;


IF @e <> 0
	BEGIN
		ROLLBACK TRANSACTION;
		PRINT 'Erro detectado! Transação revertida!';
	END
ELSE
	BEGIN
		COMMIT TRANSACTION;
		PRINT 'Transação concluída com sucesso!';
	END
