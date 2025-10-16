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
class Aluno {

    int matricula;
    String nome;

    public Aluno(int matricula, String nome) {
        this.matricula = matricula;
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Aluno{" + "matricula=" + matricula + ", nome=" + nome + '}';
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 67 * hash + this.matricula;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Aluno other = (Aluno) obj;
        return this.matricula == other.matricula;
    }

}

public class HashString2 {

    public static void main(String[] args) {

        Scanner teclado = new Scanner(System.in);
        HashSet<Aluno> tabela = new HashSet<Aluno>();

        String nome;
        int matricula;
        int endereco = 0;

        Aluno aluno;

        for (int i = 0; i < 5; i++) {
            System.out.println("Nome: ");
            nome = teclado.nextLine();
            System.out.println("Matricula: ");
            matricula = teclado.nextInt();
            aluno = new Aluno(matricula, nome);

            endereco = aluno.hashCode();

            System.out.println("Aluno: " + aluno + ". Endereco: " + endereco);

            if (!tabela.add(aluno)) {
                System.out.println("Aluno ja inserido " + aluno + ". Endereco: " + endereco);
            }
            teclado.nextLine();
        }
        System.out.println("\nMostrando a tabela..");

        for (Aluno item : tabela) {
            System.out.println(item);
        }
    }
}
