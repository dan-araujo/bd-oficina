INSERT INTO clientes (nome, email, telefone, cpf, endereco) VALUES
('Ana Souza','ana@ex.com','(81)90000-0001','12345678901','Rua A, 10'),
('Bruno Lima','bruno@ex.com','(81)90000-0002','23456789012','Rua B, 20'),
('Carla Melo','carla@ex.com','(81)90000-0003','34567890123','Rua C, 30'),
('Diego Alves','diego@ex.com','(81)90000-0004','45678901234','Rua D, 40'),
('Erika Ramos','erika@ex.com','(81)90000-0005','56789012345','Rua E, 50');

INSERT INTO veiculos (id_cliente, placa, marca, modelo, ano) VALUES
(1,'ABC1D23','Fiat','Argo',2020),
(1,'EFG2H34','Honda','Civic',2018),
(2,'IJK3L45','Chevrolet','Onix',2019),
(3,'MNO4P56','Volkswagen','Gol',2015),
(4,'QRS5T67','Toyota','Corolla',2021),
(5,'UVW6X78','Hyundai','HB20',2022);

INSERT INTO funcionarios (nome, funcao, telefone) VALUES
('Paulo Mec','Mecânico','(81)98888-1111'),
('Rita Atend','Atendente','(81)98888-2222'),
('Lúcio Mec','Mecânico','(81)98888-3333'),
('Marta Ger','Gerente','(81)98888-4444');

INSERT INTO servicos (nome, preco_base) VALUES
('Troca de óleo', 120.00),
('Alinhamento e balanceamento', 180.00),
('Revisão básica', 250.00),
('Troca de pastilhas de freio', 220.00),
('Diagnóstico eletrônico', 150.00),
('Higienização do ar', 130.00);

INSERT INTO pecas (nome, custo, preco_venda) VALUES
('Óleo 5W30 1L', 30.00, 45.00),
('Filtro de óleo', 15.00, 30.00),
('Pastilha de freio dianteira', 90.00, 150.00),
('Fluido de freio', 20.00, 35.00),
('Filtro de ar', 18.00, 32.00),
('Filtro de cabine', 25.00, 40.00);

INSERT INTO ordens_servico (id_cliente, id_veiculo, id_responsavel, status, km_rodados, defeito_reclamado, observacoes)
VALUES
(1, 1, 1, 'Em andamento', 42000, 'Luz óleo acesa', 'Checar vazamentos'),
(2, 3, 3, 'Aberta', 31000, 'Vibração ao frear', 'Avaliar discos'),
(3, 4, 1, 'Concluída', 75000, 'Revisão geral', 'Cliente aguarda orçamento'),
(4, 5, 3, 'Concluída', 12000, 'Barulho suspensão', 'Possível bucha'),
(5, 6, 1, 'Aberta', 8000, 'Ar-condicionado fraco', 'Verificar filtro cabine');

INSERT INTO itens_servico (id_ordem_servico, id_servico, quantidade, valor_unitario, desconto) VALUES
(1, 1, 1, 120.00, 0.00),     -- Troca óleo
(1, 5, 1, 150.00, 0.00),     -- Diagnóstico
(2, 4, 1, 220.00, 20.00),    -- Troca pastilha c/ desconto
(3, 3, 1, 250.00, 0.00),     -- Revisão básica
(4, 2, 1, 180.00, 0.00),     -- Alinhamento
(5, 6, 1, 130.00, 0.00);     -- Higienização ar


INSERT INTO itens_pecas (id_ordem_servico, id_peca, quantidade, valor_unitario, desconto) VALUES
(1, 1, 4, 45.00, 0.00),      -- 4x Óleo
(1, 2, 1, 30.00, 0.00),      -- Filtro de óleo
(2, 3, 1, 150.00, 10.00),    -- Pastilha dianteira
(3, 5, 1, 32.00, 0.00),      -- Filtro de ar
(4, 4, 1, 35.00, 0.00),      -- Fluido freio
(5, 6, 1, 40.00, 0.00);      -- Filtro cabine

INSERT INTO pagamentos (id_ordem_servico, forma_pagamento, valor, status) VALUES
(3, 'Crédito', 282.00, 'Aprovado'),  -- (250 serv) + (32 peça)
(4, 'Débito', 215.00, 'Aprovado');   -- (180 serv) + (35 peça)
