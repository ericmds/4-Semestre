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
