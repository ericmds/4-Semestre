CREATE OR ALTER PROCEDURE usp_livrosPorCategoria
    @nomeCategoria VARCHAR(50)
AS
BEGIN
    SELECT L.isbn, L.titulo, L.ano, C.tipo_categoria
    FROM Livro AS L
    INNER JOIN Categoria AS C ON L.fk_categoria = C.id
    WHERE C.tipo_categoria LIKE '%' + @nomeCategoria + '%';
END;

EXEC usp_livrosPorCategoria 'Humor';
