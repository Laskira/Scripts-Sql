USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,19-09-2019>
-- Description:	<Crear Usuario>
-- =============================================
ALTER PROCEDURE SP_CrearUsuario
@rol int, @id_persona varchar (11)

  AS BEGIN 

	  INSERT INTO TblUsuarios(PKUsuario, Contraseña, FKId_TblEstado, FKId_TblRol, Fecha, FKId_TblPersonas)
	  VALUES
	  (@id, @password, 3, @rol, GETDATE(), @id_persona)

  END