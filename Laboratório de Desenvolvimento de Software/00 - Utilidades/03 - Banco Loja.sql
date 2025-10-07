CREATE DATABASE produtos;
USE produtos;

CREATE TABLE categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  preco float NOT NULL,
  quantidade INT NOT NULL,
  categoria_id INT NOT NULL,
  FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

DESC categorias;
DESC produtos;
