-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,25/05/2019>
-- Description:	<Generar Detelle de factura>
-- =============================================

create procedure SP_GenerarDetalle
@n_factura int, @cod_prod varchar (10), @valor money, @porc_iva float, @cant int
as begin
declare @subtotal money
declare @iva_aplicado money
declare @total money
declare @subTotal_factura money
declare @total_iva money 
insert into TblDet_TblFacturas
(FKN_Factura_TblFacturas,FKCodigo_TblProductos,Valor_Unitario,Cantidad,Porc_Iva)
values
(@n_factura,@cod_prod,@valor,@cant,@porc_iva)
set @subtotal = @valor * @cant
set @iva_aplicado = @subtotal * @porc_iva
set  @total = @subtotal + @iva_aplicado
update TblDet_TblFacturas
set
Subtotal = @subtotal
Iva_Aplicado = @iva_aplicado
Total = @total
where 
FKCodigo_TblProducto = @cod_prod

set @SubTotal_Factura = (select sum(TblDet_TblFacturas.Valor_Unitario * TblDet_TblFacturas.Cantidad) from TblDet_TblFacturas where TblDet_TblFacturas=@n_factura)
set @Total_Iva = (select sum(TblDet_TblFacturas.Iva_Aplicado) from TblDet_TblFacturas where TblDet_TblFacturas=@n_factura)
set @Total = @SubTotal_Factura + @Total_Iva
update TblFacturas
set
Subtotal = @Subtotal,
Iva = @Total_Iva,
Total = @Total
where
PKN_Factura = @n_factura
end
