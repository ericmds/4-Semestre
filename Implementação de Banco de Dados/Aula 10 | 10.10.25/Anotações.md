# Continuação sobre Transações
* A transaction permite tu olhar um bloco de código, sem antes permitir dar commit, para se caso a manipulação de dados der errado, poder verificar se está certo e ter um "backup" do banco antes da transação
* TRANSACTION E TRAN só o mesmo comando
### A  C  I  D
  
| Letra | Conceito     |
| :---: | ------------ |
| A     | Atomicidade  |
| C     | Consistência |
| I     | Isolamento   |
| D     | Durabilidade |

### Atomicidade
* Indivisivel
* Ela deve ser completamente concluída ou totalmente desfeita
### Consistência
* O Banco só pode sair de um estado **válido** para outro estado válido
* O Banco sempre vai manter a consistencia do banco
### Isolameto
* "1 Transação por vez"
* Enquanto está sendo feito uma transação em uma tabela, ninguém mais pode mexer nessa tabela, se não não iria ter um tabela atualizada
* Isola as transações , deixa somente "uma transação por vez em um objeto"
### Durabilidade
* "Commit"
* Quando um novo estado no banco é feito, ou seja, quando mexeu no banco (insert, update, delete), não tem como desfazer 

## Comandos vistos
* TRANSACTION ou TRAN
* ROLLBACK
* COMMIT
* SALVE POINT
  * 


# Case
```sql
CASE
  WHEN condição1 THEN valor1,
  WHEN condição2 THEN valor2,
            .
            .
            .
  ELSE valorDefault
END
```

# TRIGGERS
