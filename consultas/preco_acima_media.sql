-- Subquery - produtos/peças acima do preço médio
SELECT id, nome, preco_venda 
FROM pecas 
WHERE preco_venda > (SELECT AVG(preco_venda) FROM pecas) 
ORDER BY preco_venda DESC;