CREATE TABLE Livros (
    ID SERIAL PRIMARY KEY,
    Titulo VARCHAR(100),
    Autor VARCHAR(100),
    Preco NUMERIC(10, 2),
    Estoque INT
);

CREATE TABLE Vendas (
    ID SERIAL PRIMARY KEY,
    LivroID INT,
    DataVenda DATE,
    Quantidade INT,
    TotalVenda NUMERIC(10, 2),
    FOREIGN KEY (LivroID) REFERENCES Livros(ID)
);

CREATE OR REPLACE FUNCTION atualizar_estoque()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Livros SET Estoque = Estoque - NEW.Quantidade
    WHERE ID = NEW.LivroID;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER AtualizarEstoqueAposVenda
AFTER INSERT ON Vendas
FOR EACH ROW
EXECUTE FUNCTION atualizar_estoque();

INSERT INTO Livros (Titulo, Autor, Preco, Estoque) VALUES
('O Senhor dos Anéis', 'J. R. R. Tolkien', 39.90, 10),
('Harry Potter', 'J. K. Rowling', 29.90, 15);

INSERT INTO Vendas (LivroID, DataVenda, Quantidade, TotalVenda) VALUES
(1, CURRENT_DATE, 2, 79.80),
(2, CURRENT_DATE, 3, 89.70);

select * from livros;