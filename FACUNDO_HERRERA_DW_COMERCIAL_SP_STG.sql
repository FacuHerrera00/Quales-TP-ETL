USE [DW_COMERCIAL]
GO

/****** Object:  StoredProcedure [dbo].[sp_carga_stg_dim_categoria]    Script Date: 14/4/2023 00:06:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_carga_stg_dim_categoria]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
       TRUNCATE TABLE [dbo].[STG_DIM_Categoria]

       -- Insertar datos desde la tabla origen
       INSERT INTO [dbo].[STG_DIM_Categoria]
       SELECT * FROM [DB_COMERCIAL].[dbo].[Categoria]


END


GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_stg_dim_categoria]    Script Date: 14/4/2023 00:06:06 ******/

CREATE PROCEDURE [dbo].[sp_carga_stg_dim_cliente]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
		TRUNCATE TABLE [dbo].[STG_DIM_Cliente]

       -- Insertar datos desde la tabla origen
		INSERT INTO [dbo].[STG_DIM_Cliente]
		SELECT * FROM [DB_COMERCIAL].[dbo].[Cliente]


END
GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_stg_dim_pais]    Script Date: 14/4/2023 00:07:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_carga_stg_dim_pais]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
		TRUNCATE TABLE [dbo].[STG_DIM_Pais]

       -- Insertar datos desde la tabla origen
		INSERT INTO [dbo].[STG_DIM_Pais]
		SELECT * FROM [DB_COMERCIAL].[dbo].[Pais]


END


GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_stg_dim_producto]    Script Date: 14/4/2023 00:08:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_carga_stg_dim_producto]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
		TRUNCATE TABLE [dbo].[STG_DIM_Producto]

       -- Insertar datos desde la tabla origen
		INSERT INTO [dbo].[STG_DIM_Producto]
		SELECT P.Desc_Producto, P.COD_Producto --Muchas columnas nulas en la primera carga, tomamos solamente la "desc" y "cod"
		FROM [DB_COMERCIAL].[dbo].[Producto] AS P


END
GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_stg_dim_sucursal]    Script Date: 14/4/2023 00:08:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_carga_stg_dim_sucursal]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
		TRUNCATE TABLE [dbo].[STG_DIM_Sucursal]

       -- Insertar datos desde la tabla origen
		INSERT INTO [dbo].[STG_DIM_Sucursal]
		SELECT * FROM [DB_COMERCIAL].[dbo].[Sucursal]


END
GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_stg_dim_vendedor]    Script Date: 14/4/2023 00:08:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_carga_stg_dim_vendedor]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
		TRUNCATE TABLE [dbo].[STG_DIM_Vendedor]

       -- Insertar datos desde la tabla origen
		INSERT INTO [dbo].[STG_DIM_Vendedor]
		SELECT * FROM [DB_COMERCIAL].[dbo].[Vendedor]


END
GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_stg_fact_ventas]    Script Date: 14/4/2023 00:09:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_carga_stg_fact_ventas]

AS
BEGIN
    SET NOCOUNT ON;

       -- Vaciar la tabla destino
		TRUNCATE TABLE [dbo].[STG_FACT_Ventas]

       -- Insertar datos desde la tabla origen
		INSERT INTO [dbo].[STG_FACT_Ventas]
		SELECT 
			[COD_PRODUCTO],
			[COD_CATEGORIA],
			[COD_CLIENTE],
			[COD_PAIS],
			[COD_VENDEDOR],
			[COD_SUCURSAL],
			[Fecha],
			[Cantidad_Vendida],
			[Monto_Vendido],
			[Precio],
			[Comision_Comercial]
		FROM [DB_COMERCIAL].[dbo].[Ventas]



END
GO



