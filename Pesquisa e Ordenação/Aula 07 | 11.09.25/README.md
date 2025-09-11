# Quicksort e Mergesort | Características Clássicas/Comum
* Utilizam o princípio "dividir para conquistar"
* Utilizam recursão
  * Recursão é a chamada do próprio método
  * Vantagem: Simplicidade no código
  * Desvantagem: Consumo excessivo de Memória RAM
  * A cada processo de recursão, tanto o Quicksort quanto o Mergesort dividem o vetor/estrutura como se fossem folhas de uma árvore

## Quicksort
* C# implemente seu sort com ele
* Usa uma variável chamada PIVO para dividir/repartir (recursivo), em que os menores devem estar a sua esquerda, enquanto os maiores a sua direita
  * inicio:
  * fim: tamanho do vetor -1, pois precisa retornar a menor 
  * PIVO: recomenda-se ser sempre a primeira posição
```
POSIÇÕES   | 0  | 1  |  2 |  3 |  4 |  5 |  6 |  7 |  8 |
 TROCA 1   | 30 | 90 | 10 | 20 | 80 | 10 | 20 | 40 | 10 |      ini = 0, fim = 8, pivo = 0/30
 TROCA 2   | 10 | 90 | 10 | 20 | 80 | 10 | 20 | 40 | 30 |      ini = 1, fim = 8, pivo = 8/30
 TROCA 3   | 10 | 30 | 10 | 20 | 80 | 10 | 20 | 40 | 90 |      ini = 1, fim = 7, pivo = 1/30
 TROCA 4   | 10 | 20 | 10 | 20 | 80 | 10 | 30 | 40 | 90 |      ini = 4, fim = 6, pivo = 6/30
 TROCA 5   | 10 | 20 | 10 | 20 | 30 | 10 | 80 | 40 | 90 |      ini = 4, fim = 5, pivo = 4/30
 TROCA 6   | 10 | 20 | 10 | 20 | 30 | 10 | 80 | 40 | 90 |      ini = 4, fim = 5, pivo = 4/30
 TROCA 7   | 10 | 20 | 10 | 20 | 10 | 30 | 80 | 40 | 90 |      ini = 5, fim = 5, pivo = 5/30
 RECURSÃO                           | 30 |
 RECURSÃO  | 10 | 20 | 10 | 20 | 10 |     ini = 0, fim = 4, pivo = 0/10
 RECURSÃO  | 10 |
 RECURSÃO       | 20 | 10 | 20 | 10 |     ini = 1, fim = 4, pivo = 1/20
 RECURSÃO       | 10 | 10 | 20 | 20 |     ini = 1, fim = 4, pivo = 1/20
```
## Mergesort
* Java implementa seu sort com ele
* Usa 3 variáveis
  * ini: marca o lado esquerdo
  * fim: marca o lado direto
  * meio:

## Heapsort
