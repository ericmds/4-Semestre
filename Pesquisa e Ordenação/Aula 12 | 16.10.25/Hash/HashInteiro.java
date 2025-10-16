/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Hash;

import java.util.HashSet;
import java.util.Random;

/**
 *
 * @author laboratorio
 */
public class HashInteiro {

    public static void main(String[] args) {
        HashSet<Integer> tabela = new HashSet<Integer>();

        Random gerador = new Random();
        int numero;
        int endereco;

        for (int i = 0; i < 5; i++) {
            numero = gerador.nextInt(100);
            endereco = ("" + numero).hashCode();
            System.out.println("Numero: " + numero + ". Endereco: " + endereco);

            if (!tabela.add(numero)) {
                System.out.println("Número já inserido: " + numero + ". Endereco: " + endereco);
            }
        }

        System.out.println("");
        
        for (Integer item : tabela) {
            System.out.println(item);
        }
    }
}
