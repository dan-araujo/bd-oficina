-- CASE - Classificação de Ordem de Serviço por faixa de valor
WITH tot AS (
SELECT os.id,
COALESCE(sv.total_servicos, 0) + COALESCE(pc.total_pecas, 0) AS total_ordem_servico
FROM ordens_servico os 
LEFT JOIN (SELECT id_ordem_servico, SUM(quantidade * valor_unitario - desconto)
total_servicos FROM itens_servico GROUP BY id_ordem_servico) sv
ON sv.id_ordem_servico = os.id 
LEFT JOIN (SELECT id_ordem_servico, SUM(quantidade * valor_unitario - desconto)
total_pecas FROM itens_pecas GROUP BY id_ordem_servico) pc
ON pc.id_ordem_servico = os.id 
)
SELECT 
t.id AS id_ordem_servico,
t.total_ordem_servico,
CASE 
	WHEN t.total_ordem_servico < 150 THEN 'Baixo'
	WHEN t.total_ordem_servico BETWEEN 150 AND 300 THEN 'Médio'
	ELSE 'Alto'
END AS faixa_valor
FROM tot t 
ORDER BY t.total_ordem_servico DESC;


