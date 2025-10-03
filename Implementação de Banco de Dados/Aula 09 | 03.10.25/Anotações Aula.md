# TRANSAÇÕES
* Banco de Dados Ativos
  * Quando o Banco faz algo para nós
* Transações
* Uma transação em banco de dados é um conjunto de operações que são tratadas como uma única de trabalho
* A transação é atômica, indivisivel, quando por exemplo um INSERT vai ser inserido, ele deve inserir o comando inteiro ou seja,
* Uma transformação deve ser completamente concluída ou completamente revertida para garantir que o banco permaneça em um estado consistente
* O principal objeto disso é garantir a integridade e consistencia dos dados, mesmo diante defalhas, como erros no sistema ou interrupções
* Para isso deve se segir as características A.C.I.D
    * <ins> **A**</ins>tomicidade
    * <ins>**C**</ins>onsistência
    * <ins>**I**</ins>solamento
    * <ins>**D**</ins>urabilidade
### Atomicidade
A atomicidade garante que uma transação é tratada como uma únicaunidade, o que significa que ela deve ser completamente concluída ou totalmente desfeita. Se qualquer parte da transação falhar, todo o resto também falha.

### Consistência
A consistência garante que uma transação leve o banco de dados de um estado válido para outro estado válido, respeitando todas as regras definidas, como chaves primárias, integridade referencial, etc

### Isolamento
* O isolamento garante que as transações sejam executadas de forma isolada, sem que as operações de uma transação afetem as 
operações de outra. O nível de isolamento pode variar, afetando a visibilidade das mudanças feitas por transações concorrentes
* As operações são isoladas, acontece uma por vez

### Durabilidade
* A durabilidade garante que, uma vez que uma transação éconfirmada (committed), ela permanecerá no banco de dados,mesmo que ocorra uma falha no sistema. Os dados serão persistidosno armazenamento.
* O Banco não guarda estados anteriores
* A vantagem da transação é que ele pode mostrar como que vai ficar o UPDATE/INSERT e escolher no final dela se tu escolhe fazer a transação, ou voltar para a versão original

## O comando TRANSACTION
É utilizado para gerenciar uma sequência de operações (transações)no banco de dados, garantindo que essas operações sejam executadas de maneira segura e consistente

## Para que serve uma transação?
* Garantir integridade e consistência dos dados:
* Reverter alterações em caso de erro:
* Controlar múltiplas operações simultâneas:
* Garantir integridade e consistência dos dados:
* Reverter alterações em caso de erro: Se ocorrer um errodurante qualquer uma das operações de uma transação, você pode reverter todas as operações feitas até o momento, evitando deixar o banco de dados em um estado inconsistente.
* Controlar múltiplas operações simultâneas:
* Garantir integridade e consistência dos dados:
* Reverter alterações em caso de erro:
* Controlar múltiplas operações simultâneas: Em ambientes com múltiplos usuários e processos, transações ajudam a isolar as operações e prevenir problemas como "leituras sujas" ou "atualizações perdidas".

## Comandos Relacionados a Transações
* BEGIN TRANSACTION: Inicia uma nova transação
* COMMIT TRANSACTION: Confirma a transação, aplicando permanentemente todas as operações feitas no banco de dados.
* ROLLBACK TRANSACTION: Desfaz todas as operações realizadas desde o inícioda transação.
* SAVEPOINT: Define um ponto dentro de uma transação para permitir um rollbackparcial, até esse ponto
```sql
BEGIN TRANSACTION;
“Bloco’’
IF @@ERROR <> 0
    ROLLBACK TRANSACTION;
ELSE
    COMMIT TRANSACTION;
```
