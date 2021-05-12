CREATE TABLE DBSumarNumeros
GO

USE DBSumarNumeros
GO

CREATE TABLE TblResultado
(
PkId int identity(0,1) primary key,
Numero1 decimal not null,
Numero2 decimal not null, 
Resultado decimal  not null
)

--EJECUCION DE UN PROCEDIMIENTO ALMACENADO--

EXECUTE /*Ejecutar*/ SP_Calcular 5,4 /*Se agregan los parametros*/

