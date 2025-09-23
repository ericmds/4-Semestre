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

CREATE TABLE veiculo(
    id int AUTO_INCREMENT PRIMARY KEY,
    modelo varchar(30),
    placa varchar(7),
    id_pessoa int not null,
    foreign key(id_pessoa) references pessoa(id)
    );
