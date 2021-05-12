/*Contar cuantos goles hay en un partido*/
SELECT COUNT(*) AS Total /*Esto es un alias o apodo a la consulta para que no muestre con el mero COUNT(*)*/ 
FROM tbl_gol 
INNER JOIN tbl_partidos ON tbl_gol.FkId_tbl_partido = tbl_partidos.PkId 
WHERE FkId_tbl_partido = "1";

/*Cada es igual a un gol.
Se hace el inner join para que al comprobar el código del partido por medio de la foreign key*/


/*Contar el número de goles hechos por el equipo local*/

SELECT COUNT(*) AS Goles_Local FROM tbl_gol 
INNER JOIN tbl_partidos ON
tbl_gol.FkId_tbl_partido = tbl_partidos.PkId
INNER JOIN tbl_equipos ON
tbl_gol.FkId_tbl_equipos = tbl_equipos.PkId
WHERE FkId_tbl_partido = "0" /*Id del partido en juego*/
AND FkId_tbl_equipos = "1"; /*Id equipo, la única variación para conseguir los goles del otro equipo, 
es cambiar el codigo*/


 /*Se hace inner join con el equipo para agregar el condicional del WHERE*/

/*Contar el número de goles hechos por el equipo visitante*/

SELECT COUNT(*) AS Goles_Visitante FROM tbl_gol 
INNER JOIN tbl_partidos ON
tbl_gol.FkId_tbl_partido = tbl_partidos.PkId
INNER JOIN tbl_equipos ON
tbl_gol.FkId_tbl_equipos = tbl_equipos.PkId
WHERE FkId_tbl_partido = "0"  /*Id del partido en juego*/
AND FkId_tbl_equipos = "0";

/*Saber quienes son miembros de un equipo*/
SELECT tbl_personas.PkId, tbl_personas.P_Nombre, tbl_personas.S_Nombre, tbl_personas.P_Apellido, tbl_personas.S_Apellido, tbl_equipos.Nombre AS Equipo
FROM tbl_personas INNER JOIN tbl_equipos ON
tbl_equipos.PkId = tbl_personas.FkId_TblEquipo
WHERE tbl_personas.FkId_TblEquipo = '0'; /*id del equpo al que pertenece una persona*/

/*Saber cuanto miembros hay en un equipo*/
SELECT COUNT(tbl_personas.PkId) AS N_Integrates
FROM tbl_personas WHERE FkId_TblEquipo = '0';

/*Confirmar inscripción de un equipo*/

SELECT tbl_equipos.Nombre, tbl_inscripcion.FechaHora AS FechaInscripcion, 
tbl_personas.PkId AS Documento,  tbl_personas.P_Nombre, tbl_personas.S_Nombre, 
tbl_personas.P_Apellido, tbl_personas.S_Apellido FROM tbl_inscripcion
INNER JOIN tbl_torneo ON
tbl_torneo.PkId = tbl_inscripcion.FkId_tbl_torneo
INNER JOIN tbl_equipos ON
tbl_equipos.PkId = tbl_inscripcion.FkId_tbl_equipos
INNER JOIN tbl_personas ON
tbl_personas.PkId = tbl_inscripcion.FkId_tbl_personas_delegado;

/*Saber cuantos goles ha hecho un jugador y el equipo al que pertenece*/
SELECT COUNT(tbl_gol.PkId) AS N_Goles, tbl_personas.P_Nombre, 
tbl_personas.S_Nombre, tbl_personas.P_Apellido, tbl_personas.S_Apellido, 
tbl_equipos.Nombre AS Nombre_Equipo FROM tbl_gol
INNER JOIN tbl_equipos ON tbl_equipos.PkId = tbl_gol.FkId_tbl_equipos
INNER JOIN tbl_personas ON tbl_personas.PkId = tbl_gol.FkId_tbl_personas_jugador
WHERE tbl_personas.PkId = "100001";

/*Saber cuál es el mejor goleador*/
SELECT tbl_personas.P_Nombre, tbl_personas.S_Nombre, tbl_personas.P_Apellido, tbl_personas.S_Apellido,
tbl_equipos.Nombre AS Nombre_Equipo FROM tbl_gol
INNER JOIN tbl_equipos ON tbl_equipos.PkId = tbl_gol.FkId_tbl_equipos
INNER JOIN tbl_personas ON tbl_personas.PkId = tbl_gol.FkId_tbl_personas_jugador
WHERE  tbl_gol.PkId = (SELECT MAX(tbl_gol.PkId) FROM tbl_gol);


/*Cuántos goles hizo el mejor goleador*/

SELECT COUNT(tbl_gol.PkId) AS N_Goles, tbl_equipos.Nombre AS Nombre_Equipo, tbl_personas.P_Nombre, 
tbl_personas.S_Nombre, tbl_personas.P_Apellido, tbl_personas.S_Apellido FROM tbl_gol
INNER JOIN tbl_equipos ON tbl_equipos.PkId = tbl_gol.FkId_tbl_equipos
INNER JOIN tbl_personas ON tbl_personas.PkId = tbl_gol.FkId_tbl_personas_jugador



/* WHERE (SELECT COUNT(tbl_gol.PkId) AS N_Goles FROM tbl_gol)
and tbl_gol.PkId = (SELECT MAX(tbl_gol.PkId) FROM tbl_gol); */

