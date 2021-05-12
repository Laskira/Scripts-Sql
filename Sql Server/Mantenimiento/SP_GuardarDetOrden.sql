
-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <18/06/2019>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SP_GuardarDetOrden
@n_orden bigint
AS
BEGIN
INSERT INTO TblDet_TblOrdenTrabajo (FKN_Orden_Tbl_OrdenTrabajo, Fecha_Inicio)
	VALUES
	(@n_orden, GETDATE())
END
GO
