-- Creación DAtamart 


=====================================================
             DIMENSIONES STAGING
=====================================================
/* Dimension tiempo */
CREATE TABLE "DIM_Tiempo" (
    "Id_Fecha" int,
    "fecha_pedido" date,
    "Dia" int,
    "Mes" int,
    "Año" int
primary key ("Id_Fecha")
)

/* DIMENSIÓN CLIENTE */
CREATE TABLE "DIM_Cliente" (
    "ID_cliente_o" int,
    "nombre_cliente" nvarchar(50),
    "ciudad" nvarchar(50),
    "Region" nvarchar(50),
    "pais" nvarchar(50),
    "ID_cliente_DIM" int
)


/* DIMENSIÓN PRODUCTO*/
CREATE TABLE "DIM_Producto" (
    "ID_producto" int,
    "codigo_producto" nvarchar(15),
    "nombre" nvarchar(70),
    "descripcion" nvarchar(max),
    "Categoria" int,
    "precio_venta" numeric(15,2)
primary key ("ID_producto")
)


/* DIMENSION EMPLEADO*/
CREATE TABLE "DIM_Empleado" (
    "ID_empleado_o" int,
    "nombre" nvarchar(50),
    "apellido1" nvarchar(50),
    "puesto" nvarchar(50),
    "ID_empleado_DIM" int
)


/* DIMENSION PAGO */
CREATE TABLE "DIM_Pago" (
    "ID_cliente" int,
    "fecha_pago" date,
    "total" numeric(15,2),
    "ID_Pago" int
)

=====================================================
            TABLA FACT VENTAS STATGING 
=====================================================	

--Tabla Fact
select 
cli.ID_Cliente,prod.ID_Producto, e.ID_empleado_o, dpg.ID_Pago, dp.id_pedido_o, dmt.Id_Fecha, dp.cantidad, dpg.total, dpg.fecha_pago, dmt.Año
FROM Tb_Cliente cli
inner Join Tb_Pago tpg on cli.ID_cliente = tpg.ID_cliente
inner join Tb_Pedido p on cli.ID_cliente = p.ID_cliente
inner join Tb_DetallePedido dp on dp.id_pedido_o = p.ID_pedido_o 
inner join Tb_Empleado e on e.ID_empleado_o = cli.ID_empleado_rep_ventas
inner join DIM_Pago dpg on dpg.fecha_pago = tpg.fecha_pago
inner join DIM_Tiempo dmt on p.fecha_pedido = dmt.fecha_pedido
inner Join DIM_Producto prod on prod.codigo_producto = dp.ID_producto 
order by cli.ID_cliente asc



CREATE TABLE "FACT_VENTAS" (
    "ID_Venta" int identity(1,1),
    "ID_Cliente" int,
    "ID_Producto" int,
    "ID_empleado_o" int,
    "ID_Pago" int,
    "id_pedido_o" int,
    "Id_Fecha" int,
    "cantidad" int,
    "total" numeric(15,2),
    "fecha_pago" date,
    "Año" int
	primary key ("ID_Venta")
)

=====================================================
             DIMENSIONES DATAMART
=====================================================

/* Dimension tiempo */
CREATE TABLE "DIM_Tiempo" (
    "Id_Fecha" int,
    "fecha_pedido" date,
    "Dia" int,
    "Mes" int,
    "Año" int
PRIMARY KEY ("Id_Fecha")
)


/* DIMENSIÓN CLIENTE */
CREATE TABLE "DIM_Cliente" (
    "ID_cliente" int,
    "nombre_cliente" nvarchar(50),
    "ciudad" nvarchar(50),
    "pais" nvarchar(50),
    "region" nvarchar(50),
PRIMARY KEY ("ID_cliente")
)


/* DIMENSIÓN PRODUCTO*/
CREATE TABLE "DIM_Producto" (
    "ID_producto" int,
    "codigo_producto" nvarchar(15),
    "nombre" nvarchar(70),
    "descripcion" nvarchar(max),
    "Categoria" int,
    "precio_venta" numeric(15,2),
primary key ("ID_producto")
)


/* DIMENSION EMPLEADO*/
CREATE TABLE "DIM_Empleado" (
    "ID_empleado" int,
    "nombre_Empleado" nvarchar(50),
    "apellido_Empleado" nvarchar(50),
    "puesto" nvarchar(50),
primary key ("ID_empleado")
)


/* DIMENSION PAGO */
CREATE TABLE "Destino de ADO NET" (
    "ID_Pago" int,
    "total" numeric(15,2),
    "fecha_pago" date
primary key ("ID_Pago")
)



https://github.com/zandiegho/Staging_Jardineria/