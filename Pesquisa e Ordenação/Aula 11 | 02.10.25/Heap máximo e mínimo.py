class Ordenacao:
    @staticmethod
    def em_heap_maximo(lista):
        i = 0
        while (i * 2 + 1 < len(lista)): # O i precisa ser menor que o FE - no for classico seria (for; i*2+1 <= len(lista))
            fe = i * 2 + 1
            fd = i * 2 + 2
            if (lista[i] < lista[fe]):
                return False
            
            if (fd < len(lista)):
                if (lista[i] < lista[fd]):
                    return False
                
            i += 1
        
        return True
    
    @staticmethod
    def em_heap_minimo(lista):
        i = 0
        while (i * 2 + 1 < len(lista)):
            fe = i * 2 + 1
            fd = i * 2 + 2
            if (lista[i] > lista[fe]):
                return False
            
            if (fd < len(lista)):
                if (lista[i] > lista[fd]):
                    return False
            
            i += 1
        
        return True
    
    @staticmethod
    def verificar_tipo_heap(lista):
        eh_maximo = Ordenacao.em_heap_maximo(lista)
        eh_minimo = Ordenacao.em_heap_minimo(lista)

        if eh_maximo and not eh_minimo:
            print("É heap máximo")
        elif eh_minimo and not eh_maximo:
            print("É heap mínimo")
        elif eh_maximo and eh_minimo:
            print("É um heap mínimo e máximo")
        else:
            print("Não é um heap mínimo nem máximo")

    
def main():
    # Filho esquerda (fe) = raiz * 2 + 1
    # Filho direita  (fd) = raiz * 2 + 2

    # ------------- EXEMPLO AULA -------------
    print("\n --- EXEMPLO DO HEAP EM AULA ---\n")

    lista = [8, 3, 6, 1, 5, 2, 7, 4]

    print("Lista original: ", lista)
    
    if (Ordenacao.em_heap_maximo(lista)):
        print("Em heap maximo")
    else:
        print("Não está em heap máximo")

    if (Ordenacao.em_heap_minimo(lista)):
        print("Está em heap mínimo")
    else:
        print("Não está em heap mínimo")

    print("\n --- TESTANDO HEAPS ---\n")

    exemplos = {
        "Heap máximo": [9, 7, 6, 5, 3, 2],
        "Heap mínimo": [1, 3, 5, 7, 9],
        "Não heap": [4, 10, 3, 5, 1],
        "Ambos (elementos iguais)": [5, 5, 5, 5],
        "Lista vazia": [],
        "Lista com 1 elemento": [42]
    }

    for nome, lista in exemplos.items():
        print(f"{nome}: {lista}")
        Ordenacao.verificar_tipo_heap(lista)
        print()

if __name__ == '__main__':
    main()
