--Consultas a realizar para validación
--1) Monto Total de Ventas ($)
--2) Cantidad vendida (#)
--3) Monto promedio de Ventas ($)
--4) Importe Comisión Comercial ($)
--5) Cantidad de Clientes (#)

--1)
SELECT SUM([Monto_Vendido]) AS Monto_Total_Ventas FROM [DB_COMERCIAL].[dbo].[Ventas]
SELECT SUM(MONTO_VENDIDO) AS Monto_Total_Ventas FROM FACT_Ventas
--$5.122.990.000,00--(SIN TRASFORMAR)
--$5.143.310.000,00--Transformadas las ventas con valores negativos

--2)
SELECT SUM([Cantidad_Vendida]) AS cantidad_vendida FROM [DB_COMERCIAL].[dbo].[Ventas]
SELECT SUM(CANTIDAD_VENDIDA) AS cantidad_vendida FROM FACT_Ventas
--#306.208,00--
--#306.208,00

--3)
SELECT SUM([Monto_Vendido]) / COUNT([Monto_Vendido]) AS promedio_ventas FROM [DB_COMERCIAL].[dbo].[Ventas]
SELECT SUM(MONTO_VENDIDO) / COUNT(MONTO_VENDIDO) AS promedio_ventas FROM FACT_Ventas;
--$427.200,63--ver valores negativos
--$428.895,096731-- el promedio subió

--4)
SELECT SUM([Comision_Comercial]) AS comision_total FROM [DB_COMERCIAL].[dbo].[Ventas]
SELECT SUM(COMISION_COMERCIAL) AS comision_total FROM FACT_Ventas
--$629.835.984,14000
--$629.835.984,14

--5)
SELECT COUNT(DISTINCT([COD_CLIENTE])) AS cant_clientes FROM [DB_COMERCIAL].[dbo].[Ventas]
SELECT COUNT(DISTINCT(CLIENTE_KEY)) AS cant_clientes FROM FACT_Ventas
--#795
--#795