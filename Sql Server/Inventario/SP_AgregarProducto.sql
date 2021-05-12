USE DBInventario
GO

-- =============================================
-- Author:		<Author, Yuli>
-- Create date: <05-09-2019>
-- Description:	<Agregar Producto>
-- =============================================
CREATE PROCEDURE SP_AgregarProducto
@codigo varchar (10), @nombre varchar (50), @caracteristicas varchar (8000),
@precio money, @stock bigint

AS BEGIN
   
   DECLARE @estado int
   SELECT @estado = (SELECT TblEstado.PkId FROM TblEstado WHERE TblEstado.PkId = 0)

   INSERT INTO TblProductos(PkCodigo, Nombre, Caracteristicas, Precio, Stock, FkId_TblEstado)
   VALUES (@codigo, @nombre, @caracteristicas, @precio, @stock, @estado)

END
GO
