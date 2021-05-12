USE DBEntidad_Bancaria
GO


EXEC SP_Comparar
SELECT COUNT(TblCuenta.FkId_TblCliente) FROM TblClientes INNER JOIN TblCuenta ON TblClientes.PkId = TblCuenta.FkId_TblCliente

/*9. Todos los clientes (# documento de identidad y nombre) junto 
con el número de cuentas corrientes que tienen (¿Cuántas tienen?), el saldo máximo y 
la suma de los saldos ordenado por el número de cuentas 
que tienen descendentemente; y para todos aquellos que 
tienen el mismo número de cuentas, ordenados por nombre ascendentemente.
*/

SELECT TblClientes.PkId, TblClientes.P_Nombre, COUNT(TblCuenta.FkId_TblCliente) AS N_Cuentas, 
MAX(TblCuenta.Saldo) AS SaldoMaximo, SUM(TblCuenta.Saldo) AS SumaSaldos FROM TblClientes
INNER JOIN TblCuenta ON TblClientes.PkId = TblCuenta.FkId_TblCliente
GROUP BY TblClientes.PkId, TblClientes.P_Nombre, TblCuenta.FkId_TblCliente
ORDER BY N_Cuentas DESC, TblClientes.P_Nombre ASC

SELECT TblClientes.PkId, TblClientes.P_Nombre, COUNT(TblCuenta.FkId_TblCliente) AS N_Cuentas  FROM TblClientes
INNER JOIN TblCuenta ON TblClientes.PkId = TblCuenta.FkId_TblCliente
GROUP BY TblClientes.PkId, TblClientes.P_Nombre, TblCuenta.FkId_TblCliente

/*11. Obtener las cuentas en las que no han hecho ninguna operación en un cajero de la sucursal de la cuenta.*/

SELECT * FROM TblCuenta

SELECT * FROM TblOperacion

SELECT TblClientes.PkId, TblClientes.P_Nombre, COUNT(TblCuenta.FkId_TblCliente) AS N_Cuentas, 
MAX(TblCuenta.Saldo) AS SaldoMaximo, SUM(TblCuenta.Saldo) AS SumaSaldos FROM TblClientes
INNER JOIN TblCuenta ON TblClientes.PkId = TblCuenta.FkId_TblCliente
GROUP BY TblClientes.PkId, TblClientes.P_Nombre, TblCuenta.FkId_TblCliente
ORDER BY N_Cuentas DESC, TblClientes.P_Nombre ASC

SELECT TblCuenta.PkId FROM TblCuenta
INNER JOIN TblSucursal ON TblSucursal.PkCodigo = TblCuenta.FkCodigo_TblSucursal
INNER JOIN TblOperacion ON TblCuenta.PkId = TblOperacion.FkId_TblCuenta
WHERE  IS NULL



/*10. Todos los clientes (# documento de identidad) 
junto con el número de cuentas corrientes que tienen; 
pero sólo aquellos clientes que tienen más de una cuenta corriente.*/



SELECT TblClientes.P_Nombre, TblClientes.PkId, TblCuenta.PkId, COUNT(TblCuenta.FkId_TblCliente) AS N_Cuentas FROM TblClientes
INNER JOIN TblCuenta ON TblClientes.PkId = TblCuenta.FkId_TblCliente
GROUP BY TblCuenta.FkId_TblCliente, TblClientes.P_Nombre, TblClientes.PkId, TblCuenta.PkId
HAVING N_Cuentas > 1

SELECT TblClientes.PkId, TblClientes.P_Nombre FROM TblClientes
INNER JOIN TblCuenta ON TblClientes.PkId = TblCuenta.FkId_TblCliente
GROUP BY TblClientes.PkId, TblClientes.P_Nombre, TblCuenta.FkId_TblCliente
HAVING TblCuenta.FkId_TblCliente = (SELECT COUNT(TblCuenta.FkId_TblCliente) AS N_PRUEBA FROM TblCuenta)


SELECT * FROM TblCuenta

SELECT * FROM TblOperacion

SELECT * FROM TblTipoOperacion



/*
	INTENTO PROCEDIMIENTO ALMACENAWDO
	@N_Cuentas int, @SaldoMaximo float, @SumaSaldos float, @Comparacion int
AS
BEGIN
DECLARE @PkIdCli varchar
DECLARE @NombreCli varchar
DECLARE @FkIdCli_Cuenta varchar


SELECT TblClientes.PkId, TblClientes.P_Nombre, COUNT(TblCuenta.FkId_TblCliente) AS N_Cuentas, 
MAX(TblCuenta.Saldo) AS SaldoMaximo, SUM(TblCuenta.Saldo) AS SumaSaldos FROM TblClientes
INNER JOIN TblCuenta ON TblClientes.PkId = TblCuenta.FkId_TblCliente
GROUP BY TblClientes.PkId, TblClientes.P_Nombre, TblCuenta.FkId_TblCliente
ORDER BY N_Cuentas DESC, TblClientes.P_Nombre ASC

WHERE
@N_Cuentas = (SELECT TblClientes.PkId, TblClientes.P_Nombre, COUNT(TblCuenta.FkId_TblCliente) AS N_Cuentas  FROM TblClientes
INNER JOIN TblCuenta ON TblClientes.PkId = TblCuenta.FkId_TblCliente
GROUP BY TblClientes.PkId, TblClientes.P_Nombre, TblCuenta.FkId_TblCliente)
END
GO
*/
