USE DBDefinitiva
GO
-- =============================================
-- Author:		<Author, Yuli>
-- Create date: <Create Date, 05-09-2019>
-- Description:	<Calcular la nota definitiva>
-- =============================================
CREATE PROCEDURE SP_CalcularDefinitiva
@n1 decimal, @n2 decimal, @n3 decimal, @n4 decimal, 
@id varchar (11), @nombres varchar (80), @correo varchar (50)

AS BEGIN
DECLARE @definitiva decimal
DECLARE @cursor int
SELECT @cursor = (SELECT COUNT(*) FROM TblEstudiantes WHERE PkId = @id) --saber cuantas veces esta la persona en la base de datos
END
--CONDICION PARA QUE TRABAJE DEACUERDO A ELLO--
  IF @cursor = 0
    BEGIN 
	INSERT INTO TblEstudiantes(PkId, Nombres_Completos,Correo) 
	VALUES (@id,@nombres, @correo)
	END

 IF @cursor = 1
    BEGIN 
	PRINT 'Esta persona ya se encuentra registrada' --Escribir y mostrar un mensaje
	END

SELECT @definitiva = (@n1 * 0.30) + (@n2 * 0.30) + (@n3 * 0.10) + (@n4 * 0.30) --Asignar

  IF @definitiva >= 3.0
   BEGIN 
   INSERT INTO TblCalificaciones (FkId_TblEstudiantes, Fecha, Nota1, Nota2, Nota3, Nota4, Definitiva, FkId_TblEstado)
   VALUES (@id, getdate(), @n1, @n2, @n3, @n4, @definitiva, 0)
   END

  IF @definitiva <= 3.0
   BEGIN 
   INSERT INTO TblCalificaciones (FkId_TblEstudiantes, Fecha, Nota1, Nota2, Nota3, Nota4, Definitiva, FkId_TblEstado)
   VALUES (@id, getdate(), @n1, @n2, @n3, @n4, @definitiva, 1)
   END

 

--Necesito saber que mi estudiante esta registrado --
