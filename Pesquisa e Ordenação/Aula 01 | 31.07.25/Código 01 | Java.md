# Código em java
* Popular uma lista com números aleatórios, de tamanho flexível e números vindos de arquivos ou sorteados
* Toda programação tem que ser orientada a objeto

## Classe Util
```java
package Codigo01;
// Para realizar a documentação em java é só usar /***

import java.util.ArrayList;
import java.util.Random;

public class Util {
    
    /***
     * Método estático que popula uma lista de números inteiros com valores aleatórios
     * @param lista estrutura de armanezamento dos números
     * @param quantidade de números a serem gerados
     * @param inicio valor inicial da extensão do número gerado
     * @param fim valor final da extensão do número gerado
     */
    public static void popularAleatorioNumeros(ArrayList<Integer> lista, long quantidade, int inicio, int fim) {
        Random gerador = new Random();
        for(; quantidade > 0; quantidade--) {
            lista.add(gerador.nextInt(inicio, fim));
        }
    }
    
    /***
     * Método estático que gera palavras aleatórias
     * @param lista armazena as palavras geradas
     * @param quantidade de palavras a serem geradas
     * @param tamanhoPalavra das palavras a serem geradas
     */
    public static void popularAleatorioPalavras(ArrayList<String> lista, long quantidade, int tamanho) {
        String letras = "abcdefghijklmnopqrstuvwxyz ";
        Random gerador = new Random();
        
        for(; quantidade > 0; quantidade--) {
            String palavraGerada = "";
            char letraSorteada;
            for(int i = 0; i < tamanho; i++) {
                letraSorteada = letras.charAt(gerador.nextInt(letras.length() ) );
                palavraGerada = palavraGerada + letraSorteada;
            }
            
            lista.add(palavraGerada);
        }
    }
    
    /***
     * Método estático que exibe uma lista de números inteiros
     * @param lista contendo números inteiros
     */
    public static void exibirListaNumeros(ArrayList<Integer> lista) {
        for(Integer item : lista) {
            System.out.println(item);
        }
    }
    
    /***
     * Método estático que exibe uma lista de palavras
     * @param lista contendo palavras
     */
    public static void exibirListaPalavras(ArrayList<String> lista) {
        for(String item: lista) {
            System.out.println(item);
        }
    }
}
```

## Classe Principal
```java
package Codigo01;

import java.util.ArrayList;

public class Principal {
    public static void main(String[] args) {
        ArrayList<Integer> listaNumeros = new ArrayList<>();
        ArrayList<Integer> lista2Numeros = new ArrayList<>();
        ArrayList<String> listaPalavaras = new ArrayList<>();
        
        Util.popularAleatorioNumeros(listaNumeros, 10, 100, 500);
        Util.exibirListaNumeros(listaNumeros);
        
        lista2Numeros.addAll(listaNumeros); // addAll: Fazer uma cópia da listaNumeros
        
        Util.popularAleatorioPalavras(listaPalavaras, 10 ,6);
        Util.exibirListaPalavras(listaPalavaras);
    }
}
```
