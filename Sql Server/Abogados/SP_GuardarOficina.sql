USE DBAbogados 
GO
-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,10-10-2019>
-- Description:	<Guardar Oficina>
-- =============================================
CREATE PROCEDURE SP_GuardarOficina
@nit varchar(20), @nombre varchar(500), @contacto varchar(30), 
@direccion varchar(600), @correo varchar(200), @lugar int
AS BEGIN
   
   INSERT INTO TblOficinas (PkNit, Nombre, Contacto, Direccion, Correo, FkId_TblLugar)
   VALUES (@nit, @nombre, @contacto, @direccion, @correo, @lugar)

   PRINT 'Oficina Registrada exitosamente'

END