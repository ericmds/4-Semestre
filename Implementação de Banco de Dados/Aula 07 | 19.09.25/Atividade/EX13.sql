-- Listar livros entre dois anos
CREATE OR ALTER PROCEDURE usp_livrosEntreAnos
    @anoInicio INT,
    @anoFim INT
AS
BEGIN
    SELECT L.isbn, L.titulo, L.ano, A.nome AS Autor, C.tipo_categoria AS Categoria, E.nome AS Editora
    FROM Livro AS L
    INNER JOIN LivroAutor AS LA ON L.isbn = LA.fk_livro
    INNER JOIN Autor AS A ON A.id = LA.fk_autor
    INNER JOIN Categoria AS C ON L.fk_categoria = C.id
    INNER JOIN Editora AS E ON L.fk_editora = E.id
    WHERE L.ano BETWEEN @anoInicio AND @anoFim
    ORDER BY L.ano;
END;

EXEC usp_livrosEntreAnos 2000, 2015;
