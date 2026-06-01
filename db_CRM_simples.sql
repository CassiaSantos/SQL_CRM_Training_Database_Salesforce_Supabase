-- CRIAÇÃO DAS TABELAS:
-- CLIENTES
CREATE TABLE tb_clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    data_cadastro DATE
);


-- LEADS
CREATE TABLE tb_leads (
    id_lead INT PRIMARY KEY,
    email VARCHAR(100),
    origem VARCHAR(50),
    campanha VARCHAR(50),
    data_entrada DATE,
    convertido BOOLEAN
);


-- VENDEDORES
CREATE TABLE tb_vendedores (
    id_vendedor INT PRIMARY KEY,
    nome VARCHAR(100),
    equipe VARCHAR(50)
);


-- PRODUTOS
CREATE TABLE tb_produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10,2)
);


-- VENDAS
CREATE TABLE tb_vendas (
    id_venda INT PRIMARY KEY,
    id_cliente INT,
    id_vendedor INT,
    data_venda DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);


-- ITENS DA VENDA
CREATE TABLE tb_itens_venda (
    id_item INT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    valor_unitario DECIMAL(10,2),
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);


-- INTERAÇÕES
CREATE TABLE tb_interacoes (
    id_interacao INT PRIMARY KEY,
    id_cliente INT,
    tipo VARCHAR(50), -- email, ligação, whatsapp
    data_interacao DATE,
    descricao TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- POVOAMENTO DO BANCO:
INSERT INTO clientes VALUES
(1, 'Cássia Santos', 'cassia@email.com', '99999-1111', 'Santarém', 'PA', '2024-01-10'),
(2, 'João Silva', 'joao@email.com', '99999-2222', 'Belém', 'PA', '2024-02-15'),
(3, 'Maria Souza', 'maria@email.com', '99999-3333', 'Manaus', 'AM', '2024-03-20'),
(4, 'Carlos Lima', 'carlos@email.com', '99999-4444', 'Santarém', 'PA', '2024-04-10'),
(5, 'Ana Costa', 'ana@email.com', '99999-5555', 'Belém', 'PA', '2024-05-05');


INSERT INTO leads VALUES
(1, 'lead1@email.com', 'facebook', 'campanha1', '2024-01-01', TRUE),
(2, 'lead2@email.com', 'google', 'campanha2', '2024-01-10', FALSE),
(3, 'lead3@email.com', 'instagram', 'campanha3', '2024-02-01', TRUE),
(4, 'lead4@email.com', 'indicacao', 'campanha1', '2024-02-15', TRUE);


INSERT INTO vendedores VALUES
(1, 'Pedro Alves', 'Time A'),
(2, 'Juliana Rocha', 'Time B');


INSERT INTO produtos VALUES
(1, 'CRM Básico', 'Software', 100.00),
(2, 'CRM Pro', 'Software', 300.00),
(3, 'Consultoria', 'Serviço', 500.00);


INSERT INTO vendas VALUES
(1, 1, 1, '2024-06-01', 400.00),
(2, 2, 2, '2024-06-05', 300.00),
(3, 1, 1, '2024-07-01', 500.00),
(4, 3, 2, '2024-07-10', 100.00);


INSERT INTO itens_venda VALUES
(1, 1, 1, 2, 100.00),
(2, 1, 2, 1, 200.00),
(3, 2, 2, 1, 300.00),
(4, 3, 3, 1, 500.00),
(5, 4, 1, 1, 100.00);


INSERT INTO interacoes VALUES
(1, 1, 'email', '2024-06-01', 'Boas-vindas'),
(2, 1, 'whatsapp', '2024-06-02', 'Dúvida sobre produto'),
(3, 2, 'ligacao', '2024-06-06', 'Follow-up'),
(4, 3, 'email', '2024-07-11', 'Promoção enviada');


--CONSULTAS:
--Clientes sem compras:
SELECT c.nome
FROM clientes c
LEFT JOIN vendas v ON c.id_cliente = v.id_cliente
WHERE v.id_venda IS NULL;


-- Total gasto por cliente:
SELECT c.nome, SUM(v.valor_total) AS total
FROM clientes c
JOIN vendas v ON c.id_cliente = v.id_cliente
GROUP BY c.nome;


--Ticket médio
SELECT AVG(valor_total) FROM vendas;


-- Total por categoria de produto:
SELECT p.categoria, SUM(iv.quantidade * iv.valor_unitario) AS total
FROM itens_venda iv
JOIN produtos p ON iv.id_produto = p.id_produto
GROUP BY p.categoria;


-- Top clientes:
SELECT c.nome, SUM(v.valor_total) AS total
FROM clientes c
JOIN vendas v ON c.id_cliente = v.id_cliente
GROUP BY c.nome
ORDER BY total DESC
LIMIT 3;


-- Clientes que não compram DESDE JULHO DE 2024:
SELECT c.nome, MAX(v.data_venda) AS ultima_compra
FROM clientes c
JOIN vendas v ON c.id_cliente = v.id_cliente
GROUP BY c.nome
HAVING MAX(v.data_venda) < '2024-07-01';


-- Origem de leads que mais converte
SELECT origem, COUNT(*) AS total
FROM leads
WHERE convertido = TRUE
GROUP BY origem;


-- Clientes com muitas interações
SELECT c.nome, COUNT(i.id_interacao) AS total_interacoes
FROM clientes c
JOIN interacoes i ON c.id_cliente = i.id_cliente
GROUP BY c.nome
HAVING COUNT(i.id_interacao) > 1;


-- Taxa de conversão de leads:
SELECT
    COUNT(CASE WHEN convertido = TRUE THEN 1 END) * 1.0 / COUNT(*) AS taxa
FROM leads;
