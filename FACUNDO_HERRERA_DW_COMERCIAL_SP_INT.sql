--=====================================================================================


/****** Object:  StoredProcedure [dbo].[sp_carga_int_dim_categoria]    Script Date: 14/4/2023 00:09:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_carga_int_dim_categoria]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
       TRUNCATE TABLE [dbo].[INT_DIM_Categoria]

       -- Insertar datos desde la tabla origen
       INSERT INTO [dbo].[INT_DIM_Categoria]([DESC_CATEGORIA],[COD_CATEGORIA])
       SELECT UPPER([DESC_CATEGORIA]), [COD_CATEGORIA] 
	   FROM [dbo].[STG_DIM_Categoria]


END

GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_int_dim_cliente]    Script Date: 14/4/2023 00:10:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_carga_int_dim_cliente]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
       TRUNCATE TABLE [dbo].[INT_DIM_Cliente]

       -- Insertar datos desde la tabla origen
       INSERT INTO [dbo].[INT_DIM_Cliente]([COD_CLIENTE],[NOMBRE],[APELLIDO])
       SELECT 
		[COD_CLIENTE], 
		UPPER(LEFT([DESC_CLIENTE], LEN([DESC_CLIENTE]) - CHARINDEX(' ', REVERSE([DESC_CLIENTE])))),
		UPPER(RIGHT([DESC_CLIENTE], CHARINDEX(' ', REVERSE([DESC_CLIENTE])) - 1))
		FROM [dbo].[STG_DIM_Cliente]

END

GO

--=====================================================================================


/****** Object:  StoredProcedure [dbo].[sp_carga_int_dim_pais]    Script Date: 14/4/2023 00:10:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_carga_int_dim_pais]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
       TRUNCATE TABLE [dbo].[INT_DIM_Pais]

       -- Insertar datos desde la tabla origen
       INSERT INTO [dbo].[INT_DIM_Pais]([DESC_PAIS],[COD_PAIS])
       SELECT 
			UPPER([DESC_PAIS]), 
			[COD_PAIS] 
	   FROM [dbo].[STG_DIM_Pais]


END

GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_int_dim_producto]    Script Date: 14/4/2023 00:10:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_carga_int_dim_producto]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
       TRUNCATE TABLE [dbo].[INT_DIM_Producto]

       -- Insertar datos desde la tabla origen
       INSERT INTO [dbo].[INT_DIM_Producto]([DESC_PRODUCTO],[COD_PRODUCTO])
       SELECT UPPER([DESC_PRODUCTO]), [COD_PRODUCTO]
	   FROM [dbo].[STG_DIM_Producto]


END

GO


--=====================================================================================


/****** Object:  StoredProcedure [dbo].[sp_carga_int_dim_sucursal]    Script Date: 14/4/2023 00:10:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_carga_int_dim_sucursal]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
       TRUNCATE TABLE [dbo].[INT_DIM_Sucursal]

       -- Insertar datos desde la tabla origen
       INSERT INTO [dbo].[INT_DIM_Sucursal]([DESC_SUCURSAL],[COD_SUCURSAL])
       SELECT UPPER([DESC_SUCURSAL]), [COD_SUCURSAL]
	   FROM [dbo].[STG_DIM_Sucursal]


END

GO

--=====================================================================================


/****** Object:  StoredProcedure [dbo].[sp_carga_int_dim_vendedor]    Script Date: 14/4/2023 00:10:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_carga_int_dim_vendedor]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
       TRUNCATE TABLE [dbo].[INT_DIM_Vendedor]

       -- Insertar datos desde la tabla origen
       INSERT INTO [dbo].[INT_DIM_Vendedor]([COD_VENDEDOR],[NOMBRE],[APELLIDO])
       SELECT 
		RIGHT(COD_VENDEDOR, LEN(COD_VENDEDOR)-1), --Removemos la letra principal para el pasaje a INT posterior
		LEFT([DESC_VENDEDOR], LEN([DESC_VENDEDOR]) - CHARINDEX(' ', REVERSE([DESC_VENDEDOR]))),
		RIGHT([DESC_VENDEDOR], CHARINDEX(' ', REVERSE([DESC_VENDEDOR])) - 1)
		FROM [dbo].[STG_DIM_Vendedor]

END

GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_int_fact_ventas]    Script Date: 14/4/2023 00:11:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_carga_int_fact_ventas]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
		TRUNCATE TABLE [dbo].[INT_FACT_Ventas]

       -- Insertar datos desde la tabla origen
		INSERT INTO [dbo].[INT_FACT_Ventas](
			[COD_PRODUCTO],
			[COD_CATEGORIA],
			[COD_CLIENTE],
			[COD_PAIS],
			[COD_VENDEDOR],
			[COD_SUCURSAL],
			[FECHA],
			[CANTIDAD_VENDIDA],
			[MONTO_VENDIDO],
			[PRECIO],
			[COMISION_COMERCIAL])
		SELECT 
			CAST([COD_PRODUCTO] AS VARCHAR(100)),
			CAST([COD_CATEGORIA] AS VARCHAR(100)),
			CAST([COD_CLIENTE] AS VARCHAR(100)),
			CAST([COD_PAIS] AS VARCHAR(100)),
			CAST(STUFF([COD_VENDEDOR], 1, 1, '') AS VARCHAR(100)),--Removemos primer caracter
			CAST([COD_SUCURSAL] AS VARCHAR(100)),
			CAST([FECHA] AS smalldatetime),
			CAST([CANTIDAD_VENDIDA] AS DECIMAL(18,2)),
			ABS(CAST([MONTO_VENDIDO] AS DECIMAL(18,2))),--Removemos valores negativos
			ABS(CAST([PRECIO] AS DECIMAL(18,2))),       --Removemos valores negativos
			CAST([COMISION_COMERCIAL] AS DECIMAL(18,2))
		FROM [dbo].[STG_FACT_Ventas]



END
GO
