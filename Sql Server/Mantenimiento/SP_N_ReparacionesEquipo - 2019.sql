USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,19-09-2019>
-- Description:	<Saber el número de reparaciones que ha sufrido un equipo>
-- =============================================

CREATE PROCEDURE SP_N_ReparacionesEquipo
@serial varchar (10)
AS BEGIN

 SELECT COUNT(TblMantenimientos.FKCodigo_TblEquipos) AS N_Reparaciones FROM TblMantenimientos 
 INNER JOIN TblEquipos ON TblEquipos.PKCodigo = TblMantenimientos.FKCodigo_TblEquipos
 WHERE TblMantenimientos.FKCodigo_TblEquipos = @serial
 GROUP BY TblMantenimientos.FKCodigo_TblEquipos 

 END
