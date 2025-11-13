# Tipos de Árvores B
  * Árvores B
  * Árvores B+
  * Árvores ++

## Aplicação
* Pesquisa em memória
* Nos nós, não há dados diretamente, mas sim listas encadeadas
* Árvore equilibrada e com baixa profundidade
* Agilidade no acesso a dados ou chaves
  * Preferem árvores rasas, para otimizar a pesquisa
* Utilizadas em coleções de páginas

## Conceitos: Ordem
* A ordem de uma árvore B está relacionada ao número de descendentes de um nó
  * Número de ponteiros para os nós filhos
* Por exemplo, em uma árvore B de ordem m:
  * O número máximo de chaves por nó é m - 1.
  * Em uma árvore B de ordem 5, cada nó pode ter no máximo 4 chaves.

## Processo de Divisão (Split)
* A divisão de uma página ocorre durante a inserção
* Os nós são divididos igualmente entre as páginas
* O número mínimo de chaves em um nó é
  * (m/2) - 1, exceto para a raiz, que tem regras especiais

## Inserção
* Sempre ocorre em nós folhas
* A divisão (split) será acionada quando a página exceder o número máximo de chaves ou dados
