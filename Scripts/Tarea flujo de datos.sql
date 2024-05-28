========================= TAREA FLUJO DE DATOS ========================= 

-- CARGA DESDE JARDINERÍA A STAGING


-- PROCESO Tb_catProdcuto 
SELECT Id_Categoria, Desc_Categoria, descripcion_texto
FROM Categoria_producto
ORDER BY Id_Categoria

CREATE TABLE "Tb_catProdcuto" (
    "Id_Categoria" int identity(1,1),
    "Id_Categoria_o" int,
    "Desc_Categoria" nvarchar(50),
    "descripcion_texto" nvarchar(max)
PRIMARY KEY("Id_Categoria")
)

---


-- PROCESO Tb_Cliente 
select ID_cliente, nombre_cliente, CONCAT(nombre_contacto, ' ', apellido_contacto) as Contacto, telefono, ciudad, Region, pais, ID_empleado_rep_ventas
from cliente
order by ID_cliente;

CREATE TABLE "Tb_Cliente" (
    "ID_cliente" int identity(1,1),
    "ID_cliente_o" int,
    "nombre_cliente" nvarchar(50),
    "Contacto" nvarchar(61),
    "telefono" nvarchar(15),
    "ciudad" nvarchar(50),
    "Region" nvarchar(50),
    "pais" nvarchar(50),
    "ID_empleado_rep_ventas" int
PRIMARY KEY("ID_cliente")
)

---


-- PROCESO Tb_DetallePedido 
select id_pedido, ID_producto, cantidad, precio_unidad
from  detalle_pedido
order by ID_pedido, numero_linea


CREATE TABLE "Tb_DetallePedido" (
    "id_pedido" int identity(1,1),
    "id_pedido_o" int,
    "ID_producto" nvarchar(15),
    "cantidad" int,
    "precio_unidad" numeric(15,2)
PRIMARY KEY("id_pedido")
)

--

-- PROCESO Tb_Empleado
select ID_empleado, nombre, apellido1, email, ID_oficina, puesto
from empleado
order by ID_empleado


CREATE TABLE "Tb_Empleado" (
    "ID_empleado" int identity(1,1),
    "ID_empleado_o" int,
    "nombre" nvarchar(50),
    "apellido1" nvarchar(50),
    "email" nvarchar(100),
    "ID_oficina" int,
    "puesto" nvarchar(50)
PRIMARY KEY("ID_empleado")
)

--

-- PROCESO Tb_Oficina
Select ID_oficina, ciudad, pais, telefono
FROM oficina
order by ID_oficina

CREATE TABLE "Tb_Oficina" (
    "ID_oficina" int identity(1,1),
    "ID_oficina_o" int ,
    "ciudad" nvarchar(30),
    "pais" nvarchar(50),
    "telefono" nvarchar(20)
PRIMARY KEY("ID_oficina")
)

--

-- PROCESO Tb_Pago
SELECT ID_cliente, id_transaccion, fecha_pago, total 
FROM pago
ORDER BY ID_cliente, fecha_pago

CREATE TABLE "Tb_Pago" (
    "ID_cliente" int identity(1,1),
    "ID_cliente_o" int,
    "id_transaccion" nvarchar(50),
    "fecha_pago" date,
    "total" numeric(15,2)
PRIMARY KEY("ID_cliente")

)

--


-- PROCESO Tb_Pedido
SELECT ID_pedido, ID_cliente, fecha_pedido, fecha_entrega, estado 
FROM pedido;

CREATE TABLE "Tb_Pedido" (
    "ID_pedido" int identity(1,1),
    "ID_pedido_o" int ,
    "ID_cliente" int,
    "fecha_pedido" date,
    "fecha_entrega" date,
    "estado" nvarchar(15)
PRIMARY KEY("ID_pedido")
)


---

-- PROCESO Tb_Producto
select ID_producto, nombre, descripcion, Categoria, precio_venta, precio_proveedor
from producto
ORDER BY ID_producto

CREATE TABLE "Tb_Producto" (
    "ID_producto" int  identity(1,1),
    "ID_producto_o" nvarchar(15),
    "nombre" nvarchar(70),
    "descripcion" nvarchar(max),
    "Categoria" int,
    "precio_venta" numeric(15,2),
    "precio_proveedor" numeric(15,2)
PRIMARY KEY("ID_producto")
)

--

-- PROCESO Tb_Tiempo
select distinct fecha_pedido
from pedido

CREATE TABLE "Tb_Tiempo" (
	"ID_Fecha" int
    "fecha_pedido" date
PRIMARY KEY("ID_Fecha")
)

--



========================================================================