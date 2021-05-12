
-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <18/06/2019>
-- Description:	<Procedimiento para guardar los detalles relacionados aun servicio>
-- =============================================
CREATE PROCEDURE SP_GuardarDetServicio 

 @id_orden bigint,@servicio int, @valor as float
as begin
insert into TblDet_TblDet_TblOrdenTrabajo_TblServicios  
	(PKId, FKCodigo_TblServicos, Valor, Fecha)
	VALUES 
	(@id_orden, @servicio, @valor, GETDATE())


END
GO
