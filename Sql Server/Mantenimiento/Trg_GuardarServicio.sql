
-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,2019-06-18>
-- Description:	<Guardar Servicio>
-- =============================================
CREATE TRIGGER Trg_GuardarServicio 
   ON  TblDet_TblDet_TblOrdenTrabajo_TblServicios
   AFTER INSERT
AS 
BEGIN
declare @det_orden bigint
declare @iva bigint
declare @total bigint
declare @n_orden bigint
declare @subtotal bigint

SELECT @det_orden = (SELECT TblDet_TblOrdenTrabajo.FKN_Orden_Tbl_OrdenTrabajo
FROM TblDet_TblOrdenTrabajo
WHERE TblDet_TblOrdenTrabajo.PKId= @det_orden)

SET @n_orden = (SELECT SUM(CAST(TblDet_TblDet_TblOrdenTrabajo_TblServicios.Valor as bigint))
FROM TblDet_TblDet_TblOrdenTrabajo_TblServicios
WHERE TblDet_TblDet_TblOrdenTrabajo_TblServicios.FKId_TblDet_TblOrdenTrabajo = @det_orden)

SET @iva = @subtotal * 0.19
SET @total = @subtotal+@iva

UPDATE TblOrdenTrabajo
SET
Subtotal=@subtotal,
Iva=@iva,
Total=@total

WHERE
PKN_Orden=@det_orden

	
SET NOCOUNT ON;

 -- Insert statements for trigger here
END
GO
