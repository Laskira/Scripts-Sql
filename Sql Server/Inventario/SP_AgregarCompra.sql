USE DBInventario
GO
-- =============================================
-- Author:		<Author, Yuli>
-- Create date: <05-09-2019>
-- Description:	<Agregar Compra>
-- =============================================
CREATE PROCEDURE SP_AgregarCompra
@codigo varchar (10), @cant bigint
AS BEGIN
  INSERT INTO TblCompras (FkCodigo_TblProductos, Fecha, Hora, CantidadProd)
  VALUES
  (@codigo, GETDATE(), CURRENT_TIMESTAMP, @cant)

  DECLARE @update bigint
  DECLARE @total bigint

  SELECT @update = (SELECT TblProductos.Stock FROM TblProductos WHERE PkCodigo = @codigo)
  SELECT @total = @update + @cant

  UPDATE TblProductos
  SET
  Stock = @total
  WHERE
  PkCodigo = @codigo

  END
  GO
