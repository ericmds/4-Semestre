-- EXEMPLO 1: Toda vez que inserir alguém ele retorna uma mensagem
GO
CREATE OR ALTER TRIGGER trg_InserirFuncionario
ON FUNCIONARIO
AFTER INSERT
AS
PRINT 'Funcionário inserido com sucesso!';
GO
INSERT INTO FUNCIONARIO (Cpf, Pnome, Unome, Minicial)
VALUES ('12345678900', 'Eric', 'Silva', 'M');

-- EXEMPLO 2: AO INVEZ DE INSERIR ELE FAZ O QUE ESTÁ DENTRO DA TRIGGER
-- Sempre que tiver um comando de inserir, ele só vai mostrar uma mensagem, e não vai inserir os dados
GO
CREATE OR ALTER TRIGGER trg_InserirFuncionario
ON FUNCIONARIO
INSTEAD OF INSERT
AS
PRINT 'NÃO INSERI NENHUM REGISTRO!';
GO
INSERT INTO FUNCIONARIO (Cpf, Pnome, Unome, Minicial)
VALUES ('12345678900', 'Eric', 'Silva', 'M');

-- QUESTAO PROVA
GO
CREATE OR ALTER TRIGGER trg_InserirFuncionario
ON FUNCIONARIO
INSTEAD OF INSERT
AS
DECLARE @nome VARCHAR(100);
SELECT @nome = Pnome FROM inserted; -- Com esse inserted, eu consigo pegar os valores do INSERT de baixo, como por exemplo o nome
PRINT 'NÃO INSERI NENHUM: ' + @nome;
GO
INSERT INTO FUNCIONARIO (Cpf, Pnome, Unome, Minicial)
VALUES ('12345678900', 'Eric', 'Silva', 'M');

-- Desabilitar o trigger criado
ALTER TABLE FUNCIONARIO -- Precisa ter o ALTER TABLE antes, pois as Triggers ficam vinculados nas tabelas
DISABLE TRIGGER trg_InserirFuncionario

-- ALTERAR O NOME DO FUNCIONÁRIO
GO
CREATE OR ALTER TRIGGER tgr_AfterUpdatePnome
ON Funcionario
AFTER UPDATE
AS
BEGIN
	IF UPDATE (Pnome)
	BEGIN
		DECLARE @nomeNovo VARCHAR(100);
		DECLARE @nomeAntigo VARCHAR(100);
		SELECT @nomeNovo = Pnome FROM inserted;
		SELECT @nomeAntigo = Pnome FROM deleted;
		PRINT 'Alterando nomes'
		PRINT 'O nome era: ' + @nomeAntigo;
		PRINT 'Foi alterado para: ' + @nomeNovo;
	END
	ELSE
		PRINT 'O primeiro nome não foi alterado'
END
GO

UPDATE FUNCIONARIO
SET Pnome = 'Anna'
WHERE Cpf = '12345678900';

-- Trigger para evitar nomes completos duplicados
-- USANDO AFTER
GO
CREATE OR ALTER TRIGGER trg_AfterNomesDuplicados
ON FUNCIONARIO
AFTER INSERT
AS
BEGIN
	DECLARE @Pnome VARCHAR(100), 
			@Minicial CHAR(1), 
			@Unome VARCHAR(50), 
			@Duplicados INT;
	SELECT @Duplicados = COUNT(*)
	FROM (
		  SELECT Pnome = @Pnome, Minicial = @Minicial, Unome = @Unome 
		  FROM FUNCIONARIO
		  GROUP BY Pnome, Unome, Minicial
		  HAVING COUNT(*) > 1
		 ) AS Duplicados;
	IF @Duplicados > 0
	BEGIN
		PRINT 'Já existe um funcionário com esse nome'
		ROLLBACK TRAN;
	END
	ELSE
	BEGIN
		COMMIT TRAN;
		PRINT 'Novo funcionário inserido';
	END
END;
GO

-- Trigger para evitar nomes completos duplicados
-- USANDO AFTER INSTEAD OF
GO
CREATE OR ALTER TRIGGER trg_AfterNomesDuplicados
ON FUNCIONARIO
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @Pnome VARCHAR(100), 
			@Minicial CHAR(1), 
			@Unome VARCHAR(50)
	SELECT @Pnome = Pnome, @Minicial = Minicial, @Unome = Unome
	FROM inserted

	-- Verifica se existe alguem com o mesmo nome
	IF EXISTS(
			  SELECT 1 
			  FROM FUNCIONARIO 
			  WHERE @Pnome = Pnome 
			  AND @Minicial = Minicial 
			  AND @Unome = Unome
			 )
	BEGIN
		PRINT 'Já existe um funcionário com esse nome!'
		RAISERROR('Erro: Nome duplicado', 16, 0);
	END
	ELSE
	BEGIN
		INSERT INTO FUNCIONARIO (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr, Bonus, Data_Admissao)
		SELECT Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr, Bonus, Data_Admissao
		FROM inserted;
		PRINT 'Funcionario inserido! Nome completo: ' + @Pnome + ' ' + @Minicial + ' ' + @Unome
	END
END;
GO

-- INSERT COM ERRO POIS JA EXISTE ESSE FUNCIONARIO
-- INSERT INTO FUNCIONARIO (CPF, Pnome, Minicial, Unome) 
-- VALUES ('12345678900', 'Eric', 'M', 'Silva');

-- INSERT SEM ERRO
INSERT INTO FUNCIONARIO (CPF, Pnome, Minicial, Unome) 
VALUES ('00123456789', 'Anna Luiza', 'P', 'Bergamo');
