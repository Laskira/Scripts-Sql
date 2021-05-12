USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,19-09-2019>
-- Description:	<Saber que Equipos ha reparado un tecnico>
-- =============================================

CREATE PROCEDURE SP_EquiposTecnico

AS BEGIN

 SELECT TblMantenimientos.FKCodigo_TblEquipos, TblMantenimientos.FKId_TblPersonas, TblPersonas.P_Nombre,
 TblPersonas.S_Nombre, TblPersonas.P_Apellido, TblPersonas.S_Apellido
  FROM TblMantenimientos 
 INNER JOIN TblEquipos ON TblEquipos.PKCodigo = TblMantenimientos.FKCodigo_TblEquipos
 INNER JOIN TblPersonas ON TblPersonas.PKId = TblMantenimientos.FKId_TblPersonas

 END