-- 3. Adicionar um novo autor
CREATE OR ALTER PROCEDURE usp_inserirAutor
    @nome VARCHAR(100),
    @nacionalidade VARCHAR(50) = NULL
AS
BEGIN
    INSERT INTO Autor (nome, nacionalidade)
    VALUES (@nome, @nacionalidade);

    PRINT 'Autor inserido com sucesso!';
END;

EXEC usp_inserirAutor 'George R. R. Martin', 'EUA';
SELECT * FROM Autor;
