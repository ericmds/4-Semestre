-- Inserir uma nova categoria
CREATE OR ALTER PROCEDURE usp_inserirCategoria
    @tipo_categoria VARCHAR(50)
AS
BEGIN
    INSERT INTO Categoria (tipo_categoria)
    VALUES (@tipo_categoria);

    PRINT 'Categoria inserida com sucesso!';
END;

EXEC usp_inserirCategoria 'Suspense';
SELECT * FROM Categoria;
