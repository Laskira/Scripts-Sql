USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,19-09-2019>
-- Description:	<Saber cuáles Equipos están en Mantenimiento y a quien se le asigno>
-- =============================================

CREATE PROCEDURE SP_EquiposMantenimiento

AS BEGIN

 SELECT TblMantenimientos.FKCodigo_TblEquipos, TblMantenimientos.FKId_TblPersonas FROM TblMantenimientos 
 INNER JOIN TblEquipos ON TblEquipos.PKCodigo = TblMantenimientos.FKCodigo_TblEquipos
 INNER JOIN TblPersonas ON TblPersonas.PKId = TblMantenimientos.FKId_TblPersonas
 WHERE TblMantenimientos.FKId_TblEstado = 5

 END
