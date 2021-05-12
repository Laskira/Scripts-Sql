USE DBSumar
GO
-- =============================================
-- Author:		<Author, Yuli>
-- Create date: <Create Date, 05/09/2019>
-- Description:	<Procedimiento para calcular la suma de los numeros>
-- =============================================
CREATE PROCEDURE SP_Calcular

@n1 decimal, @n2 decimal

AS BEGIN /*Aca comienza el procedimiento*/

DECLARE @resultado decimal /*Lo que me va dar este procedimiento*/
SELECT @resultado = @n1 + @n2 /*El comando select se usa para guardar el resultado en la varible*/
PRINT  @resultado

INSERT INTO TblResultado
(Numero1, Numero2, Resultado)
VALUES
(@n1, @n2, @resultado)

END