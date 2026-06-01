# SQL CRM Training Database

## 📖 Sobre o Projeto

Este repositório contém os scripts SQL utilizados para criação, povoamento e consulta de uma base de dados simulada de CRM (Customer Relationship Management) bem simples.

O projeto foi desenvolvido como parte de meus estudos no **Plano de Desenvolvimento Individual (PDI) 2026.1 da Just a Little Data**, com o objetivo de consolidar conhecimentos em bancos de dados relacionais e linguagem SQL aplicados a cenários de negócio reais.

A base de dados foi modelada para representar um ambiente simplificado de CRM, contemplando processos de aquisição de leads, cadastro de clientes, vendas, produtos, interações com clientes e equipes comerciais.

---

## 🎯 Objetivos de Aprendizagem

Este projeto foi criado para apoiar o estudo e a prática dos seguintes conceitos:

* Modelagem de bancos de dados relacionais
* Chaves primárias e estrangeiras
* Relacionamentos entre tabelas
* Comandos SQL básicos e intermediários
* Consultas utilizando:

  * `SELECT`
  * `WHERE`
  * `JOIN`
  * `GROUP BY`
  * `ORDER BY`
  * `HAVING`
  * Funções de agregação (`SUM`, `AVG`, `COUNT`, `MAX`)

---

## 🏗️ Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes entidades:

### 👤 Clientes (`tb_clientes`)

Armazena informações cadastrais dos clientes.

| Campo         | Descrição           |
| ------------- | ------------------- |
| id_cliente    | Identificador único |
| nome          | Nome do cliente     |
| email         | E-mail              |
| telefone      | Telefone            |
| cidade        | Cidade              |
| estado        | Estado              |
| data_cadastro | Data de cadastro    |

---

### 🧲 Leads (`tb_leads`)

Armazena informações dos potenciais clientes captados por campanhas de marketing.

| Campo        | Descrição                 |
| ------------ | ------------------------- |
| id_lead      | Identificador único       |
| email        | E-mail do lead            |
| origem       | Canal de aquisição        |
| campanha     | Campanha associada        |
| data_entrada | Data de entrada           |
| convertido   | Indica se houve conversão |

---

### 👥 Vendedores (`tb_vendedores`)

Representa os colaboradores responsáveis pelas vendas.

| Campo       | Descrição           |
| ----------- | ------------------- |
| id_vendedor | Identificador único |
| nome        | Nome do vendedor    |
| equipe      | Equipe comercial    |

---

### 📦 Produtos (`tb_produtos`)

Catálogo de produtos e serviços comercializados.

| Campo      | Descrição           |
| ---------- | ------------------- |
| id_produto | Identificador único |
| nome       | Nome do produto     |
| categoria  | Categoria           |
| preco      | Preço               |

---

### 💰 Vendas (`tb_vendas`)

Registra as transações realizadas pelos clientes.

| Campo       | Descrição            |
| ----------- | -------------------- |
| id_venda    | Identificador único  |
| id_cliente  | Cliente comprador    |
| id_vendedor | Vendedor responsável |
| data_venda  | Data da venda        |
| valor_total | Valor total da venda |

---

### 🧾 Itens da Venda (`tb_itens_venda`)

Detalhamento dos produtos vendidos em cada venda.

| Campo          | Descrição           |
| -------------- | ------------------- |
| id_item        | Identificador único |
| id_venda       | Venda relacionada   |
| id_produto     | Produto vendido     |
| quantidade     | Quantidade          |
| valor_unitario | Valor unitário      |

---

### 📞 Interações (`tb_interacoes`)

Registra os contatos realizados com os clientes.

| Campo          | Descrição              |
| -------------- | ---------------------- |
| id_interacao   | Identificador único    |
| id_cliente     | Cliente relacionado    |
| tipo           | Tipo da interação      |
| data_interacao | Data da interação      |
| descricao      | Descrição da interação |

---

## 🔗 Relacionamentos

O modelo relacional foi construído utilizando chaves estrangeiras para representar os vínculos entre as entidades.

### Principais relacionamentos

* Um cliente pode possuir várias vendas.
* Um cliente pode possuir várias interações.
* Um vendedor pode realizar várias vendas.
* Uma venda pode possuir vários itens.
* Um produto pode estar presente em vários itens de venda.

---

## 📊 Consultas Desenvolvidas

O projeto contempla consultas SQL voltadas para análise de dados de CRM.

### Clientes sem compras

Identifica clientes cadastrados que ainda não realizaram nenhuma compra.

---

### Total gasto por cliente

Calcula o valor total gasto por cada cliente.

---

### Ticket médio

Calcula o valor médio das vendas realizadas.

---

### Total vendido por categoria de produto

Agrupa as vendas por categoria e calcula o faturamento correspondente.

---

### Top clientes

Retorna os clientes com maior volume financeiro em compras.

---

### Clientes inativos

Identifica clientes que não realizam compras desde uma determinada data.

---

### Origem de leads com maior conversão

Permite analisar a eficiência dos canais de aquisição de leads.

---

### Clientes com maior engajamento

Identifica clientes que possuem múltiplas interações registradas.

---

### Taxa de conversão de leads

Calcula a proporção entre leads captados e leads convertidos em clientes.

---

## 🚀 Como Executar

### 1. Criar o banco de dados

Executar os comandos de criação das tabelas.

### 2. Popular a base

Executar os comandos `INSERT INTO`.

### 3. Executar as consultas

Executar as consultas disponibilizadas na seção de análise.

O projeto pode ser executado em bancos compatíveis com SQL relacional, tais como:

* PostgreSQL
* Supabase
* MySQL (com pequenas adaptações)
* SQL Server
* Oracle Database

---

## 📚 Conceitos Trabalhados

Durante o desenvolvimento deste projeto foram estudados e aplicados:

* Banco de Dados Relacional
* Modelagem de Dados
* Chaves Primárias e Estrangeiras
* Relacionamentos
* SELECT
* WHERE
* JOIN
* LEFT JOIN
* GROUP BY
* HAVING
* ORDER BY
* LIMIT
* Funções de Agregação
* Indicadores de CRM
* Métricas de Conversão
* Análise de Clientes

---

## 👩‍💻 Autoria

Projeto desenvolvido para fins de estudo e capacitação no contexto do **Plano de Desenvolvimento Individual (PDI) 2026.1** da **Just a Little Data**, com foco na aplicação prática de SQL para análise de dados e cenários de CRM.
