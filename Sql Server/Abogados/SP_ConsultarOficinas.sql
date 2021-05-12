USE DBAbogados 
GO
-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,10-10-2019>
-- Description:	<Validar Oficina>
-- =============================================

CREATE PROCEDURE SP_ConsultarOficina
@nit varchar(20)

AS BEGIN
  SELECT 
  TblOficinas.Nombre, 
  TblOficinas.Direccion, 
  TblOficinas.Contacto, 
  TblOficinas.Correo,
  TblOficinas.FkId_TblLugar
   FROM TblOficinas WHERE TblOficinas.PkNit = @nit
END