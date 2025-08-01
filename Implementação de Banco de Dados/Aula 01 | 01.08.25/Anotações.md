* Apresentação do Plano de Ensino
* Informações sobre as avaliações

# Relembrando
A ideia inicial do banco de dados é eliminar redundancia, menor quantidade de tababela, chaves primarias e valores nulos possíveis

## D.E.R. Conceitual
Não representa o número total de tabelas
* Entidade
* Reacionamento
* Cardinalidade
* Atributos
* Chave Primária/Identificador
  * Obrigatoriamente: Único e não nulo
  * Natural: Todo mundo já possui (ex: CPF)
  * Artificiais: Valor que eu gerei (ex: Id)
<img width="943" height="462" alt="{62B3AE9C-EAEE-40A7-B1CE-E40E82A4C3FE}" src="https://github.com/user-attachments/assets/db3a8a9e-b0bc-437a-a646-f799d6c8ea59" />


## D.E.R. Lógico
Se aproxima do modelo físico
* Restrições de domínio (tipos: int, varchar, float, etc)
* Chave estrangeira - o n sempre puxa a chave
<img width="899" height="530" alt="{4F202F5F-78FA-46E4-AA9B-9D37D32CEDE2}" src="https://github.com/user-attachments/assets/6d2ca2ee-062d-4ab0-a206-2de8e856fbdf" />


## D.E.R. Físico
<img width="629" height="541" alt="{F06255CE-55C6-4936-9F54-740DD55EDDB7}" src="https://github.com/user-attachments/assets/cb18013e-1676-4cce-940a-5247eef871a3" />

```sql
CREATE DATABASE AULA0;
USE AULA0;

/* Lógico_1: */
CREATE TABLE LIVRO (
    isbn VARCHAR(50) PRIMARY KEY,
    titulo VARCHAR(100),
    ano int,
    FK_EDITORA_Id INT,
    FK_CATEGORIA_codigo INT
);

CREATE TABLE AUTOR (
    Id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100),
    nacionalidade VARCHAR(50)
);

CREATE TABLE CATEGORIA (
    codigo INT PRIMARY KEY IDENTITY,
    descricao VARCHAR(50)
);

CREATE TABLE EDITORA (
    Id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100)
);

CREATE TABLE LIVRO_AUTOR_ESCRITO (
    FK_LIVRO_isbn VARCHAR(50),
    FK_AUTOR_Id INT
);
 
ALTER TABLE LIVRO ADD CONSTRAINT FK_LIVRO_2
    FOREIGN KEY (FK_EDITORA_Id)
    REFERENCES EDITORA (Id)
    ON DELETE CASCADE;
 
ALTER TABLE LIVRO ADD CONSTRAINT FK_LIVRO_3
    FOREIGN KEY (FK_CATEGORIA_codigo)
    REFERENCES CATEGORIA (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE LIVRO_AUTOR_ESCRITO ADD CONSTRAINT FK_LIVRO_AUTOR_ESCRITO_1
    FOREIGN KEY (FK_LIVRO_isbn)
    REFERENCES LIVRO (isbn);
 
ALTER TABLE LIVRO_AUTOR_ESCRITO ADD CONSTRAINT FK_LIVRO_AUTOR_ESCRITO_2
    FOREIGN KEY (FK_AUTOR_Id)
    REFERENCES AUTOR (Id);

INSERT INTO CATEGORIA (descricao) VALUES ('Literatura Juvenil');
INSERT INTO CATEGORIA (descricao) VALUES ('Ficção Científica');
INSERT INTO CATEGORIA (descricao) VALUES ('Humor');

INSERT INTO EDITORA (nome) VALUES ('Rocco');
INSERT INTO EDITORA (nome) VALUES ('Wmf Martins Fontes');
INSERT INTO EDITORA (nome) VALUES ('Casa da Palavra');
INSERT INTO EDITORA (nome) VALUES ('Belas Letras');
INSERT INTO EDITORA (nome) VALUES ('Matrix');

INSERT INTO AUTOR(nome, nacionalidade) VALUES ('J.K. Rowling', 'Inglaterra');
INSERT INTO AUTOR(nome, nacionalidade) VALUES ('Clivic Staples Lewis', 'Inglaterra');
INSERT INTO AUTOR(nome, nacionalidade) VALUES ('Affonso Solano', 'Brasil');
INSERT INTO AUTOR(nome, nacionalidade) VALUES ('Marcos Piangers', 'Brasil');
INSERT INTO AUTOR(nome, nacionalidade) VALUES ('Ciro Botelho', 'Brasil');
INSERT INTO AUTOR(nome, nacionalidade) VALUES ('Bianca Mól', 'Brasil');

INSERT INTO LIVRO(isbn, titulo, ano, FK_EDITORA_Id, FK_CATEGORIA_codigo) VALUES ('8532511015', 'Harry Potter e A Pedra Filosofal', '2000', '1', '1');
INSERT INTO LIVRO(isbn, titulo, ano, FK_EDITORA_Id, FK_CATEGORIA_codigo) VALUES ('9788578270698', 'As Crônicas de Nárnia', '2009', '2', '1');
INSERT INTO LIVRO(isbn, titulo, ano, FK_EDITORA_Id, FK_CATEGORIA_codigo) VALUES ('97885773343348', 'O Espadachim de Carvão', '2013', '3', '2');
INSERT INTO LIVRO(isbn, titulo, ano, FK_EDITORA_Id, FK_CATEGORIA_codigo) VALUES ('9788581742458', 'O Papai é Pop', '2015', '4', '3');
INSERT INTO LIVRO(isbn, titulo, ano, FK_EDITORA_Id, FK_CATEGORIA_codigo) VALUES ('9788582302026', 'Pior Que Tá Não Fica', '2015', '5', '3');
INSERT INTO LIVRO(isbn, titulo, ano, FK_EDITORA_Id, FK_CATEGORIA_codigo) VALUES ('9788577345670', 'Garota Desdobrável', '2015', '3', '1');
INSERT INTO LIVRO(isbn, titulo, ano, FK_EDITORA_Id, FK_CATEGORIA_codigo) VALUES ('8532512062', 'Harry Potter e o Prisioneiro de Azkaban', '2000', '1', '1');

INSERT INTO LIVRO_AUTOR_ESCRITO(FK_LIVRO_isbn, FK_AUTOR_Id) VALUES ('8532511015', '1');
INSERT INTO LIVRO_AUTOR_ESCRITO(FK_LIVRO_isbn, FK_AUTOR_Id) VALUES ('9788578270698', '2');
INSERT INTO LIVRO_AUTOR_ESCRITO(FK_LIVRO_isbn, FK_AUTOR_Id) VALUES ('97885773343348', '3');
INSERT INTO LIVRO_AUTOR_ESCRITO(FK_LIVRO_isbn, FK_AUTOR_Id) VALUES ('9788581742458', '4');
INSERT INTO LIVRO_AUTOR_ESCRITO(FK_LIVRO_isbn, FK_AUTOR_Id) VALUES ('9788582302026', '5');
INSERT INTO LIVRO_AUTOR_ESCRITO(FK_LIVRO_isbn, FK_AUTOR_Id) VALUES ('9788577345670', '6');
INSERT INTO LIVRO_AUTOR_ESCRITO(FK_LIVRO_isbn, FK_AUTOR_Id) VALUES ('8532512062', '1');

SELECT * 
FROM LIVRO, LIVRO_AUTOR_ESCRITO, AUTOR
WHERE LIVRO.isbn = LIVRO_AUTOR_ESCRITO.FK_LIVRO_isbn AND AUTOR.Id = LIVRO_AUTOR_ESCRITO.FK_AUTOR_Id
ORDER BY titulo;

SELECT * 
FROM LIVRO, LIVRO_AUTOR_ESCRITO, AUTOR
WHERE LIVRO.isbn = LIVRO_AUTOR_ESCRITO.FK_LIVRO_isbn AND AUTOR.Id = LIVRO_AUTOR_ESCRITO.FK_AUTOR_Id
ORDER BY nome;

SELECT * 
FROM LIVRO, LIVRO_AUTOR_ESCRITO, AUTOR, CATEGORIA
WHERE descricao = 'Literatura Juvenil' AND
      LIVRO.isbn = LIVRO_AUTOR_ESCRITO.FK_LIVRO_isbn AND 
      AUTOR.Id = LIVRO_AUTOR_ESCRITO.FK_AUTOR_Id AND CATEGORIA.codigo = LIVRO.FK_CATEGORIA_codigo
ORDER BY ano;

SELECT * 
FROM LIVRO, LIVRO_AUTOR_ESCRITO, AUTOR, CATEGORIA
WHERE (descricao = 'Humor' OR descricao = 'Ficção Científica') AND
      (ano >= 200 and ano <= 2015) AND
      LIVRO.isbn = LIVRO_AUTOR_ESCRITO.FK_LIVRO_isbn AND 
      AUTOR.Id = LIVRO_AUTOR_ESCRITO.FK_AUTOR_Id AND 
      CATEGORIA.codigo = LIVRO.FK_CATEGORIA_codigo
ORDER BY ano;
```
