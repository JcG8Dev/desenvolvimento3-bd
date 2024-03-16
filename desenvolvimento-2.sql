-- Criação do banco de dados
CREATE DATABASE minhaBaseDeDados;

-- Conexão com o banco de dados criado
\c minhaBaseDeDados;

-- Criação da tabela 'usuarios'
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Criação da tabela 'pedidos'
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER,
    produto VARCHAR(100),
    quantidade INTEGER,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);


-- Inserção de dados na tabela 'usuarios'
INSERT INTO usuarios (nome, email) VALUES ('João', 'joao@email.com');
INSERT INTO usuarios (nome, email) VALUES ('Maria', 'maria@email.com');

-- Inserção de dados na tabela 'pedidos'
INSERT INTO pedidos (usuario_id, produto, quantidade) VALUES (1, 'Livro', 2);
INSERT INTO pedidos (usuario_id, produto, quantidade) VALUES (2, 'Caneta', 10);

-- Consulta utilizando JOIN
SELECT usuarios.nome, pedidos.produto, pedidos.quantidade
FROM usuarios
JOIN pedidos ON usuarios.id = pedidos.usuario_id;

-- Consulta utilizando LEFT JOIN
SELECT usuarios.nome, pedidos.produto, pedidos.quantidade
FROM usuarios
LEFT JOIN pedidos ON usuarios.id = pedidos.usuario_id;

-- Consulta utilizando RIGHT JOIN
SELECT usuarios.nome, pedidos.produto, pedidos.quantidade
FROM usuarios
RIGHT JOIN pedidos ON usuarios.id = pedidos.usuario_id;

-- Consulta utilizando FULL JOIN
SELECT usuarios.nome, pedidos.produto, pedidos.quantidade
FROM usuarios
FULL JOIN pedidos ON usuarios.id = pedidos.usuario_id;

-- Consulta utilizando UNION
SELECT usuarios.nome, pedidos.produto, pedidos.quantidade
FROM usuarios
JOIN pedidos ON usuarios.id = pedidos.usuario_id
UNION
SELECT usuarios.nome, pedidos.produto, pedidos.quantidade
FROM usuarios
JOIN pedidos ON usuarios.id = pedidos.usuario_id;
