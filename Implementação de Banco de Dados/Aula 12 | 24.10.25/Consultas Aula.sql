-- Criando Banco para exemplos de restricoes
CREATE DATABASE RESTRICOES;

-- Usando a base Restricoes
USE RESTRICOES;
GO

GO;

CREATE TABLE petShop
(
	id INT PRIMARY KEY IDENTITY,
	nomeDono VARCHAR(50) UNIQUE,
	nomePet VARCHAR(50) NOT NULL,
	idadePet INT CHECK (idadePet > 0),
	sexoPet CHAR CHECK (sexoPet IN ('M', 'F', 'N'))
);

-- Testetando as Restrições
INSERT INTO petShop VALUES ('Herysson', 'Logan', 7, 'M');
INSERT INTO petShop VALUES ('Herysson', 'Fumaça', 10, 'M'); -- Verificando a Restrição UNIQUE do nomeDono
INSERT INTO petShop VALUES ('Juca', 'Fumaça', -10, 'M');    -- Verificando a Restrição CHECK da idadePet
INSERT INTO petShop VALUES ('Juca', 'Fumaça', 8, 'X');      -- Verificando a Restrição CHECK do sexoPet

-- Exemplo 2
CREATE TABLE Produto
(
	cod INT PRIMARY KEY,
	nome VARCHAR(50),
	categoria VARCHAR(50)
);

CREATE TABLE Inventario
(
	id INT PRIMARY KEY IDENTITY,
	codProduto INT,
	quantidade INT,
	minLevel INT,
	maxLevel INT,

	CONSTRAINT fk_inven_produto
		FOREIGN KEY (codProduto)
		REFERENCES Produto(cod)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Venda
(
	id INT PRIMARY KEY IDENTITY,
	codProduto INT,
	quantidade INT
);

-- Outra forma de de atribuir restrições
ALTER TABLE Venda
ADD CONSTRAINT fk_Venda_produto
FOREIGN KEY (codProduto)
		REFERENCES Produto(cod)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- Cadastrando produtos
INSERT INTO Produto 
VALUES (1, 'Sabão', 'Higiene'),
	   (2, 'Coca Cola', 'Bebidas'),
	   (3, 'Spateh 473ml', 'Bebidas'),
	   (4, 'Belinha', 'Bebidas'),
	   (5, 'Catuaba', 'Bebidas'),
	   (6, 'Energético', 'Bebidas');

INSERT INTO Inventario (codProduto, quantidade, minLevel, maxLevel)
VALUES (1, 8, 2, 20),
	   (2, 100, 80, 200),
	   (3, 1000, 800, 5000),
	   (4, 5, 1, 10),
	   (5, 15, 10, 100),
	   (6, 200, 100, 500)

SELECT * FROM Produto AS P
INNER JOIN Inventario AS I ON I.codProduto = P.cod

DELETE FROM Produto WHERE cod = 1; -- Só é possivel deletar o sabão pois colocanos ON DELETE CASCADE na tabela Produto

UPDATE Produto
SET cod = 87655 WHERE cod = 2; -- Só é possivel atualizar o cod (PK) da coca, pois possui ON UPDATE CASCADE na tabela Produto

-- Simulando algumas vendas
INSERT INTO Venda
VALUES (87655, 5),
	   (3, 10),
	   (3, 20),
	   (3, 5),
	   (5, 1),
	   (4, 2),
	   (6, 4);

-- Removendo restrições
ALTER TABLE Venda DROP CONSTRAINT fk_Venda_produto;

-- Utilizando o Banco BIBLIOTECA, crie uma viw para retornar todas as informações conforme a tabela do PDF
GO
CREATE OR ALTER VIEW vw_Relatoriolivros
AS
SELECT 
	L.isbn AS 'ISBN',
	L.titulo AS 'TÍtulo',
	L.ano AS 'Ano',
	E.nome AS 'Editora',
	A.nome + ' (' + A.nacionalidade + ')' AS 'Autor/Nacionalidade',
 -- CONCAT (A.nome, ' (', A.nacionalidade, ') ') AS 'Autor/Nacionalidade' -- OUTRA FORMA DE MOSTRAR O Autor e Nacionalidade
	C.tipo_categoria AS Categoria
FROM Livro AS L
INNER JOIN LivroAutor AS LA 
	ON L.isbn = LA.fk_livro
INNER JOIN Autor AS A 
	ON A.id = LA.fk_autor
INNER JOIN Editora AS E 
	ON E.id = L.fk_editora
INNER JOIN Categoria AS C 
	ON C.id = L.fk_categoria
GO

SELECT DISTINCT Editora FROM vw_Relatoriolivros
