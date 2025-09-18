# Revisão

## 1) O que é ordenação e por que é importante ordenar estruturas de dados?
* Ordenar é organizar uma estrutura de dados, seja ela em ordem crescente ou decrescente, seja por nome ou numeração, seja usando uma ou mais chaves de controle ou variáveis.
* Ordenar uma estrutura de dados é importante pois torna a busca ou a pesquisa dos dados mais eficientes, devido aos algoritmos baseados em árvores. Ordenar gera eficiência na manipulação de dados, inserção, deleção, principalmente na busca por dados.

## 2) Dos vários algoritmos de ordenação, há categorias que os classifica, como: estabilidade e complexidade
### Explique o que é estabilidade e complexidade. Se necessário, dar exemplos. Quais os métodos estudados que são estáveis e quais que são instáveis
#### Estabilidade
A estabilidade do algoritmo pode ser classificada em estável ou instável.
* Estável é quando o processo de ordenação SEMPRE garante a ordenação temporária da estrutura, em geral o maior elemento vai sendo deslocado para o final até a lista ser ordenada.
* Instável é o processo de ordenação que não garante a ordenação temporária da estrutura, sendo adequado para listas feitas em C e C++ com alocação dinâmica de memória.
#### Complexidade
A complexidade é a quantidade de esforço computacional, como tarefa, rotina, método envolvido no algoritmo de ordenação. Ela é medida pela quantidade de comparações e trocas realizadas durante a ordenação. A complexidade pode ser subdividida em categorias, algumas delas são, da menos eficiente para a mais eficiente:
* Complexidade fatorial (O(n!))
* Complexidade polinomial (O(n^k))
* Complexidade linear (O(n))
* Complexidade logarítmica (O(log(n)))

Dos métodos já estudados que são estáveis são:
* Bolha
* Inserção
* Agitação

Já os que são instáveism são
* Seleção
* Pente
* Shell

## 3) Dos métodos estudados, quais suas complexidades? Como é avaliada a complexidade de um método de ordeanação?
A complexidade de um método de ordenação é medida pela quantidade de comparações e trocas realizadas na ordenação. Dos métodos já estudados, os que possuem complexidade quadrática (O(n²)) são: bolha, seleção, inserção, agitação, pente e shell.

## 4) Dos métodos estudados, qual o melhor método de ordenação?
O melhor método de ordenação depende de como está a lista. Para escolher o método mais adequado é preciso levar em consideração o tamanho da estrutura e o quanto dela já está ordenado.

## 5) Faça um método na sua linguagem de preferência que retorne true/True se a lista enviada como parâmetro está ordenada, o false/False caso contrário
```py
def esta_ordenado(lista):
    for i in range(len(lista) - 1):
        if lista[i] > lista[i+1]:
            return False
    return True
```
## 6) Da a sequência de valores na estrutura abaixo, contabilize quantas comparações e quantas trocas há para os métodos: bolha, pente, seleção
```
0   1   2   3   4   5   6   7   8
30  90  10  20  80  10  20  40  10 
```
### Bolha - Com para os dois primeiros, se e maior troca e incrementa mais um, fica repetindo
```
00  01  02  03  04  05  06  07  08
----------------------------------
30  10  20  80  10  20  40  10  90
10  20  30  10  20  40  10  80  90
10  20  10  20  30  10  40  80  90
10  10  20  20  10  30  40  80  90
10  10  20  10  20  30  40  80  90
10  10  10  20  20  30  40  80  90
```

### Pente - Pegao tamanho da lista e divida por 1.3 e vai diminuindo ate virar bolha
```
00  01  02  03  04  05  06  07  08
----------------------------------
30  10  20  80  10  20  40  10  90  DIST = 6 | (30, 40) → ok | (10, 10) → ok | (20, 90) → ok
30  10  20  80  10  20  40  10  90  DIST = 4 | (30, 10) → troca | (10, 20) → ok | (20, 40) → ok | (80, 10) → troca | (30, 90) → ok
10  10  20  10  30  20  40  80  90  DIST = 3 | SEM TROCA
10  10  20  10  30  20  40  80  90  DIST = 2 | SEM TROCA 
10  10  20  10  30  20  40  80  90  DIST = 1 | VIRA BUBBLE SORT
10  10  10  20  20  30  40  80  90


```
### Seleção - Divide a lista em duas partes: ordenada (esquerda) e não ordenada (direita).
```
00  01  02  03  04  05  06  07  08  OLHA A LISTA NAO ORDENADA (DIREITA) E PROCURA O MENOR ELEMENTO PARA COLOCAR NA ESQUERDA
----------------------------------
30  10  20  80  10  20  40  10  90  Menor = 10(p1) → Troca com o primeiro (30)
10| 30  20  80  10  20  40  10  90  Menor = 10(p3) → Troca com o 30
10  10| 20  80  30  20  40  10  90  Menor = 10(p7) → Troca com o 20
10  10  10| 80  30  20  40  20  90  Menor = 20(p5) → Troca com o 80
10  10  10  20| 30  80  40  20  90  Menor = 20(p7) → Troca com o 30
10  10  10  20  20| 80  40  30  90  Menor = 30(p7) → Troca com o 80
10  10  10  20  20  30| 40  80  90  Menor = 40(p6) → Já esta no lugar
10  10  10  20  20  30  40| 80  90  Menor = 80(p7) → Já esta no lugar

```
* Bolha → 56 comparações, 20 trocas
* Pente → ~ 24 comparações, 9 trocas
* Seleção → 36 comparações, 6 trocas

## 7) Na sua linguagem de preferência, implemente (sem consulta) seu método escolhido para saber.
### Bolha (Java)
```java
public static void bubbleSort(int[] v) {
    for (int i = v.length - 1; i > 0; i--) {
        int changes = 0;

        for (int j = 0; j < i; j++) {
            if (v[j] > v[j + 1]) {
                int temp = v[j];
                v[j] = v[j + 1];
                v[j + 1] = temp;
                changes++;
            }
        }

        if (changes == 0) {
            break;
        }
    }
}
```

## Como ordenar pela segunda ou terceira chave
* Exemplo uma lista de Alunos(codigo, curso, nome) - ordenar por curso e ordenar por nome
```py
class Aluno:
    def __init__(self,nome, curso):
        self.nome = nome
        self.curso = curso
    def __str__(self):
        return f"Nome: {self.nome}. Curso: {self.curso} "

lista = []
for i in range(4):
    nome = input('Digite o nome: ').upper()
    curso = input('Digite o curso: ').upper()

    lista.append(Aluno(nome, curso))

ordenacao_por_curso_e_nome = sorted(lista, key=lambda aluno: (aluno.curso, aluno.nome))

for i in ordenacao_por_curso_e_nome :
    print(i)
```
# Exercício
## Fazer o exemplo acima, só que ao invés de usar o sort utilizar um dos métodos de ordenação, usando como chave de ordenação 1 o nome do curso e como chave de ordenação 2 o nome do aluno.
