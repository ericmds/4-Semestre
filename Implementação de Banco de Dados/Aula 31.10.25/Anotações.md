# Revisão - Conteúdos para a prova
## Triggers
* Insert
  * 
* Update
  * 
* Delete
  * 
* After
  *  
* Instead Of
  * Substitui a ação pelo código que está dentro da Trigger

## View
* Consultas armazenadas em formato de uma tabelas virtuais
* Facilitar a vida na camada de aplicação
* Ganho de um pequeno benifício de memória
* Pode usar todos os comandos nessa tabela

---

# Aula de hoje
## Gerenciamento de Usuário
* Grant
* Deny
* Revoke

## Banco de Dados Temporais
* Informações ao passar do tempo

---

# Gerenciamento de Acesso
## Segurança a nível de Servido
* Servidor
  * Quando existe uma coneção para o usuário no servidor
* Database
  * Dar acesso a um banco de dados
* Objeto
  * Dar acesso ou remover acesso a um objeto específico
    * tabela
    * view
    * function
    * procedure
### Servidor
Criação de Logins no SQL Server

* Windows (Domínio)
* SQL Server

Opções na criação de um Login
* Só System Admim consegue criar logins para os usuários
<img width="491" height="310" alt="{5B8B420D-729F-4D4D-9BB1-63BFC43E498C}" src="https://github.com/user-attachments/assets/1583059a-6abd-4212-88b4-c83af0d8df74" />
<img width="710" height="663" alt="{E9130A2F-37DC-4A94-9322-BF3BFE8223D0}" src="https://github.com/user-attachments/assets/f3a6138b-a0a5-497f-a1a2-e34aeb14e586" />
<img width="710" height="664" alt="{B6FD4779-E826-4DA0-A1B0-9ECD400993CE}" src="https://github.com/user-attachments/assets/70ad2b7f-6abd-4351-b8aa-ee5c84adc713" />
<img width="711" height="665" alt="{080AB209-C83E-4BA8-B428-A5144876D6F0}" src="https://github.com/user-attachments/assets/72389bba-a1d8-4564-9ef0-ad94b837c1ae" />

#### Script da criação de usuário
```sql
USE [master]
GO
CREATE LOGIN [Juca Junior] WITH PASSWORD=N'laboratorio', DEFAULT_DATABASE=[BIBLIOTECA], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
use [master];
GO
USE [BIBLIOTECA]
GO
CREATE USER [Juca Junior] FOR LOGIN [Juca Junior]
GO
USE [BIBLIOTECA]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Juca Junior]
GO

```
<img width="350" height="309" alt="{603DB302-89DE-4A2D-84C5-400EDD96DAB8}" src="https://github.com/user-attachments/assets/a5285da5-f6eb-4cfe-b0e5-d2320f9827ea" />
<img width="483" height="518" alt="{A4E63EFC-D3AF-429D-B6B0-2262F1A1289F}" src="https://github.com/user-attachments/assets/acba4ad8-99c6-41b7-8b02-7fe8f705ccfd" />

### Comando GRANT, DENY e REVOKE
#### GRANT
* Concede uma permissão esoecífica a uma usuário ou função
* Isso permite que o usuário execute certas ações, como selecionar dados ou modificar uma tabela



##### Terminal Admin
```sql
USE BIBLIOTECA;

-- Da acesso ao Juca para fazer INSERT no Banco Biblioteca
GRANT INSERT ON Autor TO [Juca Junior];

-- Tirando o acesso do Juca fazer SELECT em EDITORA
DENY SELECT ON Editora TO [Juca Junior];

-- Remove/Revoga as permissões
REVOKE SELECT ON Editora TO [Juca Junior];

--Query para retonar as permissões que são dadas a nível de objetos
SELECT	state_desc, prmsn.permission_name as [Permission], sp.type_desc, sp.name,
		grantor_principal.name AS [Grantor], grantee_principal.name as [Grantee]
FROM sys.all_objects AS sp
	INNER JOIN sys.database_permissions AS prmsn 
	ON prmsn.major_id = sp.object_id AND prmsn.minor_id=0 AND prmsn.class = 1
	INNER JOIN sys.database_principals AS grantor_principal
	ON grantor_principal.principal_id = prmsn.grantor_principal_id
	INNER JOIN sys.database_principals AS grantee_principal 
	ON grantee_principal.principal_id = prmsn.grantee_principal_id
WHERE grantee_principal.name = 'Juca Junior'
```
##### Terminal Juca
```sql
SELECT L.isbn, L.titulo, L.ano, A.nome, E.nome
FROM Livro AS L
JOIN LivroAutor AS LA ON LA.fk_livro = L.isbn
JOIN Autor AS A ON A.id = LA.fk_autor
JOIN Editora AS E ON L.fk_editora = E.id

-- Juca Tentando Se Inserir como Autor
INSERT INTO Autor (nacionalidade, nome)
VALUES ('Brasileiro', ' Juca da Silva Junior');

-- Só consegue depois do ADM usar o GRANT para permitir INSERT
SELECT * FROM Autor;

-- Juca tentando ser escritor de Harry Potter e A Pedra Filosofal
UPDATE LivroAutor
SET fk_autor = 7
WHERE fk_livro = '8532511015';
```

## Exercício
* Usuário com acesso a leitura do Banco Empresa
* Acesso a criação/alteração de novos funcionários
* Não permitido deletar registros
```sql CRIAÇÃO DO USUÁRIO
USE [master]
GO
CREATE LOGIN [Kiko] WITH PASSWORD=N'laboratorio', DEFAULT_DATABASE=[EMPRESA], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [EMPRESA]
GO
CREATE USER [Kiko] FOR LOGIN [Kiko]
GO
USE [EMPRESA]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Kiko]
GO
```

```sql ADMIN
USE EMPRESA;

-- Permite inserir novos funcionários
GRANT INSERT ON Funcionario TO Kiko;

-- Permite alterar funcionarios
GRANT UPDATE ON Funcionario TO Kiko;

-- Query para retonar as permissões que são dadas a nível de objetos
SELECT	state_desc, prmsn.permission_name as [Permission], sp.type_desc, sp.name,
		grantor_principal.name AS [Grantor], grantee_principal.name as [Grantee]
FROM sys.all_objects AS sp
	INNER JOIN sys.database_permissions AS prmsn 
	ON prmsn.major_id = sp.object_id AND prmsn.minor_id=0 AND prmsn.class = 1
	INNER JOIN sys.database_principals AS grantor_principal
	ON grantor_principal.principal_id = prmsn.grantor_principal_id
	INNER JOIN sys.database_principals AS grantee_principal 
	ON grantee_principal.principal_id = prmsn.grantee_principal_id
WHERE grantee_principal.name = 'Kiko'
```

```sql Kiko
INSERT INTO FUNCIONARIO (cpf, Pnome, Minicial, Unome, Sexo)
VALUES (12345678900, 'Luiza', 'K', 'Lerdec', 'M');

SELECT * FROM FUNCIONARIO;

UPDATE FUNCIONARIO SET Pnome = 'Vanessa', Unome = 'Cezar'
WHERE Cpf = 12312312311;

DELETE FROM FUNCIONARIO 
WHERE Cpf = 12345678900;
```

# Banco de Dados Temporais
## Introdução
* Pode ser classificado sobre várias características
* É dito temporal, em um sentido mais amplo..
  
## Aplicações Temporais
* Saúde
	* histórico de pacientes
 * Seguro
 	* histórico de acicles e sinistros
  * data de vigor das apólices
* Sistema de reservas
  * hotelaria
  * companhia aéreas
* Bancos de Dados científicos
  * dados de experimentos como desmatamento
* Sistema de gestão
  * dados de funcionários 

## Ordem do tempo
### Ordem linear
* Forma mais usual de ordem temporal
* Um dado com no máximo um sucessor e um predecessor
* Ex: evolução do salário de um empregado
### Ordem ramificado
* Um dado pode ter vários sucessores e/ou predecessores
* Ex: Hipóteses para a evolução do homem té os dias de hoje
### Ordem circular
* Um conjunto de dados se repete periodicamente em uma certa ordem
* Ex: períodos de promoção de uma loja: verão, páscoa, dia das mães, outono-inverno, dia dos pais

## Classificação do Tempo
### Tempo Instantâneo
* Característico de BD convencional, registro apenas o dado válido no tempo atual
* tempo implícito é a data do sistema Tempo de Transação ou evolutivo: trata o tempo de transação

## Granularidade Temporal
* UM _chronon_ é um intervalo temporal que não pode ser decomposto
	* Ex: ANO, MÊS, DIA, HORA, MIN, SEG, ...
* Quanto menor for a granularidade, maior é o detalhamento de uma informação

## Relação Instantânea/Temporal
* Mantém dados instantâneos e temporais em uma única relação
* Ex: ID, a1, ..., an, TÍnicio, TFim
	* 1, Banco do Brasil, ABC, 432, ---, 01/02/2025
 	* 2, Banco do Brasil, BCA, 432, 02/02/2025, 06/07/2016
  	* 3, Banco do Brasil, BCA, 123, 07/07/2016, ---
* Vantagens
	* Fácil consulta
 * Desvantagens
 	* Redundancia de dados

## Relaçã instantânea e relação temporal
* Mantém dados instantâneos e temporais em relações separadas
* R INST - *ID, a1, ..., an -- guardo o tempo atual do banco
* R TEMP - *ID, a1, ... an, Tinicio, Tfim -- guarda o banco temporal
* Vantagens
	* melhor desempenho para consultas instantâneas
 * Desvantagens
 	* redundância de dados
  	* maior número de relações

## Relação Temporal Delta
* Mantém relações temporais separadas para cada atributo - definidas apenas para atributos temporais
* Exemplo:
	* ID, a1, ..., an
 	* ID, a1, Tinicio, Tfim,
  	* ID, an, Tinicio, Tfim,
* Vantagens
	* Evita redundancia
* Desvantegens
### Criando e Manipulando Banco de Dados Relacional
```sql
-- CRIANDO BANCO RELACIONAL
CREATE DATABASE DB_Temporal;

GO
USE DB_Temporal;
GO

CREATE TABLE InventarioCarros  
(    
    CarroId INT IDENTITY PRIMARY KEY,
    Ano INT,
    Marca VARCHAR(40),
    Modelo VARCHAR(40),
    Cor varchar(10),
    Quilometragem INT,
    Disponivel BIT NOT NULL DEFAULT 1,
    SysStartTime datetime2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime datetime2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)     
)   
WITH 
( 
	--provividencia um nome para a tabela de históricos
    SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.HistoricoInventarioCarros)   
)

Insert into dbo.InventarioCarros (Ano,Marca,Modelo,Cor,Quilometragem,Disponivel) 
values (2004, 'Fiat', 'Uno', 'Branco', 150000, 1);
Insert into dbo.InventarioCarros (Ano,Marca,Modelo,Cor,Quilometragem,Disponivel) 
values (2015, 'Ford', 'Ka', 'Preto', 30000, 1);
Insert into dbo.InventarioCarros (Ano,Marca,Modelo,Cor,Quilometragem,Disponivel) 
values (2022, 'Hyundai', 'HB20', 'Prata', 0, 1);
Insert into dbo.InventarioCarros (Ano,Marca,Modelo,Cor,Quilometragem,Disponivel) 
values (2022, 'Hyundai', 'HB20', 'Branco', 0, 1);

SELECT * FROM InventarioCarros;
SELECT * FROM dbo.HistoricoInventarioCarros;

-- Foram alugados alguns veículos
UPDATE InventarioCarros SET Disponivel = 0 WHERE CarroId = 1;
UPDATE InventarioCarros SET Disponivel = 0 WHERE CarroId = 4;

-- Os carros form entregues
UPDATE InventarioCarros 
    SET Disponivel = 1, 
    Quilometragem = 16000
WHERE CarroId = 1;

UPDATE InventarioCarros 
    SET Disponivel = 1, 
        Quilometragem = 5000
WHERE CarroId = 4;

-- Alugado o UNO
UPDATE InventarioCarros SET Disponivel = 0 WHERE CarroId = 1;

-- Uno deu PT
DELETE FROM InventarioCarros WHERE CarroId = 1;

-- Olhando para um passado distante (PESQUISA TEMPORAL)
SELECT * FROM InventarioCarros
FOR SYSTEM_TIME AS OF '2025-10-31 14:17:50' ORDER BY CarroId;

-- Recuperando o histórico de guerra do meu UNO
SELECT * FROM InventarioCarros
FOR SYSTEM_TIME ALL
WHERE CarroId = 1;

-- Saber qual carros foram deletados
SELECT DISTINCT H.Modelo
FROM InventarioCarros AS I
RIGHT JOIN dbo.HistoricoInventarioCarros AS H
ON I.CarroId = H.Carroid
WHERE I.CarroId IS NULL;
```
