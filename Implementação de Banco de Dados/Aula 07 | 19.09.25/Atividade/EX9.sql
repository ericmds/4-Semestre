-- 9. Retornar livros com ISBN dentro de uma faixa
CREATE OR ALTER PROCEDURE usp_livrosPorFaixaISBN
    @isbnInicio VARCHAR(50),
    @isbnFim VARCHAR(50)
AS
BEGIN
    SELECT L.isbn, L.titulo, L.ano, A.nome AS Autor, C.tipo_categoria AS Categoria, E.nome AS Editora
    FROM Livro AS L
    INNER JOIN LivroAutor AS LA ON L.isbn = LA.fk_livro
    INNER JOIN Autor AS A ON A.id = LA.fk_autor
    INNER JOIN Categoria AS C ON L.fk_categoria = C.id
    INNER JOIN Editora AS E ON L.fk_editora = E.id
    WHERE L.isbn BETWEEN @isbnInicio AND @isbnFim;
END;

EXEC usp_livrosPorFaixaISBN '8532511015', '9788577345670';
