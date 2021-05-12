/*EJEMPLO GUIA*/

DELIMITER //

CREATE TRIGGER tblcopia_articulo AFTER INSERT ON tbl_articulo 
FOR EACH ROW INSERT INTO tblcopia_articulo(id_cop_art, tit_cop_art, aut_cop_art, edi_cop_art, prec_cop_art, fecha_create_cop_art) 
VALUES (new.id_art, new.tit_art, new.aut_art, new.edi_art, new.prec_art, now()); 
//
DELIMITER ;




/*TRIGGER PARA QUE EL ID DEL USUARIO SEA IGUAL AL DE LA PERSONA A SU CONTRASEÑA, 
GURDADANDO TAMBIEN SU CORREO ELECTRONICO*/

DELIMITER //
CREATE TRIGGER TblUsuarios 
AFTER INSERT ON TblPersonas /*Despues de insertar en la tabla*/
FOR EACH ROW /*Rellenar estas filas*/
INSERT INTO TblUsuarios
(PkId_TblPersonas, Correo, Contrasenia, FkId_TblEstado, FkId_TblRol, FechaCreacionUsu)
VALUES (NEW.PkId, NEW.Correo, NEW.PkId, '1', NEW.FkId_TblRol, NOW())  ///*Campos a insertar en los siguientes registros*/
DELIMITER ;

DELIMITER //
CREATE TRIGGER TblUsuarios AFTER INSERT ON TblPersonas FOR EACH ROW 
INSERT INTO TblUsuarios(PkId_TblPersonas, Correo, Contrasenia, FkId_TblEstado, FkId_TblRol, FechaCreacionUsu)
VALUES (NEW.PkId, NEW.Correo, NEW.PkId, '1', NEW.FkId_TblRol, NOW()) //
DELIMITER ;



/*Momento exacto de noticia*/

/*En la tabla partidos a base de los goles realizados mostrar el ganador
comparar resultados e insertar el nombre del ganador y perdedor
*/

/*crear un disparador que despues de que un delegado cree un equipo lo asocie automaticamente a el*/