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
  
      DECLARE @id varchar (100)

	  SELECT @id = (SELECT CONCAT(SUBSTRING(PKId, 4, 7), UPPER(LEFT(P_Nombre,3)), SUBSTRING(PKId, 1, 3)) FROM TblPersonas 
	  WHERE PKId = @id_persona)

	  DECLARE @password varchar (10)
	  SELECT @password = (SELECT PKId FROM TblPersonas WHERE PKId = @id_persona)

	  INSERT INTO TblUsuarios(PKUsuario, Contraseña, FKId_TblEstado, FKId_TblRol, Fecha, FKId_TblPersonas)
	  VALUES
	  (@id, @password, 3, @rol, GETDATE(), @id_persona)

  END