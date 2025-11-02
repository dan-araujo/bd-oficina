-- Expressões - atributos derivados
-- Total por item de serviço/peça (quantidade * valor - desconto)
SELECT 'SERVIÇO' AS tipo,
ios.id_ordem_servico, ios.id_servico AS item_id,
(ios.quantidade * ios.valor_unitario - ios.desconto) AS total_item
FROM itens_servico ios
UNION ALL 
SELECT 'PEÇA' AS tipo,
iop.id_ordem_servico, iop.id_peca AS item_id,
(iop.quantidade * iop.valor_unitario - iop.desconto) AS total_item
FROM itens_pecas iop;



