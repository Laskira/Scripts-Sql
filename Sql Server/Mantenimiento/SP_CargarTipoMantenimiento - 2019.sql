USE DBMantenimiento2019
GO

-- =============================================
-- Author:		<Author,Yuli>
-- Create date: <Create Date,19-09-2019>
-- Description:	<Cargar Tipo Mantenimiento para mostrarlo en un combox>
-- =============================================

CREATE PROCEDURE SP_CargarTipoMantenimiento

AS BEGIN
 SELECT PKId, Descripcion FROM TblTipoMantenimiento
END
