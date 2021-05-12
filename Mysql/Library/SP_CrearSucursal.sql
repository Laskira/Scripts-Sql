DELIMITER //

CREATE PROCEDURE SP_CrearSucursal
(nombre varchar(200), INT estado int,  direccion varchar(800), foto varchar(8000))

BEGIN
  
  INSERT INTO tblsucursales(Nombre, FKId_TblEstado, Direccion, Foto)
  VALUES (nombre, estado, direccion, foto)
   
END 
//

DELIMITER ;