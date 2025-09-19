-- Procedure
-- Crie um procedimento que exiba seu nome.
ALTER PROCEDURE usp_exibeNome 
	@nome varchar(50) 
AS
BEGIN
	PRINT 'Seu nome é: ' + @nome;
END;


EXEC usp_exibeNome 'Frazzon';

-- Procedure
-- Crie um procedure que liste o nome completo dos funcionários e o nome dos seus respectivos departamentos.
ALTER PROCEDURE usp_listaDadosFunc 
AS
BEGIN
	SELECT F.Pnome+' '+F.Minicial+'. '+F.Unome AS Nome, D.Dnome AS Departamento
	FROM FUNCIONARIO AS F
	FULL JOIN DEPARTAMENTO AS D
		ON F.Dnr = D.Dnumero
END

EXEC usp_listaDadosFunc;

-- Criptografia

CREATE PROCEDURE usp_Funcionario
WITH ENCRYPTION
AS
SELECT *
FROM FUNCIONARIO

EXEC sp_helptext usp_Funcionario; -- nao da pra ver 

-- Procedure UPDATE
/* 
Crie uma procedure que atualiza o salário de um funcionário baseado no CPF
se não encontrar nenhum funcionário com o CPF passado exiba uma mensagem.
*/

ALTER PROCEDURE usp_atualizaSalario 
	@CPF VARCHAR(11),
	@NovoSalario DECIMAL(10,2)
AS
BEGIN
	--Atualiza
	UPDATE FUNCIONARIO
	SET Salario = @NovoSalario
	WHERE Cpf = @CPF

	IF @@ROWCOUNT = 0 
		PRINT 'CPF NÃO ENCONTRADO'
END

DECLARE @CPF VARCHAR(11);
SET @CPF = '88866555576'

EXEC usp_atualizaSalario @CPF, 55000

-- Procedure
-- Crie um procedure que insira um novo funcionário mas antes verifique se já não existe um funcionário com o mesmo nome (nome completo)
CREATE PROCEDURE usp_InserirFuncionario
	@Pnome VARCHAR(15),
	@Minicial CHAR(1),
	@Unome VARCHAR(15),
	@Cpf CHAR(11)
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM FUNCIONARIO AS F
		WHERE F.Pnome = @Pnome 
		AND F.Minicial = @Minicial 
		AND F.Unome = @Unome
		)
	BEGIN
		PRINT 'Já existe um funcionário como este nome!'
		RETURN;
	END

	INSERT INTO FUNCIONARIO(Pnome, Minicial, Unome, Cpf)
	VALUES (@Pnome, @Minicial, @Unome, @Cpf);
END;

EXEC usp_InserirFuncionario 'Juca', 'S', 'Rodrigues', '66778899';
SELECT * FROM FUNCIONARIO;

-- Procedure
-- Crie um procedure que insira um novo departamento com sua respectiva localidade
SELECT * 
FROM DEPARTAMENTO AS D
INNER JOIN LOCALIZACAO_DEP AS L
ON L.Dnumero = D.Dnumero

CREATE PROCEDURE usp_inserirLocalidade
@Dnome VARCHAR(50),
@Dlocal VARCHAR(50),
AS
BEGIN

END

-- Procedure
-- Crie um procedure que faz uma listagem dos funcionários por departamento, mas se o departamento não for especificado, o procedimento lista todos os funcionarios

ALTER PROCEDURE usp_listaDadosFunc
    @nomeDepartamento VARCHAR(100) = NULL -- Parâmetro opcional para o nome do departamento
AS
BEGIN
    -- Se um nome de departamento for fornecido, filtra pelos funcionários desse departamento
    IF @nomeDepartamento IS NOT NULL
    BEGIN
        SELECT F.Pnome + ' ' + F.Minicial + '. ' + F.Unome AS Nome,
               D.Dnome AS Departamento
        FROM FUNCIONARIO AS F
        INNER JOIN DEPARTAMENTO AS D
            ON F.Dnr = D.Dnumero
        WHERE D.Dnome = @nomeDepartamento
    END
    -- Se não for fornecido, lista todos os funcionários
    ELSE
    BEGIN
        SELECT F.Pnome + ' ' + F.Minicial + '. ' + F.Unome AS Nome,
               D.Dnome AS Departamento
        FROM FUNCIONARIO AS F
        FULL JOIN DEPARTAMENTO AS D
            ON F.Dnr = D.Dnumero
    END
END

EXEC usp_listaDadosFunc;

EXEC usp_listaDadosFunc 'Pesquisa';

-- Procedure | Parâmetro de Saida
ALTER PROCEDURE usp_Dobro(@valor AS INT OUT)
AS
SELECT @valor * 2
RETURN

-- Testando o procedimento
DECLARE @custo AS INT = 15;
EXEC usp_Dobro @custo OUTPUT;
PRINT @valor;
