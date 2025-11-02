-- Total das ordens de serviço (somando serviços + peças)
SELECT 
os.id AS id_ordem_servico,
c.nome AS cliente,
SUM(COALESCE(soma_servicos.total_servico, 0) + COALESCE(soma_pecas.total_pecas, 0)) AS total_ordem_servicos
FROM ordens_servico os
JOIN clientes c ON c.id = os.id_cliente 
LEFT JOIN (
SELECT id_ordem_servico, SUM(quantidade * valor_unitario - desconto) AS total_servico
FROM itens_servico GROUP BY id_ordem_servico
) 
soma_servicos ON soma_servicos.id_ordem_servico = os.id
LEFT JOIN (
SELECT id_ordem_servico, SUM(quantidade * valor_unitario - desconto) AS total_pecas
FROM itens_pecas GROUP BY id_ordem_servico
)
soma_pecas ON soma_pecas.id_ordem_servico = os.id 
GROUP BY os.id, c.nome 
ORDER BY os.id;


