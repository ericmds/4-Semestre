## Util
```py
import random

class Util:
    """_summary_
        Classe responsável por métodos de gestão de listas de números inteiros e lista de palavras
    """
    
    @staticmethod
    def popular_aleatorio_numero(lista, quantidade, inicio, fim):
        """_summary_
            Método estático que popula uma lista de números inteiros com valores aleatórios
        Args:
            lista (int): estrutura de armanezamento dos números
            quantidade (int): de números a serem gerados
            inicio (int): valor inicial da extensão do número gerado
            fim (int): valor final da extensão do número gerado
        """
        for _ in range(quantidade):
            lista.append(random.randrange(inicio,fim) )
            
    @staticmethod
    def popular_aleatorio_palavras(lista, quantidade, tamanho):
        letras = "abcdefghijklmnopqrstuvwxyz "
        for _ in range(quantidade):
            palavra_gerada = ""
            letra_sorteada = ""
            for _ in range(tamanho):
                letra_sorteada = letras[random.randrange(len(letras))]
                palavra_gerada += letra_sorteada
        
            lista.append(palavra_gerada)
            
    @staticmethod
    def exibir_lista(lista):
        """Método estático que exibe uma lista de números inteiros ou de palavras

        Args:
            lista (int): contém números inteiros ou palavras
        """
        
        for item in lista:
            print(item)
        
        
```

## Principal
```py
from Util import Util

lista_numeros = []
lista2_numeros = []
lista_palavaras = []

Util.popular_aleatorio_numero(lista_numeros, 10, 100, 500)
Util.exibir_lista(lista_numeros)

lista2_numeros.extend(lista_numeros)

Util.popular_aleatorio_palavras(lista_palavaras, 10, 6)
Util.exibir_lista(lista_palavaras)
```
