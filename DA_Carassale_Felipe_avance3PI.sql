--Pregunta: ¿Cuál es el total de ventas (TotalCompra) a nivel global?
SELECT SUM(Totalcompra) AS TotalCompra FROM Ordenes

--Pregunta: ¿Cuál es el precio promedio de los productos dentro de cada categoría?
SELECT CategoriaID, AVG(Precio) AS PrecioPromedio FROM Productos GROUP BY CategoriaID

--Pregunta: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?
SELECT SucursalID, MIN(TotalCompra) AS OrdenMinima, MAX(TotalCompra) AS OrdenMaxima FROM Ordenes GROUP BY SucursalID

--Pregunta: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?
SELECT TOP 1 OrdenID, MAX(KilometrosRecorrer) AS MaxKm FROM Ordenes GROUP BY OrdenId Order BY MaxKm DESC

--Pregunta: ¿Cuál es la cantidad promedio de productos por orden?
SELECT OrdenID, AVG(Cantidad) AS PromedioProductos FROM DetallesOrdenes GROUP BY OrdenID

--Pregunta: ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?
SELECT TipoPagoID, SUM(TotalCompra) AS FactTotal FROM Ordenes GROUP BY TipoPagoID

--Pregunta: ¿Cuál Sucursal tiene el ingreso promedio más alto?
SELECT TOP 1 SucursalID, AVG(TotalCompra) AS IngresoPromedio FROM Ordenes GROUP BY SucursalID ORDER BY IngresoPromedio DESC

--Pregunta: ¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?
SELECT SucursalID, SUM(TotalCompra) AS VentaTotal FROM Ordenes GROUP BY SucursalID HAVING SUM(TotalCompra) > 1000

--Pregunta: ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?
SELECT
(SELECT AVG(TotalCompra) FROM Ordenes WHERE FechaOrdenTomada < '2023-07-01') AS PromedioVentasAntes,
(SELECT AVG(TotalCompra) FROM Ordenes WHERE FechaOrdenTomada >= '2023-07-01') AS PromedioVentasDespues

--Pregunta: ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?
SELECT TOP 1 HorarioVenta, SUM(TotalCompra) AS TotalCompra, AVG(TotalCompra) AS PromedioVenta, MAX(TotalCompra) AS ImporteMaximo FROM Ordenes GROUP BY HorarioVenta ORDER BY TotalCompra DESC