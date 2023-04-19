--INSERTAMOS VALORES -1 Y 0 A DIMENSIONES

USE [DW_COMERCIAL]
GO

--[dbo].[DIM_Categoria]

SET IDENTITY_INSERT [dbo].[DIM_Categoria] ON

INSERT INTO DIM_Categoria(CATEGORIA_KEY,COD_CATEGORIA,DESC_CATEGORIA)
VALUES (-1, 'S/E', 'S/E')

INSERT INTO DIM_Categoria(CATEGORIA_KEY,COD_CATEGORIA,DESC_CATEGORIA)
VALUES (0, 'N/A', 'N/A')

SET IDENTITY_INSERT [dbo].[DIM_Categoria] OFF

SELECT * FROM [dbo].[DIM_Categoria]

--[dbo].[DIM_Cliente]

SET IDENTITY_INSERT [dbo].[DIM_Cliente] ON

INSERT INTO [dbo].[DIM_Cliente]([CLIENTE_KEY],[COD_CLIENTE],[NOMBRE],[APELLIDO])
VALUES (-1,'S/E','S/E','S/E')

INSERT INTO [dbo].[DIM_Cliente]([CLIENTE_KEY],[COD_CLIENTE],[NOMBRE],[APELLIDO])
VALUES (0,'N/A','N/A','N/A')

SET IDENTITY_INSERT [dbo].[DIM_Cliente] OFF

SELECT * FROM [dbo].[DIM_Cliente]

--[dbo].[DIM_Pais]

SET IDENTITY_INSERT [dbo].[DIM_Pais] ON

INSERT INTO [dbo].[DIM_Pais]([PAIS_KEY],[COD_PAIS],[DESC_PAIS])
VALUES (-1, 'S/E', 'S/E')

INSERT INTO [dbo].[DIM_Pais]([PAIS_KEY],[COD_PAIS],[DESC_PAIS])
VALUES (0, 'N/A', 'N/A')

SET IDENTITY_INSERT [dbo].[DIM_Pais] OFF

SELECT * FROM [dbo].[DIM_Pais]

--[dbo].[DIM_Producto]

SET IDENTITY_INSERT [dbo].[DIM_Producto] ON

INSERT INTO [dbo].[DIM_Producto]([PRODUCTO_KEY],[COD_PRODUCTO],[DESC_PRODUCTO])
VALUES (-1, 'S/E', 'S/E')

INSERT INTO [dbo].[DIM_Producto]([PRODUCTO_KEY],[COD_PRODUCTO],[DESC_PRODUCTO])
VALUES (0, 'N/A', 'N/A')

SET IDENTITY_INSERT [dbo].[DIM_Producto] OFF

SELECT * FROM [dbo].[DIM_Producto]

--[dbo].[DIM_Sucursal]

SET IDENTITY_INSERT [dbo].[DIM_Sucursal] ON

INSERT INTO [dbo].[DIM_Sucursal]([SUCURSAL_KEY],[COD_SUCURSAL],[DESC_SUCURSAL])
VALUES (-1, 'S/E', 'S/E')

INSERT INTO [dbo].[DIM_Sucursal]([SUCURSAL_KEY],[COD_SUCURSAL],[DESC_SUCURSAL])
VALUES (0, 'N/A', 'N/A')

SET IDENTITY_INSERT [dbo].[DIM_Sucursal] OFF

SELECT * FROM [dbo].[DIM_Sucursal]

--[dbo].[DIM_Vendedor]

SET IDENTITY_INSERT [dbo].[DIM_Vendedor] ON

INSERT INTO [dbo].[DIM_Vendedor]([VENDEDOR_KEY],[COD_VENDEDOR],[NOMBRE],[APELLIDO])
VALUES (-1, -1, 'S/E', 'S/E')

INSERT INTO [dbo].[DIM_Vendedor]([VENDEDOR_KEY],[COD_VENDEDOR],[NOMBRE],[APELLIDO])
VALUES (0, 0, 'N/A', 'N/A')

SET IDENTITY_INSERT [dbo].[DIM_Vendedor] OFF

SELECT * FROM [dbo].[DIM_Vendedor]