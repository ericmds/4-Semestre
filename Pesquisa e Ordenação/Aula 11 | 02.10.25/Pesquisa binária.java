import java.util.ArrayList;
import java.util.List;

class Util {
    public static int pesquisaBinaria(int numero, ArrayList<Integer> lista) {
        int ini = 0;
        int fim = lista.size();
        int meio;

        while (ini <= fim) {
            meio = (int)(ini + fim)/2;
            if (numero == lista.get(meio)) {
                return meio; // localizado
            }
            if (numero < lista.get(meio)) {
                fim = meio - 1;
            } else {
                ini = meio + 1;
            }

        }

        return -1;
    }
}

public class Principal {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<Integer>(List.of(9, 7, 3, 2, 9, 1, 1, 6, 7, 4, 14));

        System.out.println("Lista original... " + lista);
        System.out.println(lista.indexOf(14)); // Lista sequencial

        lista.sort(null); 
        // i = 0    1   2   3   4   5   6   7   8   9   10  -   Numero vetificado 14
        //     1    1   2   3   4   6   7   7   9   9   14  -   7 é maior que 14? Não, pega o meio da lista e verifica se é menor ou maior que o 14
        //     7   7   9   9   14                           -   9 é maior que 14? Não, pega a metade da lista restante 
        //     9   14                                       -   14 achou o número
        //    14


        System.out.println("Lista ordenada... " + lista);
        System.out.println(Util.pesquisaBinaria(14, lista)); // Busca binária

    }
    
}
