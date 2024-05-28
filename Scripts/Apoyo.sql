--TABLAS 
/*
CATEGORIA
SUBCATEGORIA
TIEMPO
PROMOCION
PRODUCTO
CLIENTE
PERSON
EMAILPERSONA
TASAACTUAL
DIVISA
ENCABEZADOVENTAS
DETALLEVENTA
*/

CREATE TABLE "Tb_Producto" (
    "ProductID" int identity(1,1),
    "ProductID_o" int,
    "Name" nvarchar(50),
    "Color" nvarchar(15),
    "ProductNumber" nvarchar(25),
    "ReorderPoint" smallint,
    "StandardCost" money,
    "SafetyStockLevel" smallint,
    "ListPrice" money,
    "ProductLine" nvarchar(2),
    "Class" nvarchar(2),
    "Style" nvarchar(2),
    "ProductSubcategoryID" int
primary key("ProductID")
)

CREATE TABLE "Tb_Subcategoria" (
    "ProductSubcategoryID" int identity(1,1),
    "ProductSubcategoryID" int,
    "ProductCategoryID" int,
    "Name" nvarchar(50)
	primary key("ProductSubcategoryID")
)

CREATE TABLE "Tb_Tiempo" (
    "ID_Tiempo" int identity(1,1),
    "OrderDate" datetime
primary key ("ID_Tiempo")
)

CREATE TABLE "Tb_Cliente" (
    "CustomerID" int identity(1,1),
    "CustomerID_o" int,
    "PersonID" int,
    "StoreID" int,
    "TerritoryID" int,
    "AccountNumber" nvarchar(10)
	primary key("CustomerID")
)

CREATE TABLE "Tb_Persona" (
    "BusinessEntityID" int identity(1,1),
    "BusinessEntityID_o" int,
    "PersonType" nvarchar(2),
    "NameStyle" bit,
    "Title" nvarchar(8),
    "FirstName" nvarchar(50),
    "MiddleName" nvarchar(50),
    "LastName" nvarchar(50),
    "EmailPromotion" int
primary key("BusinessEntityID")
)

CREATE TABLE "Tb_EmailPersona" (
    "BusinessEntityID" int identity(1,1),
    "BusinessEntityID_o" int,
    "EmailAddressID" int,
    "EmailAddress" nvarchar(50)
primary key("BusinessEntityID")
)

CREATE TABLE "Tb_Promocion" (
    "SpecialOfferID" int identity(1,1),
    "SpecialOfferID_o" int,
    "Description" nvarchar(255),
    "DiscountPct" numeric(20,10),
    "Type" nvarchar(50),
    "Category" nvarchar(50),
    "MinQty" int,
    "MaxQty" int
	primary key("SpecialOfferID")
)

CREATE TABLE "Tb_TasaActual" (
    "CurrencyRateID" int identity(1,1),
    "CurrencyRateID_o" int,
    "FromCurrencyCode" nvarchar(3),
    "ToCurrencyCode" nvarchar(3),
    "AverageRate" money,
    "EndOfDayRate" money
primary key("CurrencyRateID")
)

CREATE TABLE "Tb_Divisa" (
    "id_divisa" int identity(1,1),
    "CurrencyCode_o" nvarchar(3),
    "Name" nvarchar(50)
primary key("id_divisa")	
)

CREATE TABLE "Tb_EncabezadoVenta" (
    "SalesOrderID" int identity(1,1),
    "SalesOrderID_o" int,
    "OrderDate" datetime,
    "CustomerID" int,
    "SalesOrderNumber" nvarchar(25),
    "SalesPersonID" int,
    "TerritoryID" int,
    "SubTotal" money,
    "TaxAmt" money,
    "Freight" money,
    "TotalDue" money,
    "CurrencyRateID" int
primary key("SalesOrderID")
)

CREATE TABLE "Tb_DetalleVenta" (
    "SalesOrderID" int identity(1,1),
    "SalesOrderID_o" int,
    "SalesOrderDetailID" int,
    "CarrierTrackingNumber" nvarchar(25),
    "OrderQty" smallint,
    "ProductID" int,
    "SpecialOfferID" int,
    "UnitPrice" money,
    "UnitPriceDiscount" money,
    "LineTotal" numeric(38,6)
primary key("SalesOrderID")
)

 identity(1,1)
primary key("")



TRUNCATE TABLE Tb_Categoria
TRUNCATE TABLE Tb_Cliente
TRUNCATE TABLE Tb_DetalleVenta
TRUNCATE TABLE Tb_Divisa
TRUNCATE TABLE Tb_EmailPersona
TRUNCATE TABLE Tb_EncabezadoVenta
TRUNCATE TABLE Tb_Persona
TRUNCATE TABLE Tb_Producto
TRUNCATE TABLE Tb_Promocion
TRUNCATE TABLE Tb_Subcategoria
TRUNCATE TABLE Tb_TasaActual
TRUNCATE TABLE Tb_Tiempo
TRUNCATE TABLE TbCliente