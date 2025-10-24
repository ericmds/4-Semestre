# View - Exibição
* É uma tabela virtual baseada no conjunto resultados de uma consulta SQL
* Contém linhas e colunas como uma tabela real
* Pode receber comandos como declarações JOIN, WHERE e funções como uma tabela normal
* Mostra sempre resultados de dados atualizados, pois o motor do banco de dados recria os dados toda vez que o usuário consulta a view

## Vantagens
* Reuso
  * As Views são objeos de caráter permanente. Pensando pelo lado produtivo, isso é excelente, já que elas podem ser lidas por vários usuários simultaneamente
* Segurança
  * Permitem que ocultemos determinadas colunas de uma tabela. Para isso, basta criarmos uma view com as colunas que acharmos necessários que sejam exibidas e as disponibizarmos para o usuário
* Simplificação do código
  * Permitem criar um código de programação muito mais lindo, na medida que em que podem conter um SELECT complexo. Assim, criar views para os programadores a fim de poupá-los dos trabalho de criar SELECT'S é uma forma de aumentar a produtividade da equipe de desenvolvimento
* Economixar tempo com retrabalaho
* Velocidade de acesso às informações
* Mascarar complexidade do banco de dados
* Simplifica o gerenciamento de permissão de usuários
* Organiza dados a serem exportados para outros aplicativos

## Onde usar
* Retrição Usuário x Dados
* Restrição usuário x domínio
* Associar vários domínios formando uma única entidade
* Agregar informações, em vez de fornecer detalhes

## Criação de Views
```sql
CREATE VIEW [Nome_Exibição] AS
SELECT colunas
FROM tabela
WHERE condicao
```

## Exercício
```sql
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
```
