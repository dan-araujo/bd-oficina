DELIMITER $$
CREATE TRIGGER trg_validar_preco_venda
BEFORE INSERT ON pecas
FOR EACH ROW
BEGIN
	IF NEW.preco_venda < NEW.custo THEN
	SIGNAL SQLSTATE '45000'
	SET message_text = 'Preço de venda não pode ser menor que o custo!';
    END IF;
END$$

DELIMITER ;
