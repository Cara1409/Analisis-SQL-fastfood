CREATE DATABASE FastFood1

USE FastFood1

CREATE TABLE Ordenes (
OrdenID INT PRIMARY KEY IDENTITY(1,1),
ClienteID INT,
EmpleadoID INT,
SucursalID INT,
MensajeroID INT,
TipoPagoID INT,
OrigenID INT,
HorarioVenta DATETIME,
TotalCompra DECIMAL(20,2),
KilometrosRecorrer INT,
FechaDespacho DATE,
FechaEntrega DATE,
FechaOrdenTomada DATE,
FechaOrdenLista DATE)
 

--Edito el tipo de texto
ALTER TABLE Ordenes
ALTER COLUMN HorarioVenta VARCHAR(40)

--SELECT * FROM Ordenes

CREATE TABLE Empleados (
EmpleadoID INT PRIMARY KEY IDENTITY(1,1),
SucursalID INT,
Nombre VARCHAR(40),
Puesto VARCHAR(40),
Rol VARCHAR(40),
Departamento VARCHAR(40))

--SELECT * FROM Empleados

CREATE TABLE TiposDePago (
TipoPagoID INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(40))

--SELECT * FROM TiposDePago

CREATE TABLE Origenes (
OrigenID INT PRIMARY KEY IDENTITY(1,1),
Descripcion VARCHAR(40))

--SELECT * FROM Origenes

CREATE TABLE Mensajero (
MensajeroID INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(40),
EsExterno BIT)

--SELECT * FROM Mensajero

CREATE TABLE Sucursales (
SucursalID INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(40),
Direccion VARCHAR(40))

--SELECT * FROM Sucursales

CREATE TABLE Clientes (
ClientesID INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(40),
Direccion VARCHAR(40))

--SELECT * FROM Clientes

CREATE TABLE DetallesOrdenes (
OrdenID INT,
ProductoID INT,
Cantidad INT,
Precio DECIMAL(12,2),
PRIMARY KEY(OrdenID,ProductoID))

--SELECT * FROM DetallesOrdenes

CREATE TABLE Productos (
ProductoID INT PRIMARY KEY IDENTITY(1,1),
CategoriaID INT,
Nombre VARCHAR(40),
Precio DECIMAL(12,2))

--SELECT * FROM Productos

CREATE TABLE Categorias (
CategoriaID INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(40))

--SELECT * FROM Categorias

--Aplicamos las FOREIGN KEYS para relacionar las tablas correspondientes

ALTER TABLE Ordenes
ADD	CONSTRAINT FKOrdenesClientes FOREIGN KEY(ClienteID) REFERENCES Clientes(ClientesID)

ALTER TABLE Ordenes
ADD CONSTRAINT FKOrdenesEmpleados FOREIGN KEY(EmpleadoID) REFERENCES Empleados(EmpleadoID)

ALTER TABLE Ordenes
ADD CONSTRAINT FKOrdenesSucursales FOREIGN KEY(SucursalID) REFERENCES Sucursales(SucursalID)

ALTER TABLE Ordenes
ADD CONSTRAINT FKOrdenesMensajero FOREIGN KEY(MensajeroID) REFERENCES Mensajero(MensajeroID)

ALTER TABLE Ordenes
ADD CONSTRAINT FKOrdenesTiposDePago FOREIGN KEY(TipoPagoID) REFERENCES TiposDePago(TipoPagoID)

ALTER TABLE Ordenes 
ADD CONSTRAINT FKOrdenesOrigenes FOREIGN KEY(OrigenID) REFERENCES Origenes(OrigenID)

ALTER TABLE Empleados
ADD CONSTRAINT FKEmpleadosSUcursales FOREIGN KEY(SucursalID) REFERENCES Sucursales(SucursalID)

ALTER TABLE DetallesOrdenes
ADD CONSTRAINT FKDetallesOrdenesOrdenes FOREIGN KEY(OrdenID) REFERENCES Ordenes(OrdenID)

ALTER TABLE DetallesOrdenes
ADD CONSTRAINT FKDetallesOrdenesProductos FOREIGN KEY(ProductoID) REFERENCES Productos(ProductoID)

ALTER TABLE Productos
ADD CONSTRAINT FKProductosCategorias FOREIGN KEY(CategoriaID) REFERENCES Categorias(CategoriaID)