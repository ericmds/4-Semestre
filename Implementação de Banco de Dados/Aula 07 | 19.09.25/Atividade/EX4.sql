-- 4. Excluir um autor e remover associações com livros
CREATE OR ALTER PROCEDURE usp_excluirAutor
    @autorId INT
AS
BEGIN
    DELETE FROM LivroAutor
    WHERE fk_autor = @autorId;

    DELETE FROM Autor
    WHERE id = @autorId;

    IF @@ROWCOUNT = 0
        PRINT 'Autor não encontrado.';
    ELSE
        PRINT 'Autor e associações removidos com sucesso!';
END;

EXEC usp_excluirAutor 6;
