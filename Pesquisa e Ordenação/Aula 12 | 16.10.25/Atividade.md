# ATIVIDADE
### 1) Refatorar o código paraque ele não aceite números replicados
### 2) Refatorar o código para que possa busca um número, informando sua posição na tabela
### 3) Refatorar o código para buscar e remover um número

## Código Base
```java
package Hash;

import java.util.ArrayList;
import java.util.Scanner;

/*
--- ATIVIDADE
--- 1) Refatorar o código paraque ele não aceite números replicados
--- 2) Refatorar o código para que possa busca um número, informando sua posição na tabela
--- 3) Refatorar o código para buscar e remover um número
*/
class Util {

    public static int hash(int numero, int tamanho) {
        return numero % tamanho;
    }
}

public class HashFatorado {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        // Cria um vetor (array) de 10 posições, cada um será uma lista
        ArrayList<Integer>[] tabela = new ArrayList[10];

        // Inicia cada posição do vetor com uma nova lista
        for (int i = 0; i < tabela.length; i++) {
            tabela[i] = new ArrayList<>();
        }

        int numero, endereco;
        for (int i = 0; i < 5; i++) {
            System.out.println("Numero: ");
            numero = teclado.nextInt();

            // Calcular o endereço do número dentro da tabela para espalhamento
            endereco = Util.hash(numero, tabela.length);
            System.out.println("Endereco gerado: " + endereco);

            // Inserir o numero no endereco gerado
            tabela[endereco].add(numero);
        }

        // Exemplo: percorrendo o vetor e imprimindo o conteúdo
        for (int i = 0; i < tabela.length; i++) {
            System.out.println("Posicao " + i + ": " + tabela[i]);
        }
    }
}
```

## Código atividade
```java
package Hash;

import java.util.ArrayList;
import java.util.Scanner;

/*
--- ATIVIDADE
--- 1) Refatorar o código paraque ele não aceite números replicados
--- 2) Refatorar o código para que possa busca um número, informando sua posição na tabela
--- 3) Refatorar o código para buscar e remover um número
 */
class Util {

    public static int hash(int numero, int tamanho) {
        return numero % tamanho;
    }
}

public class HashFatorado {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        // Cria um vetor (array) de 10 posições, cada um será uma lista
        ArrayList<Integer>[] tabela = new ArrayList[10];

        // Inicia cada posição do vetor com uma nova lista
        for (int i = 0; i < tabela.length; i++) {
            tabela[i] = new ArrayList<>();
        }

        int numero, endereco;

        // Insere números na tabela sem permitir duplicados
        for (int i = 0; i < 5; i++) {
            System.out.print("Digite um numero: ");
            numero = teclado.nextInt();

            // Calcular o endereço do número dentro da tabela para espalhamento
            endereco = Util.hash(numero, tabela.length);

            // Verificar se o número já existe na lista
            if (!tabela[endereco].contains(numero)) {
                tabela[endereco].add(numero);
                System.out.println("Endereco gerado: " + endereco);
                System.out.println("Numero inserido com sucesso!");
            } else {
                System.out.println("Numero ja existe na tabela!");
            }

            System.out.println("");
        }

        // Mostrar tabela após inserção
        System.out.println("\nTabela apos inserir");
        for (int i = 0; i < tabela.length; i++) {
            System.out.println("Posicao " + i + ": " + tabela[i]);
        }

        // Buscar um numero
        System.out.println("\n-- BUSCANDO UM NUMERO --");
        System.out.print("Digite um numero para buscar: ");
        numero = teclado.nextInt();

        endereco = Util.hash(numero, tabela.length);
        if (tabela[endereco].contains(numero)) {
            System.out.println("Numero encontrado na posicao " + endereco);
        } else {
            System.out.println("Nunero nao encontrado");
        }

        // Remover numero
        System.out.println("\n-- REMOVENDO UM NUMERO --");
        System.out.print("Digite um numero para remover: ");
        numero = teclado.nextInt();

        endereco = Util.hash(numero, tabela.length);
        if (tabela[endereco].contains(numero)) {
            tabela[endereco].remove(Integer.valueOf(numero));
            System.out.println("Numero " + numero + "removido da tabela com sucesso");

            // Tabela após remoção
            System.out.println("\nTabela apos remocao");
            for (int i = 0; i < tabela.length; i++) {
                System.out.println("Posicao " + i + ": " + tabela[i]);
            }
        } else {
            System.out.println("Nao foi possivel remover o numero " + numero + ", pois ele nao se encontra na tabela");
        }
    }
}
```
