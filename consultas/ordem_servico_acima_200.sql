-- HAVING – clientes com pelo menos 1 Ordem de Serviço concluída acima de R$ 200
SELECT c.id, c.nome,
SUM(COALESCE(sv.total_servicos, 0) + COALESCE(pc.total_pecas > 0)) AS total_cliente
FROM ordens_servico os
JOIN clientes c ON c.id = os.id_cliente
-- HAVING - Clientes com pelo menos 1 Ordem de Serviço concluída acima de R$ 200
LEFT JOIN (SELECT id_ordem_servico, SUM(quantidade * valor_unitario - desconto)
total_servicos FROM itens_servico GROUP BY id_ordem_servico) sv
ON sv.id_ordem_servico = os.id
LEFT JOIN (SELECT id_ordem_servico, SUM(quantidade * valor_unitario - desconto)
total_pecas FROM itens_pecas GROUP BY id_ordem_servico) pc
ON pc.id_ordem_servico = os.id 
WHERE os.status = 'Concluída'
GROUP BY c.id, c.nome 
HAVING SUM(COALESCE(sv.total_servicos, 0) + COALESCE(pc.total_pecas, 0)) >= 200
ORDER BY total_cliente DESC;