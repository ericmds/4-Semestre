# Tipos de Árvores B
  * Árvores B
  * Árvores B+

# Árvores B
## Aplicação
### Pesquisa em memória
Usadas para armazenar e acessar dados de forma eficiente, tanto em memória principal quanto em armazenamento em disco

### Nos nós, não há dados diretamente, mas sim listas encadeadas
Nos nós da árvore B, não há dados diretamente, mas sim chaves que são usadas para direcionar buscas, e os dados podem estar em listas encadeadas (ou páginas) fora da árvore

### Árvore equilibrada e com baixa profundidade
A árvore B é balanceada, o que significa que todas as folhas estão no mesmo nível. Isso resulta em uma profundidade baixa, permitindo buscas rápidas

### Agilidade no acesso a dados ou chaves
Como as árvores B são balanceadas e têm alta fanout (muitos filhos por nó), elas favorecem árvores rasas e rápidas em buscas.

### Utilizadas em coleções de páginas
Muito utilizadas em sistemas de arquivos e bancos de dados, onde as chaves apontam para páginas de dados ou registros.

## Conceitos: Ordem
* A ordem de uma árvore B está relacionada ao número de descendentes (filhos) que cada nó pode ter
  * Em uma árvore B de ordem m, cada nó pode ter no máximo m - 1 chaves e m ponteiros para filhos
  * Exemplo: Em uma árvore B de ordem 5, cada nó pode ter no máximo 4 chaves e até 5 filhos

## Processo de Divisão (Split)
* Divisão de um nó ocorre quando ele excede a capacidade máxima de chaves
  * Durante a inserção, se um nó estiver cheio (contiver o número máximo de chaves), ele será dividido em dois nós, com a chave média sendo promovida para o nó pai
* Os nós são divididos igualmente entre as páginas
  * Exceção: a raiz tem regras especiais e pode ter menos chaves do que os outros nós.
* Número mínimo de chaves em um nó:
  * O número mínimo de chaves por nó é dado por $\frac{m}{2}$, exceto para a raiz, que pode ter menos (geralmente entre 1 e $m-1$ chaves)

## Inserção
* A inserção sempre ocorre nas folhas da árvore
  * A chave é inserida no nó folha adequado, e se o nó estiver cheio, ocorre uma divisão (split) do nó
* Divisão (split)
  * Se a inserção de uma chave causar a superlotação de um nó (o nó tem mais de $m-1$ chaves), o nó será dividido, e a chave intermediária será promovida para o nó pai. Esse processo pode ser recursivo e afetar os nós acima, até a raiz, que também pode ser dividida

## Exemplo: Árvore B (de ordem 3, t = 2)
* Cada nó pode ter até 3 chaves e 4 filhos
#### Inserindo 10, 20 e 30
```
[10, 20, 30]
```
#### Inserindo 25
[10, 20, **25**, 30] - Ao inserir o 25 o nó fica cheio, é necessário dividir
```
   [20]
  /     \
[10]  [25, 30]
```
#### Inserindo 5
```
      [20]
   /        \
[5, 10]  [25, 30]
```

#### Inserindo 35
* Se inserirmos a chave **35**, ela vai para o nó da direita, que já está cheio
  * [25, 30, **35**]
* O nó é dividido, e a chave **30** sobe para a raiz
* Ficando assim
```
   [20, 30]
   /       \
[5, 10] [25, 35]
```
