USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,24-09-2019>
-- Description:	<Validar Equipo>
-- =============================================

CREATE PROCEDURE SP_ValidarEquipo
@serial varchar (10), @caracteristicas varchar (8000), @tipo int

AS BEGIN 

     DECLARE @cursor int
	 SELECT @cursor = (SELECT COUNT(*) FROM TblEquipos WHERE PKCodigo = @serial)

	  IF @cursor = 0 
	    BEGIN 
		  EXECUTE SP_RegistrarEquipo @serial, @caracteristicas, @tipo
		  PRINT 'Equipo registrado exitosamente'
		END
	  
	  IF @cursor = 1
	   BEGIN
		  PRINT 'Este equipo ya se encuentra registrado'
	   END
  END