# Restrições de Integridade
* Integridade é a manutenção e garantia da consistência e precisão dos dados, ela é atingida por meio da aplicação de restrições de Integridade
* As restrições podem ser Declarativa ou Procedural

## Declarativa
* Na forma declarativa, as restrições são parametrizadas DURANTE A CRIAÇÃO DAS TABELAS, utilizando a liguagem SQL, na categoria DDL (Data Definition Language)
* Chaves primárias, valores não nulos, tipos e domínios de dados, regras de integridade referencial são exemplos de Restrições de Integridade Declarativa

## Procedural
* Na forma procedural, é possível fazer o uso de gatilhos (TRIGGERS), procedimento armazenados (PROCEDURES), bem como de afirmações (ASSERTION). Geralmente a forma procedural é implementada por programadores no SGBD, com o auxílio das regras de ngócios passadas pelos clientes

## Principais Restrições de Integridade
* Integridade de Domínio
* Integridade Referencial
* Integridade de Vazio
* Integridade de Chave
* Integridade Definida pelo Usuário

### Integridade de Domínio
* Quando um tipo é definido a um campo, por exemplo int, esse campo é restrangido a possuir somente valores inteiros
* Valores inseridos em uma coluna devem sempre obedecer à definição dos valores permitidos
* Fatores
  * Tipo de Dado do Campo
  * Representação interna do tipo de ado
  * Presença ou não do dado
  * Intervalos de valores no domínio
  * Conjunto de valores discretos

### Integridade Referencial
* Assegura que valores de uma coluna em uma tabela são álidos baseados nos valores em um outra tabela relacionada
* Exemplo: Se um produto com ID 123 foi cadastrado em uma tabela de Vendas, então um prodto com ID 123 deve existir na tabela de Produtos relacionadas
#### Atualização e Exclusão
* **CASCADE:** se um registro for excluído em uma tabela (operações DELETE e TRUNCATE), então os registros relacionados em outras tabelas que o referenciam talvez precisem ser excluídos. Caso contrário ocorrera erro. O mesmo se dá com a atualização de registros (UPDATE)
  * on delete cascade;
  * on update cascade;
    * quando utilizado, e um item for atualizado, vai atualizar de todos os outros relacionados

### Integridade de Vazio
* Informa se a coluna é obrigatória ou opcional, ou seja, se é possível não inserir um valor na coluna (campo)
* Uma coluna de chave primária, por exemplo, sempre deve ter dados inseridos, e nunca pode estar vazia para nenhum registro
#### Valores Nulos (NULL)
* Um valor NULL significa que não existem dados,
* É diferente de zero, espaço, string vazia ou tabulação
* Os nulos podem sem problemáticos, pois indicam
  * O valor da coluna não é apropriado
  * O valor não foi especificado
  * O valor é desconhecido

 ### Integridade de Chave
* Valores inseridos na coluna de chave primária (PK) devem ser sempre únicos, não permitindo repetições nesses valores
* Dessa forma, registros serão sempre distintos
* Os valores de chave primaria também não podem ser nulos

#### Integridade de Entidade
* Essa forma de restrição afirma que nenhum valor de chave primária (PK) pode ser NULL, pois o seu valor é utilizado para identificar tuplas individuais em uma tabela

### Integridade Definidade pelo Usuário
* Permite o usuário definir regras comerciais que não se encaixam em outras categorias de integridade
* Todas as cateorias de integridade oferecem suporte à integridade definida pelo usuário
* Esta integridade se refere a regras de negócio específicas que são definidas pelo usuário
* Por exemplo, pode definir que uma coluna aceitará um conjunto restrito de valores

### Integridade da Coluna
* Determina os valores aceitos para a respectiva coluna

## Exemplos
```sql
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
```
