# 14. Listar livros de uma categoria específica
```
CREATE OR ALTER PROCEDURE usp_livrosPorCategoria
    @nomeCategoria VARCHAR(50)
AS
BEGIN
    SELECT L.isbn, L.titulo, L.ano, A.nome AS Autor, C.tipo_categoria AS Categoria, E.nome AS Editora
    FROM Livro AS L
    INNER JOIN LivroAutor AS LA ON L.isbn = LA.fk_livro
    INNER JOIN Autor AS A ON A.id = LA.fk_autor
    INNER JOIN Categoria AS C ON L.fk_categoria = C.id
    INNER JOIN Editora AS E ON L.fk_editora = E.id
    WHERE C.tipo_categoria LIKE '%' + @nomeCategoria + '%';
END;

EXEC usp_livrosPorCategoria 'Romance';
```

# 15. Calcular média do ano de publicação dos livros
```
CREATE OR ALTER PROCEDURE usp_mediaAnoPublicacao
AS
BEGIN
    SELECT AVG(L.ano * 1.0) AS MediaAnoPublicacao
    FROM Livro AS L;
END;

EXEC usp_mediaAnoPublicacao;
```

# 16. Associar um autor a um livro
```
CREATE OR ALTER PROCEDURE usp_associarAutorLivro
    @isbnLivro VARCHAR(50),
    @autorId INT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM LivroAutor
        WHERE fk_livro = @isbnLivro AND fk_autor = @autorId
    )
    BEGIN
        PRINT 'Autor já está associado a este livro.';
        RETURN;
    END

    INSERT INTO LivroAutor (fk_livro, fk_autor)
    VALUES (@isbnLivro, @autorId);

    PRINT 'Autor associado ao livro com sucesso!';
END;

EXEC usp_associarAutorLivro '9788577343348', 1;
```
# 17. Remover um autor de um livro
```
CREATE OR ALTER PROCEDURE usp_removerAutorLivro
    @isbnLivro VARCHAR(50),
    @autorId INT
AS
BEGIN
    DELETE FROM LivroAutor
    WHERE fk_livro = @isbnLivro AND fk_autor = @autorId;

    IF @@ROWCOUNT = 0
        PRINT 'Nenhum registro encontrado para remover.';
    ELSE
        PRINT 'Autor removido do livro com sucesso!';
END;

EXEC usp_removerAutorLivro '9788577343348', 1;
```
# 18. Listar livros com mais de um autor
```
CREATE OR ALTER PROCEDURE usp_livrosMultiplosAutores
AS
BEGIN
    SELECT L.isbn, L.titulo, COUNT(LA.fk_autor) AS QuantidadeAutores
    FROM Livro AS L
    INNER JOIN LivroAutor AS LA ON L.isbn = LA.fk_livro
    GROUP BY L.isbn, L.titulo
    HAVING COUNT(LA.fk_autor) > 1;
END;

EXEC usp_livrosMultiplosAutores;
```
# 19. Listar livros sem autores associados
```
CREATE OR ALTER PROCEDURE usp_livrosSemAutor
AS
BEGIN
    SELECT L.isbn, L.titulo
    FROM Livro AS L
    LEFT JOIN LivroAutor AS LA ON L.isbn = LA.fk_livro
    WHERE LA.fk_autor IS NULL;
END;

EXEC usp_livrosSemAutor;
```
# 20. Listar livros sem editora especificada
```
CREATE OR ALTER PROCEDURE usp_livrosSemEditora
AS
BEGIN
    SELECT L.isbn, L.titulo
    FROM Livro AS L
    LEFT JOIN Editora AS E ON L.fk_editora = E.id
    WHERE E.id IS NULL;
END;

EXEC usp_livrosSemEditora;
```
