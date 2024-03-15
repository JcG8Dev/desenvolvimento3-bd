create database ESCOLA

CREATE TABLE aluno (
	id_aluno serial PRIMARY KEY,
  	nome VARCHAR(20) NOT NULL,
  	email VARCHAR(50) NOT NULL,
  	endereco VARCHAR(50) NOT NULL,
  	telefone INT
)
insert into aluno (nome, email, endereco, telefone) VALUES ('Maria', 'XXXXXXXXXXXXXXX', 'Rua da Maria', '987654321');

select * from aluno;

