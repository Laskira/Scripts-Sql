
-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,2019-06-18>
-- Description:	<Guardar Orden>
-- =============================================
CREATE PROCEDURE SP_GuardarOrden 
	@subtotal varchar (10), @iva varchar (10), @total varchar (10)
AS
BEGIN
	INSERT INTO TblOrdenTrabajo
	(Subtotal, Iva, Total, Fecha)
	VALUES
	(@subtotal, @iva, @total, GETDATE())

    
END
GO
