# Criando banco de dados
* Utilizaremos esse mesmo banco de dados até o final de semestre

## MySQL 8.0 Command Line Client
* Ativar serviço do windows MySQL80
* Senha: laboratorio

### Comandos / Exemplo
```sql
SHOW DATABASES;

CREATE DATABASE BDAula01;

USE BDAula01;

CREATE TABLE pessoa(
  id int AUTO_INCREMENT PRIMARY KEY,
  nome varchar(50) NOT NULL,
  sexo varchar(1) NOT NULL,
  idioma varchar(10) NOT NULL
  );

SHOW TABLES;

DESC pessoa;

INSERT INTO pessoa(nome, sexo, idioma)
  VALUES("Eric", "M", "Português");

SELECT * FROM pessoa;

INSERT INTO pessoa(nome, sexo, idioma)
  VALUES
  ("Vanessa", "F", "Inglês"),
  ("Luiza", "F", "Espanhol"),
  ("Frazzon", "M", "Francês"),
  ("João", "M", "Alemão"),
  ("Bernardo", "M", "Holandês");
```

## BANCO DE DADOS
```sql
CREATE DATABASE escola;

USE escola;

CREATE TABLE alunos (
  id int AUTO_INCREMENT PRIMARY KEY,
  nome varchar(50) NOT NULL,
  idade int NOT NULL,
  curso varchar(50) NOT NULL);

DESC alunos;

INSERT INTO alunos (nome, idade, curso)
  VALUES
  ("Ricardo", 40, "Matemática"),
  ("Eduardo", 20, "Sistemas de Informação"),
  ("Raquel", 23, "Biomedicina"),
  ("Bruno", 25, "Ciência da Computação");

CREATE TABLE professores (
  id int AUTO_INCREMENT PRIMARY KEY,
  nome varchar(50) NOT NULL,
  idade int NOT NULL,
  disciplina varchar(50) NOT NULL);

DESC professores;

INSERT INTO professores (nome, idade, disciplina)
  VALUES
  ("Prof. Mario", 35, "Matemática"),
  ("Prof. Augusto", 40, "História"),
  ("Prof. Ricardo", 38, "Sistemas de Informação");

SELECT * FROM professores;

CREATE TABLE matriculas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_aluno INT,
  id_professor INT,
  data_matricula DATE,
  FOREIGN KEY (id_aluno) REFERENCES alunos(id),
  FOREIGN KEY (id_professor) REFERENCES professores(id)
  );

DESC matriculas;

INSERT INTO matriculas (id_aluno, id_professor, data_matricula)
  VALUES
  (1, 1, "2023-01-15"),
  (2, 2, "2023-02-20"),
  (3, 3, "2023-03-10"),
  (4, 1, "2023-04-05"),
  (5, 2, "2023-05-12");

SELECT * FROM matriculas;

SELECT nome, curso FROM alunos;

SELECT nome, disciplina FROM professores;
```

## CRIANDO PROJETO
* Java With Ant
* Java Application
* Name: Conexao

## Pacote Beans
### Classe Pessoa
```sql
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;

/**
 *
 * @author laboratorio
 */
public class Pessoa {

    private int id;
    private String nome;
    private String sexo;
    private String idioma;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

}
```

## Pacote DAO
### Classe PessoaDAO
```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Beans.Pessoa;
import conexao.Conexao;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;

/**
 *
 * @author laboratorio
 */
public class PessoaDAO {

    private Conexao conexao;
    private Connection conn;

    public PessoaDAO() {
        this.conexao = new Conexao();
        this.conn = this.conexao.getConexao();
    }

    public void inserir(Pessoa pessoa) {
        String sql = "INSERT INTO pessoa (nome, sexo, idioma) VALUES (?, ?, ?);";

        try {
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, pessoa.getNome());
            stmt.setString(2, pessoa.getSexo());
            stmt.setString(3, pessoa.getIdioma());

            stmt.execute();

        } catch (SQLException ex) {
            System.out.println("Erro ao inserir pessoa: " + ex.getMessage());
        }
    }
}
```
## Pacote Conexao
## Classe conexao
```java
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
```

## Pacote ProgramaEscola
### Classe ProgramaEscola
```java
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
```
