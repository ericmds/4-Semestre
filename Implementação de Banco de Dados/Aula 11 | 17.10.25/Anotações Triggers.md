# Triggers
* São regras que especificam ações que são disparadas automaticamente por eventos

## Conceitos de banco de dados ativos e triggers
* D.D.L
  * Create, Alter, Drop...
* D.M.L
  * Update, Insert, Delete, Select
* Conceito de trigger
  * Uma técnica para especificar certos tipos de regras ativas

## Modelo generalizado para bancos de dados ativos e triggers
* O modelo usado para especificar regras de banco de dados ativo é conhecido como modelo
  * **Evento** - **Condição** - **Ação** **(ECA)**
### EVENTO
São os eventos que disparam a regra: esses eventos normalmente são operações de atualização do banco de dados que são aplicadas explicitamente ao banco de dados. No entando, no modo geral, eles também poderiam ser eventos temporais ou outros tipos de eventos externos

### Condição
* A condição que determina se a ação da regra deve ser executada: quando o evento que dispara a ação tiver ocorrido, uma condição **opcional** pode ser avaliada. Se **nenhuma** condição for especificada, a ação será executada quando ocorrer o evento. Se uma condição for especificada, ela é primeiro avaliada e, somente se for **avaliada** como verdadeira, a ação da regra será executada

### Triggers (Gatilho)
* Um Trigger (Gatilho) é um tipo special de Stored Procedure que é executada automaticamente quando um usuário realiza uma operação de modificação de dados em uma tabela expecificada
* As operações que podem disparar um trigger são:
  * INSERT
  * UPDATE
  * DELETE

## Triggers DML
* Os triggers não são executados diretamente, eles disparam apenas...

## Modos de disparo de um Trigger
## Fluxo de Transações
1. Verificação de IDENTITY INSERT
2. Restrição (Constraint) de Nulos (NULL)
3. Checagem de tipos de dados
4. Execução de trigger INSTEAD OF (a execução do DML pára aqui; esse trigger
não é recursivo)
5. Restrição de Chave Primária
6. Restrição “Check”
7. Restrição Chave Estrangeira
8. Execução do DML e atualização do log de transações
9. Execução do trigger AFTER
10. Commit da transação (Confirmação)

# Questão de PROVA
* No trigger é possível pegar a informação que está no bloco de comando
```sql
GO
CREATE OR ALTER TRIGGER trg_InserirFuncionario
ON FUNCIONARIO
INSTEAD OF INSERT
AS
DECLARE @nome VARCHAR(100);
SELECT @nome = Pnome FROM inserted; -- Com esse inserted, eu consigo pegar os valores do INSERT de baixo, como por exemplo o nome
PRINT 'NÃO INSERI NENHUM: ' + @nome;
GO
INSERT INTO FUNCIONARIO (Cpf, Pnome, Unome, Minicial)
VALUES ('12345678900', 'Eric', 'Silva', 'M');
```

* LOG QUESTÃO DE PROVA

## Habilitar E Desabilitar Triggers
* O administrador do sistema pode desabilitar temporariamente um trigger se houver necessidade
* Precisa sempre usar um ALTER TABLE antes, pois a Trigger fica vinculada na tabela
```sql
ALTER TABLE nome_tabela
ENABLE|DISABLE TRIGGER nome_trigger
```

## Determinando as colunas atualizadas
* A função UPDATE() retorna True se uma coluna especificada for altera por uma transação DML
* Podemos criar um gatilho que executa um código caso a coluna especificada seja alterada por comando DML usando essa função
```sql
CREATE TRIGGER tgr_NomeTrigger
ON Tabela
AS
IF UPDATE (CampoDaTabela - Exemplo: Pnome)
  BEGIN
    PRINT 'O nome foi alterado'
  END
ELSE
  BEGIN
    PRINT 'Nome não foi modificado
  END
```

## Atividade
#### Crie um trigger que seja disparado depois que uma operação de inserção ocorra na tabela FUNCIONARIO. Esse trigger deve registrar o CPF do novo funcionário inserido e a operação realizada (neste caso, "INSERT") em uma tabela de log (Log_Funcionario), juntamente com a data e hora da inserção. Esse trigger ajudará a manter um histórico das inserções realizadas na tabela de funcionários.
