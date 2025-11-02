CREATE TABLE funcionarios (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
funcao ENUM('Mecânico', 'Atendente','Gerente') DEFAULT 'Mecânico',
telefone VARCHAR(20),
ativo ENUM('Sim', 'Não') DEFAULT 'Sim'
);