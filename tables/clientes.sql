CREATE TABLE clientes (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` VARCHAR(20),
  `cpf` char(11) NOT NULL,
  `data_cadastro` date DEFAULT (curdate()),
  `endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `cliente_cpf_unico` (`cpf`)
) ENGINE=InnoDB;