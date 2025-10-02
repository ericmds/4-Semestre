# Exercício
* Fazer uma função que retorne True se a lista está em heap máximo
* Fazer um programa que
  * Armazene milhões de números inteiros ou pouco repeidos (desordenados)
  * Localize o menor número gerado
  * Temporize esse processamento
  * Contabilize o número de comparações

```py
import random
import time

def gerar_lista(grandeza=10_000_000, max_distintos=1000):
    """
    Gera uma lista de milhões de números, com poucos repetidos.
    """
    base = [random.randint(-1_000_000, 1_000_000) for _ in range(max_distintos)]
    lista = [random.choice(base) for _ in range(grandeza)]
    return lista

def encontrar_menor(lista):
    comparacoes = 0
    menor = lista[0]

    for i in range(1, len(lista)):
        comparacoes += 1
        if lista[i] < menor:
            menor = lista[i]
    
    return menor, comparacoes

def main():
    print("Gerando lista com 10 milhões de elementos...")
    lista = gerar_lista()

    print("Iniciando busca pelo menor elemento...")
    inicio = time.time()

    menor, comparacoes = encontrar_menor(lista)

    fim = time.time()
    tempo = fim - inicio

    print(f"\nMenor número encontrado: {menor}")
    print(f"Tempo de execução: {tempo:.4f} segundos")
    print(f"Número de comparações: {comparacoes}")

if __name__ == '__main__':
    main()

```

# Próximo conteúdo
## Pesquisa sequencial e pesquisa binária
## Pesquisa digital
