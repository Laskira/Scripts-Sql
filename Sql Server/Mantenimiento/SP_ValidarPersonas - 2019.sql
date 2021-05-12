USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,19-09-2019>
-- Description:	<Validar Persona>
-- =============================================

ALTER PROCEDURE SP_ValidarPersona
@id_persona varchar (11), @p_nombre varchar (50), @s_nombre varchar (50), @p_apellido varchar (50), @s_apellido varchar (50),
@telefono varchar (10), @correo varchar (100)

  AS BEGIN 
     DECLARE @cursor int
	 SELECT @cursor = (SELECT COUNT(*) FROM TblPersonas WHERE PKId = @id_persona)

      IF @cursor = 0 
	    BEGIN 
		  EXECUTE SP_AgregarPersona @id_persona, @p_nombre, @s_nombre, @p_apellido, @s_apellido, @telefono, @correo
		  PRINT 'Persona Registrada exitosamente'
		END
	  
	  IF @cursor = 1
	   BEGIN
		  PRINT 'Esta persona ya esta registrada'
	   END
  END
