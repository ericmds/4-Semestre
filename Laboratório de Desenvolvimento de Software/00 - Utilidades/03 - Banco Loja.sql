CREATE DATABASE loja;
USE loja;

CREATE TABLE categoria (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  quantidade INT NOT NULL,
  categoria_id INT,
  FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

DESC categoria;
DESC produtos;
