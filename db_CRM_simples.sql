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
