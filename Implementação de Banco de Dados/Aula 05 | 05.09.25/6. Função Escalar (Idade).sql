-- FUNCÇÕES ESCALARES
-- 2) Criar uma função que calcula a idade de um funcionário com base na data de nascimento
CREATE FUNCTION fn_CalcularIdade (@DataNasc DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Idade INT;

    SET @Idade = DATEDIFF(YEAR, @DataNasc, GETDATE());

    IF (MONTH(@DataNasc) > MONTH(GETDATE())) 
        OR (MONTH(@DataNasc) = MONTH(GETDATE()) AND DAY(@DataNasc) > DAY(GETDATE()))
    BEGIN
        SET @Idade = @Idade - 1;
    END

    RETURN @Idade;
END;

GO
SELECT F.Pnome, F.Datanasc, dbo.fn_CalcularIdade(F.Datanasc) AS Idade
FROM FUNCIONARIO AS F