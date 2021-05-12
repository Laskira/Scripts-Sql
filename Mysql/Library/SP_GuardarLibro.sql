DELIMITER //

CREATE PROCEDURE SP_GuardarLibro
(referencia varchar(150), name varchar(500), autor int, registrador varchar(15), )

BEGIN
  

  SELECT 'Libro registrado exitosamente';
END
//
DELIMITER ;