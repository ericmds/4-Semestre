# Classe ICalculadora 
```java
package Exercicio02;

public interface ICalculadora {
    
    double somar(double n1, double n2);
    double subtrair(double n1, double n2);
    double multiplicar(double n1, double n2);
    double dividir(double n1, double n2);
    double raizQuadrada(double n1);
    double elevarPotencia(double n1, double n2);
    double logaritmo10(double n1);
}
```

# Classe Calculos
```java
package Exercicio02;

public class Calculos implements ICalculadora {

    @Override
    public double somar(double n1, double n2) {
        return n1 + n2;
    }

    @Override
    public double subtrair(double n1, double n2) {
        return n1 - n2;
    }

    @Override
    public double multiplicar(double n1, double n2) {
        return n1 * n2;
    }

    @Override
    public double dividir(double n1, double n2) {
        return n1 / n2;
    }

    @Override
    public double raizQuadrada(double n1) {
        return Math.sqrt(n1);
    }

    @Override
    public double elevarPotencia(double n1, double n2) {
        return Math.pow(n1, n2);
    }

    @Override
    public double logaritmo10(double n1) {
        return Math.log10(n1);
    }
}
```

#Classe Principal
```java
package Exercicio02;

import java.util.Scanner;

public class Principal {
    
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        Calculos c = new Calculos();
        int opcao;
        
        System.out.print("Infome o primeiro numero: ");
        double n1 = teclado.nextDouble();
        
        System.out.print("Infome o segundo numero: ");
        double n2 = teclado.nextDouble();
        
        do {
            System.out.println("\n--- MENU ---");
            System.out.println("1 - SOMAR");
            System.out.println("2 - SUBTRAIR");
            System.out.println("3 - MULTIPLICAR");
            System.out.println("4 - DIVIDIR");
            System.out.println("5 - RAIZ QUADRADA");
            System.out.println("6 - ELEVAR NA POTENCIA");
            System.out.println("7 - LOGARITMO BASE 10");
            System.out.println("0 - ENCERRAR");
            System.out.print("--- ESCOLHA UMA OPCAO: ");
            opcao = teclado.nextInt();
            
            switch (opcao) {
                case 1:
                    System.out.println("Resultado da soma de " + n1 + " + " + n2 + " = " + c.somar(n1, n2) );
                    break;
                case 2:
                    System.out.println("Resultado da subtracao de " + n1 + " - " + n2 + " = " + c.subtrair(n1, n2) );
                    break;
                case 3:
                    System.out.println("Resultado da multiplicacao de " + n1 + " * " + n2 + " = " + c.multiplicar(n1, n2) );
                    break;
                case 4:
                    if (n2 == 0) {
                        System.out.println("Impossivel realizar divisao por zero...");
                        break;
                    } else {
                    System.out.println("Resultado da divisao de " + n1 + " / " + n2 + " = " + c.dividir(n1, n2) );
                    break;
                    }
                case 5:
                    System.out.println("Resultado da raiz quadrada de " + n1 + " = " + c.raizQuadrada(n1) );
                    break;
                case 6:
                    System.out.println("Resultado da potencia de " + n1 + " ^ " + n2 + " = " + c.elevarPotencia(n1, n2) );
                    break;
                case 7:
                    System.out.println("Resultado do logaritmo base 10 de " + n1 + " = " + c.logaritmo10(n1) );
                    break;
                default:
                    System.out.println("OPCAO INVALIDA...");
            }
        } while (opcao != 0);
        
        teclado.close();
    }
}
```
