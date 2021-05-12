USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,19-09-2019>
-- Description:	<Confirmar Estado>
-- =============================================

ALTER PROCEDURE SP_ConfirmarEstado_Equipo
@serial varchar (10)
AS BEGIN

     DECLARE @cursor int
	 SELECT @cursor = (SELECT COUNT(*) FROM TblMantenimientos INNER JOIN TblEquipos ON TblEquipos.PKCodigo = TblMantenimientos.FKCodigo_TblEquipos 
	 WHERE TblMantenimientos.FKId_TblEstado = 6 AND TblMantenimientos.FKCodigo_TblEquipos = @serial)

	 /*El estado 6 es cuando el caso esta cerrado.
	 Si el caso esta cerrado el equipo esta disponible,
	 de lo contrario el estado del equipo pasará a 1 (Mantenimiento)*/

	 if @cursor = 0
	
	 BEGIN
	   PRINT 'Equipo en mantenimiento'
	   UPDATE TblEquipos SET FKId_TblEstado = 1 WHERE @serial = PKCodigo 
	   
	  END

	 if @cursor = 1

	  BEGIN
	   PRINT 'Equipo disponible'
	   UPDATE TblEquipos SET FKId_TblEstado = 0 WHERE @serial = PKCodigo 
	   /*Si el equipo esta disponible entonces se cambia su estado a 0 (En Funcionamiento)*/
	 END
	 
END