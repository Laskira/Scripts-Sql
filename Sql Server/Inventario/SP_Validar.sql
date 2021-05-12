USE DBInventario
GO
-- =============================================
-- Author:		<Author, Yuli>
-- Create date: <05-09-2019>
-- Description:	<Validar cuantos productos hay,
--  y saber si un producto esta registrado o no>
-- =============================================
CREATE PROCEDURE SP_Validar
@codigo varchar (10), @nombre varchar (50), @caracteristicas varchar (8000),
@precio varchar (9), @stock bigint

   AS BEGIN --Inicio SP
    
	DECLARE @cursor int
	SELECT @cursor = (SELECT COUNT(*) FROM TblProductos WHERE PkCodigo = @codigo)

	IF @cursor = 0
	BEGIN
	EXECUTE SP_AgregarProducto @codigo, @nombre, @caracteristicas, @precio, @stock
	PRINT 'Producto Registrado'
	END

	IF @cursor = 1
	BEGIN
	PRINT 'Inventario Registrado'
	EXECUTE SP_AgregarCompra @codigo, @stock
	END

	END --Fin SP