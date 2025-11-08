--Pregunta: ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?
SELECT P.Nombre AS Producto, C.Nombre AS Categoria  FROM Productos AS P LEFT JOIN Categorias AS C ON P.CategoriaID = C.CategoriaID

--Pregunta: ¿Cómo puedo saber a qué sucursal está asignado cada empleado?
SELECT E.Nombre AS Nombre, S.Nombre AS Sucursal FROM Empleados AS E INNER JOIN Sucursales AS S ON E.SucursalID = S.SucursalID

--Pregunta: ¿Existen productos que no tienen una categoría asignada?
SELECT P.Nombre AS Producto, C.Nombre AS Sucursal FROM Productos AS P LEFT JOIN Categorias AS C ON P.CategoriaID = C.CategoriaID WHERE C.CategoriaID = NULL

--Pregunta: ¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo el Nombre del cliente, Nombre del empleado que tomó la orden, y Nombre del mensajero que la entregó?
SELECT O.OrdenID AS OrdenID, C.Nombre AS Cliente, E.Nombre AS Empleado, M.Nombre AS Mensajero FROM Ordenes AS O
INNER JOIN Clientes AS C ON O.ClienteID = C.ClientesID
INNER JOIN Empleados AS E ON O.EmpleadoID = E.EmpleadoID
INNER JOIN	Mensajero AS M ON O.MensajeroID = M.MensajeroID

--Pregunta: ¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?
SELECT S.Nombre AS Sucursal, C.Nombre AS Categoria, SUM(D.Cantidad) AS Cantidad FROM Ordenes AS O
INNER JOIN DetallesOrdenes AS D ON O.OrdenID = D.OrdenID
INNER JOIN Productos AS P ON D.ProductoID = P.ProductoID 
INNER JOIN Categorias AS C ON P.CategoriaID = C.CategoriaID
INNER JOIN Sucursales AS S ON O.SucursalID = S.SucursalID
GROUP BY C.Nombre, S.Nombre



