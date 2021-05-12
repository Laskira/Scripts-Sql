USE DBAbogados 
GO
-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,10-10-2019>
-- Description:	<Validar Oficina>
-- =============================================

CREATE PROCEDURE SP_ValidarOficina
@nit varchar(20), @nombre varchar(500), @contacto varchar(30), 
@direccion varchar(600), @correo varchar(200), @lugar int

AS BEGIN 
   DECLARE @cursor int
   SELECT @cursor = (SELECT COUNT(*) FROM TblOficinas WHERE PkNit = @nit)

   IF @cursor = 0
     BEGIN
	   EXECUTE SP_GuardarOficina @nit, @nombre, @contacto, @direccion, @correo, @lugar
	 END

	IF @cursor = 1
	BEGIN
	  PRINT 'Esta Oficina ya se encuentra registrada'
	 END
END





