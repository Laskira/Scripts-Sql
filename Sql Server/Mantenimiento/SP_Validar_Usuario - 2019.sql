USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,23-09-2019>
-- Description:	<Validar Usuario>
-- =============================================

ALTER PROCEDURE SP_ValidarUsuario

@id varchar (100),@password varchar (11), @estado int,@rol int, @id_persona varchar (11)

 AS BEGIN 

     DECLARE @cursor int
	 SELECT @cursor = (SELECT COUNT(*) FROM TblUsuarios WHERE PKUsuario = @id_persona)

      IF @cursor = 0 
	    BEGIN 
		  EXECUTE SP_CrearUsuario @id, @password, @estado, @rol, @id_persona
		  PRINT 'Usuario creado exitosamente'
		END
	  
	  IF @cursor = 1
	   BEGIN
		  PRINT 'Este usuario ya se encuentra registrado'
	   END
  END
