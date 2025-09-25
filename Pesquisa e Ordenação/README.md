# HeapSort
É um método baseado na dinâmica de árvores binárias, mas em lista
```
i = |  1 |  2 |  3 |  4 |  5 |  6 |  7 |
    |----|----|----|----|----|----|----|
    | 15 | 07 | 04 | 08 | 12 | 01 | 03 | - Olha a primeira posição i=1 (n=15) compara com a posição 2x depois dela i=3 (n = 4. É maior? Se sim, troca. O 4 fica no i=1 e o 15 i=3. Agora compara se o 4 é maior que o numero na na posição i=4, se for troca se,
    | 04 | 07 | 01 | 03 | 15 | 12 | 08 |   se não for passa para a proxima posição i=2. Vai repetindo isso até nao ter números filhos a direita
    
```
