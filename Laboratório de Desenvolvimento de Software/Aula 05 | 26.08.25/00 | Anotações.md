# Criando banco de dados
* Utilizaremos esse mesmo banco de dados até o final de semestre

## MySQL 8.0 Command Line Client
* Ativar serviço do windows MySQL80
* Senha: laboratorio

### Comandos / Exemplo
```sql
SHOW DATABASES;;

CREATE DATABASE BDAula01;

USE BDAula01;

CREATE TABLE pessoa(
  -> id int AUTO_INCREMENT PRIMARY KEY,
  -> nome varchar(50) NOT NULL,
  -> sexo varchar(1) NOT NULL,
  -> idioma varchar(10) NOT NULL
  -> );

SHOW TABLES;

DESC pessoa;

INSERT INTO pessoa(nome, sexo, idioma)
  -> VALUES("Eric", "M", "Português");

SELECT * FROM pessoa;

INSERT INTO pessoa(nome, sexo, idioma)
  -> VALUES
  -> ("Vanessa", "F", "Inglês"),
  -> ("Luiza", "F", "Espanhol"),
  -> ("Frazzon", "M", "Francês"),
  -> ("João", "M", "Alemão"),
  -> ("Bernardo", "M", "Holandês");
```

### BANCO DE DADOS
```sql
CREATE DATABASE escola;

USE escola;

CREATE TABLE alunos(
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

CREATE TABLE professores(
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
```
