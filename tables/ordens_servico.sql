CREATE TABLE ordens_servico ( 
id INT PRIMARY KEY AUTO_INCREMENT,
id_cliente INT NOT NULL,
id_veiculo INT NOT NULL,
id_responsavel INT NOT NULL,
status ENUM('Aberta', 'Em andamento', 'Concluída', 'Cancelada') DEFAULT 'Aberta',
km_rodados int,
defeito_reclamado VARCHAR(255),
observacoes VARCHAR(255),
data_abertura DATETIME DEFAULT CURRENT_TIMESTAMP,
data_fechamento DATETIME NULL,
CONSTRAINT fk_os_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id),
CONSTRAINT fk_os_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculos(id),
CONSTRAINT fk_os_responsavel FOREIGN KEY (id_responsavel) REFERENCES funcionarios(id)
);