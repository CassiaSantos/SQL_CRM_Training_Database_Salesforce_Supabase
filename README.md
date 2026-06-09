# SQL CRM Training Database

## 📖 Sobre o Projeto

Este repositório contém os scripts SQL utilizados para criação, povoamento e consulta de um bases de dados simuladas de CRM (Customer Relationship Management).

O projeto foi desenvolvido originalmente como parte de meus estudos no **Plano de Desenvolvimento Individual (PDI) 2026.1 da Just a Little Data**, com o objetivo de consolidar conhecimentos em bancos de dados relacionais e na linguagem SQL aplicados a cenários de negócio reais. 

### 🔄 Evolução Multiplataforma (Supabase & Salesforce Marketing Cloud)
O projeto evoluiu de uma estrutura de banco relacional tradicional executada no **Supabase** para uma implementação focada em **Data Extensions do Salesforce Marketing Cloud**.

---

## 🎯 Objetivos de Aprendizagem

Este projeto foi criado para apoiar o estudo e a prática dos seguintes conceitos:

* Modelagem de bancos de dados relacionais e Data Extensions.
* Relacionamentos entre tabelas via chaves primárias e estrangeiras.
* Resolução de conflitos de validação de código.
* Consultas utilizando: `SELECT`, `WHERE`, `JOIN`, `GROUP BY`, `ORDER BY` e Funções de Agregação (`SUM`, `AVG`, `COUNT`).

---

## 🏗️ Estrutura do Banco de Dados no Salesforce Marketing Cloud

Para a implementação no Salesforce Marketing Cloud, as tabelas foram nomeadas seguindo o padrão `tb_[nome]_cassia`. Abaixo está o mapeamento das entidades populadas com dados atuais de 2026:

### 👤 Clientes (`tb_clientes_cassia`)
Armazena informações cadastrais de 100 clientes integrados.
* `id_cliente` (Text - PK) | `nome_cliente` (Text) | `cidade_cliente` (Text) | `estado_cliente` (Text) | `email_cliente` (EmailAddress) | `telefone_cliente` (Phone) | `data_cadastro_cliente` (Date)

### 🧲 Leads (`tb_leads_cassia`)
Registra os 300 leads captados ao longo do primeiro semestre de 2026.
* `id_lead` (Text - PK) | `nome_lead` (Text) | `email_lead` (EmailAddress) | `origem_lead` (Text) | `campanha_lead` (Text) | `data_entrada_lead` (Date) | `convertido_lead` (Boolean)

### 👥 Vendedores (`tb_vendedores_cassia`)
Cadastro dos 15 vendedores/closers divididos por equipes de alta performance.
* `id_vendedor` (Text - PK) | `nome_vendedor` (Text) | `equipe_vendedor` (Text)

### 📦 Produtos (`tb_produtos_cassia`)
Catálogo de produtos da EdTech com foco em High-Ticket.
* `id_produto` (Text - PK) | `nome_produto` (Text) | `categoria_produto` (Text) | `preco_produto` (Decimal)

### 💰 Vendas (`tb_vendas_cassia`)
Transações financeiras geradas a partir das conversões de leads.
* `id_venda` (Text - PK) | `id_cliente` (Text) | `id_vendedor` (Text) | `data_venda` (Date) | `valor_total` (Decimal)

### 🧾 Itens da Venda (`tb_itens_venda_cassia`)
O detalhamento de cada produto que compõe os contratos de mentoria.
* `id_item` (Text - PK) | `id_venda` (Text) | `id_produto` (Text) | `valor_unitario_produto` (Decimal) | `quantidade_prduto` (Number)

### 📞 Interações (`tb_interacoes_cassia`)
Histórico de pontos de contato (WhatsApp, Reuniões de Diagnóstico) controlados pelo CRM.
* `id_interacao` (Text - PK) | `id_cliente` (Text) | `tipo_interacao` (Text) | `data_interacao` (Date) | `descricao_interacao` (Text)

---

## 🛠️ Desafios Técnicos e Aprendizados no Salesforce Marketing Cloud

Durante a migração dos scripts do Supabase (PostgreSQL) para o Salesforce Marketing Cloud (T-SQL), foram enfrentadas algumas dificuldades de validação nas Query Activities. Abaixo estão documentados os aprendizados fundamentais deste projeto:

### 1. O Falso Positivo do Bloco `SELECT *` (Bug do Asterisco)
O validador do Salesforce possui uma segurança Regex agressiva que proíbe o uso de asteriscos para evitar `SELECT *`. Contudo, o validador disparava um alarme falso ao ler uma multiplicação matemática comum em funções agregadas, como `SUM(quantidade * valor)`.
* **Solução Técnica Descoberta:** Remover totalmente os espaços em branco antes e depois do caractere de multiplicação (`*`). A sintaxe colada `SUM((iv.quantidade_prduto*iv.valor_unitario_produto))` quebra o padrão do robô do Salesforce e permite salvar a query com sucesso.

### 2. Máscara Booleana em Queries
Embora uma Data Extension aceite a criação de campos do tipo `Boolean`, o motor subjacente do Salesforce expõe esse dado como texto para as Query Activities.
* **Solução Técnica Descoberta:** Filtros de validação precisam tratar o campo explicitamente com aspas simples (`WHERE convertido_lead = 'TRUE'`), caso contrário, o sistema interpreta o comando como uma coluna inexistente.

### 3. Comentários no código SQL apontava erros em outras linhas:
Levei bastante tempo até perceber que vários erros aparentemente "sem explicação" estava sendo gerados pela linha 1 de comentário do que a consulta retornava. Testei várias vezes as consultas, mudei a forma de consultar para outras alternativas que geravam o mesmo resultado mas até então não conseguia realizar as consultas sem o SQL Studio apontar um erro.
* **Solução Técnica Descoberta:** Remoção de todo e qualquer comentário nas consultas feitas após esse entendimento.

---

## 🚀 Imagens do projeto desenvolvido:

### 1. Consulta da origem de leads que mais converte
![Consulta da origem de leads que mais converte](img/origem%20de%20leads%20que%20mais%20converte.png)

### 2. Consulta da taxa de conversao de leads
![Consulta da taxa de conversao de leads](img/taxa%20de%20conversao%20de%20leads.png)

---

## 👩‍💻 Autoria

Projeto desenvolvido para fins de estudo, capacitação e superação de desafios técnicos no contexto do **Plano de Desenvolvimento Individual (PDI) 2026.1** da **Just a Little Data**, demonstrando resiliência e adaptação de código SQL entre ambientes de desenvolvimento (Supabase) e ecossistemas corporativos em nuvem (Salesforce).