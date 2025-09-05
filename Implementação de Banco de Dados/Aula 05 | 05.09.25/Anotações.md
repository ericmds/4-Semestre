# IF/ELSE

## WHILE
O SQL Server bloqueia alterações WHILE acima de 30 alterações
```sql
DECLARE @valor INT
SET @valor = 0

WHILE @valor < 10
  BEGIN
    PRINT 'Número: ' + CAST(@valor AS VARCHAR(2))
    SET @valor = @valor + 1
  END;
```

# FUNÇÕES
* Quando criamos uma funçao, ela fica disponível no banco na pasta PROGRAMAÇÃO -> FUNÇÕES, podendo ser chamada em todo banco
* Da para modificar a função indo na pasta e selecionando modificar
## CRIANDO FUNÇÃO
```sql
-- FUNÇÃO ESALARES
-- 1) EXEMPLO
CREATE FUNCTION fn_Dobro(@Numero INT)
RETURNS INT --> Tipo de retorno da função
AS
BEGIN --> Aqui começa o bloco da função
	RETURN @Numero * 2; --> Retorno da função
END;
```

## MODIFICANDO FUNÇÃO
* Bloco gerado automaticamente
<img width="364" height="527" alt="{0ACF505D-677E-4A24-9366-8B7729D58CB5}" src="https://github.com/user-attachments/assets/922225da-a7ae-42db-aeb1-de0acd19e7bf" />

```sql
USE [EMPRESA]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Dobro]    Script Date: 05/09/2025 09:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fn_Dobro](@Numero DECIMAL(10,2))
RETURNS INT --> Tipo de retorno da função
AS
BEGIN --> Aqui começa o bloco da função
	RETURN @Numero * 2; --> Retorno da função
END;
```
