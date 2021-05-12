USE DBAbogados
GO
-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,10-2019>
-- Description:	<Cargar Lugares>
-- =============================================
CREATE PROCEDURE SP_ConsultarLugares

AS BEGIN

  SELECT 
  TblLugar.PkId,  /*Código*/
  TblLugar.Descripcion /*Mostrar*/
  FROM TblLugar

END