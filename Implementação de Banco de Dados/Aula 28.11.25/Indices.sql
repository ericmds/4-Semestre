GO
CREATE DATABASE AULA;

USE AULA;
GO

CREATE TABLE Pessoa(
	id INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(255),
	Cidade VARCHAR(255),
	Estado CHAR(2),
	CPF VARCHAR(14)
);

-- Fazendo o SQL ler o arquivo JSON
GO
DECLARE @json NVARCHAR(MAX)

SELECT @json = BulkColumn
FROM OPENROWSET(
	BULK 'C:\Users\laboratorio\Downloads\generated.json', -- Local do arquivo
	SINGLE_NCLOB -- Precis se NCLOB para utilizar acentos e no arquivo salvar para UTF-16LE
) AS J;

-- SELECT @json AS JsonCompleto; -- Agora todas as informações estão nessa variavel

-- Agora vamos inserir esses dados no banco
INSERT INTO Pessoa(Nome, Cidade, Estado, CPF)
SELECT
	Nome,
	Estado,
	Estado,
	CPF
FROM OPENJSON(@json)
WITH(
	Nome VARCHAR(255)	'$.name',
	Cidade VARCHAR(255) '$.cidade',
	Estado CHAR(2)		'$.estado',
	CPF VARCHAR(14)		'$.cpf'
	);
GO

-- Criando um Indice
CREATE INDEX IX_Pessoa_Nome_Estado
ON Pessoa(Nome, Estado)

SELECT * 
FROM Pessoa
ORDER BY Pessoa.Nome, Pessoa.Estado;

TRUNCATE TABLE Pessoa; -- RESETA A TABELA

