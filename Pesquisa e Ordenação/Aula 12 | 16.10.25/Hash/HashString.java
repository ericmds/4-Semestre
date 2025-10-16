/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Hash;

import java.util.HashSet;
import java.util.Scanner;

/**
 *
 * @author laboratorio
 */
public class HashString {

    public static void main(String[] args) {

        Scanner teclado = new Scanner(System.in);
        HashSet<String> tabela = new HashSet<String>();

        String frase;
        int endereco;

        for (int i = 0; i < 5; i++) {
            System.out.println("Frase ");
            frase = teclado.nextLine();
            endereco = frase.hashCode();
            System.out.println("Frase: " + frase + ". Endereco: " + endereco);

            if (!tabela.add(frase)) {
                System.out.println("Numero ja inserido " + frase + ". Endereco: " + endereco);
            }
        }

        for (String item : tabela) {
            System.out.println(item);
        }
    }
}
