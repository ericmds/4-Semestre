-- 12. Contar livros por editora
CREATE OR ALTER PROCEDURE usp_contarLivrosPorEditora
AS
BEGIN
    SELECT E.nome AS Editora, COUNT(L.isbn) AS QuantidadeLivros
    FROM Editora AS E
    LEFT JOIN Livro AS L ON L.fk_editora = E.id
    GROUP BY E.nome;
END;

EXEC usp_contarLivrosPorEditora;
