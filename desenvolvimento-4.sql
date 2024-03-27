CREATE TABLE Vendas (
    ProdutoID INT,
    DataVenda DATE,
    Quantidade INT
);

CREATE OR REPLACE PROCEDURE relatorio_diario_vendas()
LANGUAGE plpgsql
AS $$
BEGIN
    CREATE TABLE RelatorioDiario AS
    SELECT DataVenda, ProdutoID, SUM(Quantidade) as QuantidadeTotal
    FROM Vendas
    GROUP BY DataVenda, ProdutoID;
END;
$$;

CALL relatorio_diario_vendas();
