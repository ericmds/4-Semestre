/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ProgramaEscola;

import Beans.Pessoa;
import DAO.PessoaDAO;
import conexao.Conexao;

/**
 *
 * @author laboratorio
 */
public class ProgramaEscola {

    public static void main(String[] args) {
        /* Conexao con = new Conexao();
        con.getConexao(); */

        Pessoa p = new Pessoa();
        p.setNome("Anna Luiza");
        p.setSexo("F");
        p.setIdioma("Japonês");

        PessoaDAO pDAO = new PessoaDAO();
        pDAO.inserir(p);
    }
}
