USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,19-09-2019>
-- Description:	<Crear Mantenimiento>
-- =============================================
ALTER PROCEDURE SP_CrearMantenimiento
@serialpc varchar (10), @usu_admin varchar (100), @fecha date, @id_tenico varchar (11),
@diagnostico varchar (8000), @observaciones varchar (8000), @tipo int

AS BEGIN

  /*El id del usuario es de quien asigna el caso y el de la persona es del ténico al que se asigna el caso*/
  INSERT INTO TblMantenimientos(FKCodigo_TblEquipos, FKUsuario_TblUsuarios, Fecha, FKId_TblPersonas, Diagnostico,Observaciones, FKId_TblEstado, FKId_TblTipoMantenimiento)
  VALUES
  (@serialpc, @usu_admin, @fecha, @id_tenico, @diagnostico, @observaciones, 6, @tipo)

END