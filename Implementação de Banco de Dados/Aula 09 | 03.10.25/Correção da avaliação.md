## 7. Liste o nome dos alunos e suas respectivas notas na disciplina "Banco de Dados"
#### Primeira forma
```sql
SELECT 
	A.Nome AS 'Aluno', 
	H.Nota, 
	D.Nome_disciplina AS 'Disciplina'
FROM ALUNO AS A
INNER JOIN HISTORICO_ESCOLAR AS H 
	ON A.Numero_aluno = H.Numero_aluno
INNER JOIN TURMA AS T 
	ON T.Identificacao_turma = H.Identificacao_turma
INNER JOIN DISCIPLINA AS D 
	ON T.Numero_disciplina = D.Numero_disciplina
WHERE D.Nome_disciplina = 'Banco de Dados'
```
### Segunda forma
```sql
SELECT 
	A.Nome AS 'Aluno', 
	H.Nota, 
	D.Nome_disciplina AS 'Disciplina'
FROM 
	ALUNO AS A,
	HISTORICO_ESCOLAR AS H,
	TURMA AS T,
	DISCIPLINA AS D
WHERE 
	H.Numero_aluno = A.Numero_aluno
	AND T.Identificacao_turma = H.Identificacao_turma
	AND T.Numero_disciplina = D.Numero_disciplina
	AND D.Nome_disciplina LIKE '%Banco de Dados%'
```

## 8. Quais são as disciplinas que têm pré-requisitos e quais são seus respectivos pré-requisitos?
```sql
SELECT
	D.Numero_disciplina,
	D.Nome_disciplina AS 'Disciplina',
	P.Numero_pre_requisito,
	DPR.Nome_disciplina 'Pré-Requisito' 
FROM DISCIPLINA AS D
INNER JOIN PRE_REQUISITO AS P 
	ON P.Numero_disciplina = D.Numero_disciplina
INNER JOIN DISCIPLINA AS DPR 
	ON P.Numero_pre_requisito = DPR.Numero_disciplina
```

## 9. Liste todas as disciplinas cursadas pelo aluno Silva, mostrando o nome da disciplina, o semestre, o ao e a nota final
```sql
SELECT 
	A.Nome, 
	D.Nome_disciplina AS Disciplina, 
	T.Semestre, 
	T.Ano, 
	H.Nota 
FROM TURMA AS T
INNER JOIN DISCIPLINA AS D 
	ON D.Numero_disciplina = T.Numero_disciplina
INNER JOIN HISTORICO_ESCOLAR AS H 
	ON H.Identificacao_turma = T.Identificacao_turma
INNER JOIN ALUNO AS A 
	ON A.Numero_aluno = H.Numero_aluno
WHERE A.Nome LIKE 'Silva'
```

## 10. Crie uma função (receba o nome do aluno em questão, e a respectiva disciplina) que verifique se o aluno foi "Aprovado", está "Em recuperação", ou "Reprovado" com base na nota final. Considere:
* Nota 'A' e 'B': Aprovado
* Nota 'C': Em recupreção
* Nota 'F': Reprovado
```sql
GO
CREATE OR ALTER FUNCTION fn_StatusAprovacaoAluno
(
	@NomeAluno VARCHAR(50),
	@NomeDisciplina VARCHAR(100)
)
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @nota CHAR(1);
	DECLARE @status VARCHAR(20);

	SELECT 
		@nota = H.Nota
	FROM TURMA AS T
	INNER JOIN DISCIPLINA AS D ON D.Numero_disciplina = T.Numero_disciplina
	INNER JOIN HISTORICO_ESCOLAR AS H ON H.Identificacao_turma = T.Identificacao_turma
	INNER JOIN ALUNO AS A ON A.Numero_aluno = H.Numero_aluno
	WHERE 
		A.Nome = @NomeAluno 
		AND D.Nome_disciplina = @NomeDisciplina;
	IF @nota IN('A', 'B')
		SET @status = 'Aprovado';
	ELSE IF @nota = 'C'
		SET @status = 'Em Recuperação';
	ELSE IF @nota = 'F'
		SET @status = 'Reprovado';
	ELSE
		SET @status = 'Sem Registro';
		
	RETURN @status;
END
GO

SELECT dbo.fn_StatusAprovacaoAluno('Silva', 'Matemática discreta') AS 'Status';
```

## 11. Crie uma função que converte as notas 'A', 'B', 'C', 'F' para os valores 10, 9, 8 e 0, respectivamente, depois liste o nome de todos alunos, as disciplinas que le crsou e suas notas no formato númerico
```sql
GO
CREATE OR ALTER FUNCTION fn_NotaParaNumero(@nota CHAR(1))
RETURNS INT
AS
BEGIN
	DECLARE @n INT;
	IF @nota = 'A'
		SET @n = 10;
	IF @nota = 'B'
		SET @n = 9;
	IF @nota = 'C'
		SET @n = 8;
	IF @nota = 'F'
		SET @n = 0;
	RETURN @N;
END;
GO

SELECT 
	A.Nome AS 'Aluno',
	D.Nome_disciplina AS 'Disciplina',
	H.Nota AS 'Conceito',
	dbo.fn_NotaParaNumero(H.Nota) AS 'Nota'
FROM TURMA AS T
INNER JOIN DISCIPLINA AS D ON D.Numero_disciplina = T.Numero_disciplina
INNER JOIN HISTORICO_ESCOLAR AS H ON H.Identificacao_turma = T.Identificacao_turma
INNER JOIN ALUNO AS A ON A.Numero_aluno = H.Numero_aluno
```

## 12. Crie uma função para verificar se uma turma está "Completamente Lotada", "Quase Cheia", ou "Com Vagas". Depois faça uma consulta que mostre a identificação da turma, nome da disciplina, número de alunos e o status de lotação, contendo todas as turmas. Paa determinação do status de lotação utilize a seguinte regra:
* 5 ou mais alunos: Completamente Cheia
* 3 a 4 alunos: Quase Cheia
* Menos de 3 alunos: Com vagas
```sql
GO
CREATE OR ALTER FUNCTION fn_StatusLotacao(@idTurma INT)
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @qtd INT, @status VARCHAR(30);

	SELECT @qtd = COUNT(H.Numero_aluno)
	FROM HISTORICO_ESCOLAR AS H
	WHERE H.Identificacao_turma = @idTurma;

	IF @qtd >= 5
		SET @status = 'Completamente Lotada'
	ELSE IF @qtd BETWEEN 3 AND 4
		SET @status = 'Quase Cheia'
	ELSE
		SET @status = 'Com Vagas'

	RETURN @status;
END;
GO

SELECT DISTINCT
	H.Identificacao_Turma,
	dbo.fn_StatusLotacao(H.Identificacao_turma) AS 'Vagas'
FROM HISTORICO_ESCOLAR AS H;
```

## 13. Crie um procedimento armazenado chamado usp_CalcularIdadeAluno que receba o número ddo aluno como parâmetro e exiba a idade correta do aluno
```sql
GO
CREATE OR ALTER PROCEDURE usp_CalcularIdadeAluno
	@NumeroAluno INT
AS
BEGIN
	DECLARE @dataNascimento DATE, @idade INT;

	SELECT @dataNascimento = A.Data_Nascimento
	FROM ALUNO AS A
	WHERE A.Numero_aluno = @NumeroAluno;

	SET @idade = DATEDIFF(YEAR, @dataNascimento, GETDATE());

	IF (MONTH(@dataNascimento) > MONTH(GETDATE())
		OR (MONTH(@dataNascimento) > MONTH(GETDATE()) AND DAY(@dataNascimento) > DAY(GETDATE())))
		SET @idade = @idade -1;

	SELECT @idade AS 'Idade';
END;
GO

EXEC dbo.usp_CalcularIdadeAluno 11;
```

## 14. Crie uma procedure chamada usp_AtualizarNota que receba o número do aluno, a identificação da turma e a nova nota como parâmetros e atualize a nota do aluno no histórico escolar, e exiba uma mensagem de sucesso ou falha.
```sql
GO
CREATE PROCEDURE usp_AtualizarNota
	@numeroAluno INT,
	@novaNota CHAR(1),
	@numeroTurma INT
AS
BEGIN
	UPDATE HISTORICO_ESCOLAR 
	SET Nota = @novaNota 
	WHERE Numero_aluno = @numeroAluno AND Identificacao_turma = @numeroTurma

	IF @@ROWCOUNT = 1
		PRINT 'Nota Atualizada!'
	ELSE
		PRINT 'Falha: registro não encontrado'
END;
GO

EXEC usp_AtualizarNota 1110, J, 85

SELECT * FROM HISTORICO_ESCOLAR
```
