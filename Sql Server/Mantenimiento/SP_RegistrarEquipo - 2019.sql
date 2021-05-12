USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,19-09-2019>
-- Description:	<Registrar Equipo>
-- =============================================

ALTER PROCEDURE SP_RegistrarEquipo
@serial varchar (10), @caracteristicas varchar (8000), @tipo int

 AS BEGIN 
  INSERT INTO TblEquipos(PKCodigo, Caracteristicas, FKId_TblEstado, FKId_TblTipo, Fecha)
  VALUES
  (@serial, @caracteristicas, 0, @tipo, GETDATE())
END