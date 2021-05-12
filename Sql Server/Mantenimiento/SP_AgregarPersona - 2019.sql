USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,19-09-2019>
-- Description:	<Agregar Persona>
-- =============================================
CREATE PROCEDURE SP_AgregarPersona
@id varchar(11), @p_nombre varchar (50), @s_nombre varchar (50), @p_apellido varchar (50), @s_pellido varchar (50),
@telefono varchar (10), @correo varchar (100)

  AS BEGIN 
    INSERT INTO TblPersonas(PKId, P_Nombre, S_Nombre, P_Apellido, S_Apellido, Telefono, Correo)
	VALUES
	(@id, @p_nombre,  @s_nombre, @p_apellido, @s_pellido, @telefono, @correo)
  END


