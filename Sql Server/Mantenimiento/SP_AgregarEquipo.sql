USE DBMantenimiento
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SP_AgregarEquipo
@serial varchar(25), @caracteristicas varchar(100), @modelo varchar(100)

AS BEGIN
  DECLARE @id_cliente varchar (15) 
  SELECT @id_cliente = (SELECT TblPersonas.PkId FROM TblPersonas WHERE TblPersonas.FkId_TblRol = 1)

   INSERT INTO TblEquipos(PkSerial, Caracteristicas, Modelo, FkId_TblPersonas, FkId_TblEstado)
   VALUES (@serial, @caracteristicas, @modelo, @id_cliente, 0)
END
