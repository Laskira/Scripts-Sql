DELIMITER //
CREATE PROCEDURE SP_GuardarAutor
(p_nombre varchar(50), s_nombre varchar(50), p_apellido varchar(50), s_apellido varchar(50),
seudonimo varchar(300), sexo int, biografia varchar(5000), foto varchar(8000))

BEGIN
   INSERT INTO tblautores(P_Nombre, S_Nombre, P_Apellido, S_Apellido, Seudononimo, FKId_TblSexo, Biografia, Foto) 
   VALUES (p_nombre, s_nombre, p_apellido, s_apellido, seudonimo, sexo, biografia, foto);

   SELECT 'Autor registrado exitosamente'; /*Print= select*/
END //

DELIMITER ;


CALL SP_GuardarAutor /*Llamado del procedimiento*/
/*PRUEBA*/

CALL SP_GuardarAutor ('Isaak', 'Yúdovich', 'Azímov', '', 'Isaac Asimov', '1', 
'Isaac Asimov (ˈaɪzək ˈæzəməf; en ruso А́йзек Ази́мов —Áyzek Azímov—, nombre original: Исаáк Ю́дович Ози́мов —Isaak Yúdovich Ozímov— Petróvichi, RSFS de Rusia, 20 de diciembre de 1919jul./ 2 de enero de 1920greg.-Nueva York, Estados Unidos, 6 de abril de 1992) fue un escritor y profesor de bioquímica en la facultad de medicina de la Universidad de Boston de origen ruso, nacionalizado estadounidense, conocido por ser un prolífico autor de obras de ciencia ficción, historia y divulgación científica.2​ Asimov, asimismo, tenía un dilatado conocimiento sobre las ciencias naturales en todo su conjunto. ', '')

CALL SP_GuardarAutor ('Gabriel', 'Garcia', 'Marquez', '', 'Gabo', '1', 
'Gabriel José de la Concordia García Márquez (Aracataca, Magdalena, 6 de marzo de 1927nota 1​-Ciudad de México, 17 de abril de 20142​). Está relacionado de manera inherente con el realismo mágico y su obra más conocida, la novela Cien años de soledad, es considerada una de las más representativas de este movimiento literario, e incluso se considera que por el éxito de la novela es que tal término se aplica a la literatura surgida a partir de los años 1960 en América Latina.4​5​En 2007 la Real Academia Española y la Asociación de Academias de la Lengua Española publicaron una edición popular conmemorativa de esta obra, por considerarla parte de los grandes clásicos hispánicos de todos los tiempos.6​ ', '')