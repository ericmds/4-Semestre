# Restrições de Integridade
* Integridade é a manutenção e garantia da consistência e precisão dos dados, ela é atingida por meio da aplicação de restrições de Integridade
* As restrições podem ser Declarativa ou Procedural

## Declarativa
* Na forma declarativa, as restrições são parametrizadas DURANTE A CRIAÇÃO DAS TABELAS, utilizando a liguagem SQL, na categoria DDL (Data Definition Language)
* Chaves primárias, valores não nulos, tipos e domínios de dados, regras de integridade referencial são exemplos de Restrições de Integridade Declarativa

## Procedural
* Na forma procedural, é possível fazer o uso de gatilhos (TRIGGERS), procedimento armazenados (PROCEDURES), bem como de afirmações (ASSERTION). Geralmente a forma procedural é implementada por programadores no SGBD, com o auxílio das regras de ngócios passadas pelos clientes

## Principais Restrições de Integridade
* Integridade de Domínio
* Integridade Referencial
* Integridade de Vazio
* Integridade de Chave
* Integridade Definida pelo Usuário

### Integridade de Domínio
* Quando um tipo é definido a um campo, por exemplo int, esse campo é restrangido a possuir somente valores inteiros
* Valores inseridos em uma coluna devem sempre obedecer à definição dos valores permitidos
* Fatores
  * Tipo de Dado do Campo
  * Representação interna do tipo de ado
  * Presença ou não do dado
  * Intervalos de valores no domínio
  * Conjunto de valores discretos

### Integridade Referencial
* Assegura que valores de uma coluna em uma tabela são álidos baseados nos valores em um outra tabela relacionada
* Exemplo: Se um produto com ID 123 foi cadastrado em uma tabela de Vendas, então um prodto com ID 123 deve existir na tabela de Produtos relacionadas
#### Atualização e Exclusão
* **CASCADE:** se um registro for excluído em uma tabela (operações DELETE e TRUNCATE), então os registros relacionados em outras tabelas que o referenciam talvez precisem ser excluídos. Caso contrário ocorrera erro. O mesmo se dá com a atualização de registros (UPDATE)
  * on delete cascade;
  * on update cascade;
    * quando utilizado, e um item for atualizado, vai atualizar de todos os outros relacionados

### Integridade de Vazio
* Informa se a coluna é obrigatória ou opcional, ou seja, se é possível não inserir um valor na coluna (campo)
* Uma coluna de chave primária, por exemplo, sempre deve ter dados inseridos, e nunca pode estar vazia para nenhum registro
#### Valores Nulos (NULL)
* Um valor NULL significa que não existem dados,
* É diferente de zero, espaço, string vazia ou tabulação
* Os nulos podem sem problemáticos, pois indicam
  * O valor da coluna não é apropriado
  * O valor não foi especificado
  * O valor é desconhecido

 ### Integridade de Chave
* Valores inseridos na coluna de chave primária (PK) devem ser sempre únicos, não permitindo repetições nesses valores
* Dessa forma, registros serão sempre distintos
* Os valores de chave primaria também não podem ser nulos

#### Integridade de Entidade
* Essa forma de restrição afirma que nenhum valor de chave primária (PK) pode ser NULL, pois o seu valor é utilizado para identificar tuplas individuais em uma tabela

### Integridade Definidade pelo Usuário
* Permite o usuário definir regras comerciais que não se encaixam em outras categorias de integridade
* Todas as cateorias de integridade oferecem suporte à integridade definida pelo usuário
* Esta integridade se refere a regras de negócio específicas que são definidas pelo usuário
* Por exemplo, pode definir que uma coluna aceitará um conjunto restrito de valores

### Integridade da Coluna
* Determina os valores aceitos para a respectiva coluna
