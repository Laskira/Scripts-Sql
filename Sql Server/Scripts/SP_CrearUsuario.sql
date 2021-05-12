-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,19-09-2019>
-- Description:	<Crear Usuario>
--Esta validación impedirá que creen un usuario sin haberse registrado en el sistema
-- =============================================
CREATE PROCEDURE SP_CrearUsuario
@id varchar(100), @password varchar (11), @rol int, @id_persona varchar (11)

  AS BEGIN
   DECLARE @cursor int
   SELECT @cursor = (SELECT COUNT(*) TblPersonas WHERE PKId = @id_persona)

   IF @cursor = 0
    BEGIN
	 PRINT 'Por favor registrese para poder crear un usuario' 
	END

   IF @cursor = 1
     BEGIN 
	  INSERT INTO TblUsuarios(PKUsuario, Contraseña, FKId_TblEstado, FKId_TblRol, Fecha, FKId_TblPersonas)
	  VALUES
	  (@id, @password, 3, @rol, getdate(), @id_persona)
     END
  END