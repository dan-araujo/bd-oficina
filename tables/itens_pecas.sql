CREATE TABLE itens_pecas ( 
id_ordem_servico INT NOT NULL,
id_peca INT NOT NULL,
quantidade SMALLINT NOT NULL DEFAULT 1 CHECK (quantidade > 0),
valor_unitario DECIMAL(10,2) NOT NULL CHECK (valor_unitario > 0),
desconto DECIMAL (10,2) NOT NULL DEFAULT 0 CHECK (desconto >= 0),
PRIMARY KEY (id_ordem_servico, id_peca),
CONSTRAINT fk_ordens_servico_pecas FOREIGN KEY (id_ordem_servico) REFERENCES ordens_servico(id),
CONSTRAINT fk_ordens_itens_pecas FOREIGN KEY (id_peca) REFERENCES pecas(id)
);