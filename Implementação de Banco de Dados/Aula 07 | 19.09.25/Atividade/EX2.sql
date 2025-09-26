-- Atualizar detalhes de um livro pelo ISBN
CREATE OR ALTER PROCEDURE usp_atualizarLivro
    @isbn VARCHAR(50),
    @novoTitulo VARCHAR(100),
    @novoAno INT
AS
BEGIN
    UPDATE Livro
    SET titulo = @novoTitulo,
        ano = @novoAno
    WHERE isbn = @isbn;

    IF @@ROWCOUNT = 0
        PRINT 'Nenhum livro encontrado com esse ISBN.';
    ELSE
        PRINT 'Livro atualizado com sucesso!';
END;

EXEC usp_atualizarLivro '8532511015', 'Harry Potter e a Câmara Secreta', 2001;
