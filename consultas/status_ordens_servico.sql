-- Filtro com WHERE Statement
-- Quais ordens de servico estão em aberto ou em andamento?
SELECT id, status, data_abertura
FROM ordens_servico 
WHERE status IN ('Aberta', 'Em andamento')
ORDER BY data_abertura DESC;


