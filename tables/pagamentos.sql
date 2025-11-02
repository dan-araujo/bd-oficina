CREATE TABLE pagamentos ( 
id INT PRIMARY KEY AUTO_INCREMENT,
id_ordem_servico INT NOT NULL, 
forma_pagamento ENUM('Dinheiro', 'Débito', 'Crédito', 'Pix') NOT NULL,
valor DECIMAL(10,2) NOT NULL CHECK (valor > 0),
data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
status ENUM('Aprovado', 'Pendente', 'Estornado') DEFAULT 'Aprovado',
CONSTRAINT fk_pagamento_ordem_servico FOREIGN KEY (id_ordem_servico) REFERENCES ordens_servico (id)
);