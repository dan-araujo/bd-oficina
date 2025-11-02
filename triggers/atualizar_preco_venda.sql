DELIMITER $$
CREATE TRIGGER trg_atualizar_preco_venda
BEFORE UPDATE ON pecas
FOR EACH ROW
BEGIN
	IF NEW.preco_venda < NEW.custo THEN
	SIGNAL SQLSTATE '45000'
	SET message_text = 'Preço de venda não pode ser menor que o custo!';
    END IF;
END$$

DELIMITER ;