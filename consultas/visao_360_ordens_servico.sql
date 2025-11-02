-- JOIN completo - visão 360º das Ordens de Serviço
SELECT 
os.id AS id_ordem_servico,
os.status,
c.nome AS cliente,
f.nome AS responsavel,
v.placa,
GROUP_CONCAT(DISTINCT s.nome ORDER BY s.nome SEPARATOR ', ') AS servicos,
GROUP_CONCAT(DISTINCT p.nome ORDER BY p.nome SEPARATOR ', ') AS pecas
FROM ordens_servico os 
JOIN clientes c ON c.id = os.id_cliente 
JOIN funcionarios f ON f.id = os.id_responsavel 
JOIN veiculos v ON v.id = os.id_veiculo 
LEFT JOIN itens_servico ios ON ios.id_ordem_servico = os.id 
LEFT JOIN servicos s ON s.id = ios.id_servico 
LEFT JOIN itens_pecas iop ON iop.id_ordem_servico = os.id
LEFT JOIN pecas p ON p.id = iop.id_peca 
GROUP BY os.id, os.status, c.nome, f.nome, v.placa 
ORDER BY os.id;







