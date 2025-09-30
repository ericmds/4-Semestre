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

CREATE TABLE disciplina (
  id int AUTO_INCREMENT PRIMARY KEY,
  nome varchar(100) NOT NULL,
  carga_horaria INT NOT NULL,
  id_professor INT,
  FOREIGN KEY (id_professor) REFERENCES professores(id)
  );

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
