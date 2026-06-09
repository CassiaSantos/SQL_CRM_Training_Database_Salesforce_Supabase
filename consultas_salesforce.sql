-- Consultas no SLQ Server do Query Studio no Salesforce Marketing Cloud: 
-- Total de clientes cadastrados
SELECT
    COUNT(*) AS total_clientes
FROM tb_clientes_cassia

  
-- Telefone de clientes sem compra para oferecer uma condição especial via ligação ou WhatsApp:
SELECT c.id_cliente,
       c.nome_cliente,
       c.telefone_cliente
FROM tb_clientes_cassia c
LEFT JOIN tb_vendas_cassia v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venda IS NULL

  
-- Meus 20 clientes com maior valor de compras: 
SELECT TOP 20
       c.nome_cliente,
       c.email_cliente,
       SUM(v.valor_total) AS total
FROM tb_clientes_cassia c
JOIN tb_vendas_cassia v
    ON c.id_cliente = v.id_cliente
GROUP BY c.nome_cliente, c.email_cliente
ORDER BY total ASC

  
-- Ticket médio:
SELECT ROUND(AVG(v.valor_total), 2) AS ticket_medio
FROM tb_vendas_cassia v

  
-- Total de reais comprados por categoria de produto para saber qual tem maior faturamento e qual precisa ser mais estimulada:
SELECT p.categoria_produto,
       SUM((iv.quantidade_prduto*iv.valor_unitario_produto)) AS total
FROM tb_itens_venda_cassia iv
JOIN tb_produtos_cassia p
    ON iv.id_produto = p.id_produto
GROUP BY p.categoria_produto

  
-- Origem de leads que mais converte
SELECT origem_lead,
       COUNT(*) AS total
FROM tb_leads_cassia
WHERE convertido_lead = 'True'
GROUP BY origem_lead

-- Taxa de conversão de leads
SELECT
    COUNT(
        CASE
            WHEN convertido_lead = 'True' THEN 1
        END
    )*1.0 / COUNT(*) AS taxa_conversao
FROM tb_leads_cassia
