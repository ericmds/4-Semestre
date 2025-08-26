/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author laboratorio
 */
public class Conexao {

    public Connection getConexao() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdaula01?useTimeZone=true&serverTimezone=UTC", "root", "laboratorio");
            System.out.println("Conexao com o Banco de Dados realizada com sucesso!");
            return conn;
            
        } catch (SQLException ex) {
            System.out.println("Erro ao conectao ao Banco de Dados" + ex.getMessage());
            return null;
        }
    }
}
