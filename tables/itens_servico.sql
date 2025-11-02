CREATE TABLE `itens_servico` (
  `id_ordem_servico` int NOT NULL,
  `id_servico` int NOT NULL,
  `quantidade` tinyint NOT NULL DEFAULT '1',
  `desconto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_ordem_servico`,`id_servico`),
  KEY `fk_itens_servico_serv` (`id_servico`),
  CONSTRAINT `fk_itens_servico_os` FOREIGN KEY (`id_ordem_servico`) REFERENCES `ordens_servico` (`id`),
  CONSTRAINT `fk_itens_servico_serv` FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id`),
  CONSTRAINT `itens_servico_check` CHECK ((`valor_unitario` > 0)),
  CONSTRAINT `itens_servico_chk_1` CHECK ((`quantidade` > 0)),
  CONSTRAINT `itens_servico_chk_2` CHECK ((`desconto` >= 0))
)