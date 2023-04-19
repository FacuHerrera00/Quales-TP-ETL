--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_dim_categoria]    Script Date: 14/4/2023 00:11:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================

CREATE PROCEDURE [dbo].[sp_carga_dim_categoria]
	-- Add the parameters for the stored procedure here

AS
BEGIN

	SET NOCOUNT ON;
	-- DECLARO UNA VARIABLE PARA TOMAR LA FECHA ACTUAL
	DECLARE @fecha_actual DATETIME
	SET @fecha_actual = GETDATE()

    -- ACTUALIZO REGISTROS EXISTENTES, FECHA UPDATE Y USUARIO UPDATE
	UPDATE d
	SET
	d.DESC_CATEGORIA = i.DESC_CATEGORIA,
	d.FECHA_UPDATE = @fecha_actual,
	d.USUARIO_UPDATE = SUSER_SNAME()
	FROM DIM_Categoria AS d
		INNER JOIN INT_DIM_Categoria i
		ON d.COD_CATEGORIA = i.COD_CATEGORIA
	
	--INGRESO REGISTROS NUEVOS
	INSERT INTO DIM_Categoria
	(
		d.COD_CATEGORIA,
		d.DESC_CATEGORIA,
		d.FECHA_ALTA,
		d.USUARIO_ALTA,
		d.FECHA_UPDATE,
		d.USUARIO_UPDATE
	)
	SELECT 
	i.COD_CATEGORIA,
	i.DESC_CATEGORIA,
	@fecha_actual,
	SUSER_SNAME(),
	@fecha_actual,
	SUSER_SNAME()
	FROM INT_DIM_Categoria i
		LEFT JOIN DIM_Categoria d
		ON i.COD_CATEGORIA = d.COD_CATEGORIA
	WHERE d.COD_CATEGORIA IS NULL
END
GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_dim_cliente]    Script Date: 14/4/2023 00:12:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================

CREATE PROCEDURE [dbo].[sp_carga_dim_cliente]
	-- Add the parameters for the stored procedure here

AS
BEGIN

	SET NOCOUNT ON;
	-- DECLARO UNA VARIABLE PARA TOMAR LA FECHA ACTUAL
	DECLARE @fecha_actual DATETIME
	SET @fecha_actual = GETDATE()

    -- ACTUALIZO REGISTROS EXISTENTES, FECHA UPDATE Y USUARIO UPDATE
	UPDATE d
	SET
	d.NOMBRE = i.NOMBRE,
	d.APELLIDO = i.APELLIDO,
	d.FECHA_UPDATE = @fecha_actual,
	d.USUARIO_UPDATE = SUSER_SNAME()
	FROM DIM_Cliente D
		INNER JOIN INT_DIM_Cliente i
		ON d.COD_CLIENTE = i.COD_CLIENTE
	
	--INGRESO REGISTROS NUEVOS
	INSERT INTO DIM_Cliente
	(
		d.COD_CLIENTE,
		d.NOMBRE,
		d.APELLIDO,
		d.FECHA_ALTA,
		d.USUARIO_ALTA,
		d.FECHA_UPDATE,
		d.USUARIO_UPDATE
	)
	SELECT 
	i.COD_CLIENTE,
	i.NOMBRE,
	i.APELLIDO,
	@fecha_actual,
	SUSER_SNAME(),
	@fecha_actual,
	SUSER_SNAME()
	FROM INT_DIM_Cliente i
		LEFT JOIN DIM_Cliente d
		ON i.COD_CLIENTE = d.COD_CLIENTE
	WHERE d.COD_CLIENTE IS NULL
END
GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_dim_pais]    Script Date: 14/4/2023 00:12:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================

CREATE PROCEDURE [dbo].[sp_carga_dim_pais]
	-- Add the parameters for the stored procedure here

AS
BEGIN

	SET NOCOUNT ON;
	-- DECLARO UNA VARIABLE PARA TOMAR LA FECHA ACTUAL
	DECLARE @fecha_actual DATETIME
	SET @fecha_actual = GETDATE()

    -- ACTUALIZO REGISTROS EXISTENTES, FECHA UPDATE Y USUARIO UPDATE
	UPDATE d
	SET
	d.DESC_PAIS = i.DESC_PAIS,
	d.FECHA_UPDATE = @fecha_actual,
	d.USUARIO_UPDATE = SUSER_SNAME()
	FROM DIM_Pais D
		INNER JOIN INT_DIM_Pais i
		ON d.COD_PAIS = i.COD_PAIS
	
	--INGRESO REGISTROS NUEVOS
	INSERT INTO DIM_Pais
	(
		d.COD_PAIS,
		d.DESC_PAIS,
		d.FECHA_ALTA,
		d.USUARIO_ALTA,
		d.FECHA_UPDATE,
		d.USUARIO_UPDATE
	)
	SELECT 
	i.COD_PAIS,
	i.DESC_PAIS,
	@fecha_actual,
	SUSER_SNAME(),
	@fecha_actual,
	SUSER_SNAME()
	FROM INT_DIM_Pais i
		LEFT JOIN DIM_Pais d
		ON i.COD_PAIS = d.COD_PAIS
	WHERE d.COD_PAIS IS NULL
END
GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_dim_producto]    Script Date: 14/4/2023 00:12:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================

CREATE PROCEDURE [dbo].[sp_carga_dim_producto]


AS
BEGIN

	SET NOCOUNT ON;
	-- DECLARO UNA VARIABLE PARA TOMAR LA FECHA ACTUAL
	DECLARE @fecha_actual DATETIME
	SET @fecha_actual = GETDATE()

    -- ACTUALIZO REGISTROS EXISTENTES, FECHA UPDATE Y USUARIO UPDATE
	UPDATE d
	SET
	d.DESC_PRODUCTO = i.DESC_PRODUCTO,
	d.FECHA_UPDATE = @fecha_actual,
	d.USUARIO_UPDATE = SUSER_SNAME()
	FROM DIM_Producto D
		INNER JOIN INT_DIM_Producto i
		ON d.COD_PRODUCTO = i.COD_PRODUCTO
	
	--INGRESO REGISTROS NUEVOS
	INSERT INTO DIM_Producto
	(
		d.COD_PRODUCTO,
		d.DESC_PRODUCTO,
		d.FECHA_ALTA,
		d.USUARIO_ALTA,
		d.FECHA_UPDATE,
		d.USUARIO_UPDATE
	)
	SELECT 
	i.COD_PRODUCTO,
	i.DESC_PRODUCTO,
	@fecha_actual,
	SUSER_SNAME(),
	@fecha_actual,
	SUSER_SNAME()
	FROM INT_DIM_Producto i
		LEFT JOIN DIM_Producto d
		ON i.COD_PRODUCTO = d.COD_PRODUCTO
	WHERE d.COD_PRODUCTO IS NULL
END
GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_dim_sucursal]    Script Date: 14/4/2023 00:12:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================

CREATE PROCEDURE [dbo].[sp_carga_dim_sucursal]


AS
BEGIN

	SET NOCOUNT ON;
	-- DECLARO UNA VARIABLE PARA TOMAR LA FECHA ACTUAL
	DECLARE @fecha_actual DATETIME
	SET @fecha_actual = GETDATE()

    -- ACTUALIZO REGISTROS EXISTENTES, FECHA UPDATE Y USUARIO UPDATE
	UPDATE d
	SET
	d.DESC_SUCURSAL = i.DESC_SUCURSAL,
	d.FECHA_UPDATE = @fecha_actual,
	d.USUARIO_UPDATE = SUSER_SNAME()
	FROM DIM_Sucursal D
		INNER JOIN INT_DIM_Sucursal i
		ON d.COD_SUCURSAL = i.COD_SUCURSAL
	
	--INGRESO REGISTROS NUEVOS
	INSERT INTO DIM_Sucursal
	(
		d.COD_SUCURSAL,
		d.DESC_SUCURSAL,
		d.FECHA_ALTA,
		d.USUARIO_ALTA,
		d.FECHA_UPDATE,
		d.USUARIO_UPDATE
	)
	SELECT 
	i.COD_SUCURSAL,
	i.DESC_SUCURSAL,
	@fecha_actual,
	SUSER_SNAME(),
	@fecha_actual,
	SUSER_SNAME()
	FROM INT_DIM_Sucursal i
		LEFT JOIN DIM_Sucursal d
		ON i.COD_SUCURSAL = d.COD_SUCURSAL
	WHERE d.COD_SUCURSAL IS NULL
END
GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_dim_vendedor]    Script Date: 14/4/2023 00:12:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================

CREATE PROCEDURE [dbo].[sp_carga_dim_vendedor]

AS
BEGIN

	SET NOCOUNT ON;
	-- DECLARO UNA VARIABLE PARA TOMAR LA FECHA ACTUAL
	DECLARE @fecha_actual DATETIME
	SET @fecha_actual = GETDATE()

    -- ACTUALIZO REGISTROS EXISTENTES, FECHA UPDATE Y USUARIO UPDATE
	UPDATE d
	SET
	d.NOMBRE = i.NOMBRE,
	d.APELLIDO = i.APELLIDO,
	d.FECHA_UPDATE = @fecha_actual,
	d.USUARIO_UPDATE = SUSER_SNAME()
	FROM DIM_Vendedor d
		INNER JOIN INT_DIM_Vendedor i
		ON d.COD_VENDEDOR = i.COD_VENDEDOR
	
	--INGRESO REGISTROS NUEVOS
	INSERT INTO DIM_Vendedor
	(
		d.COD_VENDEDOR,
		d.NOMBRE,
		d.APELLIDO,
		d.FECHA_ALTA,
		d.USUARIO_ALTA,
		d.FECHA_UPDATE,
		d.USUARIO_UPDATE
	)
	SELECT 
	i.COD_VENDEDOR,
	i.NOMBRE,
	i.APELLIDO,
	@fecha_actual,
	SUSER_SNAME(),
	@fecha_actual,
	SUSER_SNAME()
	FROM INT_DIM_Vendedor i
		LEFT JOIN DIM_Vendedor d
		ON i.COD_VENDEDOR = d.COD_VENDEDOR
	WHERE d.COD_VENDEDOR IS NULL
END
GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_carga_fact_ventas]    Script Date: 14/4/2023 00:13:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================

CREATE PROCEDURE [dbo].[sp_carga_fact_ventas]

	@fechaDesde smalldatetime,
	@fechaHasta smalldatetime


AS
BEGIN

	DECLARE @fecha_actual smalldatetime SET @fecha_actual = GETDATE()
	DECLARE @usuario varchar(128) SET @usuario = SUSER_SNAME()

	SET NOCOUNT ON;
	DELETE FROM [dbo].[FACT_Ventas]
	WHERE TIEMPO_KEY BETWEEN @fechaDesde AND @fechaHasta

    -- INSERTO NUEVOS REGISTROS
	INSERT INTO [dbo].[FACT_Ventas]
	(
		[PRODUCTO_KEY],
		[CATEGORIA_KEY],
		[CLIENTE_KEY],
		[PAIS_KEY],
		[VENDEDOR_KEY],
		[SUCURSAL_KEY],
		[TIEMPO_KEY],
		[CANTIDAD_VENDIDA],
		[MONTO_VENDIDO],
		[PRECIO],
		[COMISION_COMERCIAL],
		[FECHA_ALTA],
		[USUARIO_ALTA]
	)
	SELECT 
		ISNULL(p.PRODUCTO_KEY,-1) as PRODUCTO_KEY,
		ISNULL(ca.CATEGORIA_KEY,-1) as CATEGORIA_KEY,
		ISNULL(cl.CLIENTE_KEY,-1) as CLIENTE_KEY,
		ISNULL(pa.PAIS_KEY,-1) as PAIS_KEY,
		ISNULL(v.VENDEDOR_KEY,-1) as VENDEDOR_KEY,
		ISNULL(s.SUCURSAL_KEY,-1) as SUCURSAL_KEY,
		ISNULL(tie.TIEMPO_KEY,'1900-01-01') as TIEMPO_KEY,
		i.[CANTIDAD_VENDIDA],
		i.[MONTO_VENDIDO],
		i.[PRECIO],
		i.[COMISION_COMERCIAL],
		@fecha_actual,
		@usuario
		
	FROM INT_FACT_Ventas i
		LEFT JOIN DIM_Producto p ON p.COD_PRODUCTO = i.COD_PRODUCTO
		LEFT JOIN DIM_Categoria ca ON ca.COD_CATEGORIA = i.COD_CATEGORIA
		LEFT JOIN DIM_Cliente cl ON cl.COD_CLIENTE = i.COD_CLIENTE
		LEFT JOIN DIM_Pais pa ON pa.COD_PAIS = i.COD_PAIS
		LEFT JOIN DIM_Vendedor v ON v.COD_VENDEDOR = i.COD_VENDEDOR
		LEFT JOIN DIM_Sucursal s ON s.COD_SUCURSAL = i.COD_SUCURSAL
		LEFT JOIN DIM_Tiempo tie ON tie.TIEMPO_KEY = i.FECHA
		WHERE i.FECHA BETWEEN @fechaDesde AND @fechaHasta

END
GO

--=====================================================================================

/****** Object:  StoredProcedure [dbo].[sp_genera_dim_tiempo]    Script Date: 14/4/2023 00:09:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[sp_genera_dim_tiempo]
 @anio Int
As
SET NOCOUNT ON
SET arithabort off
SET arithignore on
 
/**************/
/* Variables  */
/**************/
 
SET DATEFIRST 1;
SET DATEFORMAT mdy
DECLARE @dia smallint
DECLARE @mes smallint
DECLARE @f_txt  	varchar(10)
DECLARE @fecha  smalldatetime
DECLARE @key int
DECLARE @vacio  smallint
DECLARE @fin smallint
DECLARE @fin_mes int
DECLARE @anioperiodicidad int
  	
SELECT @dia  = 1
SELECT @mes  = 1
SELECT @f_txt = Convert(char(2), @mes) + '/' + Convert(char(2), @dia) + '/' + Convert(char(4), @anio)
SELECT @fecha = Convert(smalldatetime, @f_txt)
select @anioperiodicidad = @anio
 
 
/************************************/
/* Se chequea que el a¤o a procesar */
/* no exista en la tabla TIME   	*/
/************************************/
 
 
IF (SELECT Count(*) FROM dim_tiempo WHERE anio = @anio) > 0
  BEGIN
    	Print 'El año que ingreso ya existe en la tabla'
         	Print 'Procedimiento CANCELADO.................'
         	 Return 0
  END
 
 
/*************************/
/* Se inserta d¡a a d¡a  */
/* hasta terminar el a¤o */
/*************************/
 
SELECT @fin = @anio + 1
WHILE (@anio < @fin)
  BEGIN
   	--Armo la fecha
   	IF Len(Rtrim(Convert(Char(2),Datepart(mm, @fecha))))=1
   	  BEGIN
         	IF Len(Rtrim(Convert(Char(2),Datepart(dd, @fecha))))=1
                	SET @f_txt = Convert(char(4),Datepart(yyyy, @fecha)) + '0' + Rtrim(Convert(Char(2),Datepart(mm, @fecha))) + '0' + Rtrim(Convert(Char(2),Datepart(dd, @fecha)))
         	ELSE
                	SET @f_txt = Convert(char(4),Datepart(yyyy, @fecha)) + '0' + Rtrim(Convert(Char(2),Datepart(mm, @fecha))) + Convert(Char(2),Datepart(dd, @fecha))
   	  END
   	ELSE
   	  BEGIN
         	IF Len(Rtrim(Convert(Char(2),Datepart(dd, @fecha))))=1
                	SET @f_txt = Convert(char(4),Datepart(yyyy, @fecha)) + Convert(Char(2),Datepart(mm, @fecha)) + '0' + Rtrim(Convert(Char(2),Datepart(dd, @fecha)))
         	ELSE
                	SET @f_txt = Convert(char(4),Datepart(yyyy, @fecha)) + Convert(Char(2),Datepart(mm, @fecha)) + Convert(Char(2),Datepart(dd, @fecha))
   	  END
   	--Calculo el último día del mes  
   	SET @fin_mes = day(dateadd(d, -1, dateadd(m, 1, dateadd(d, - day(@fecha) + 1, @fecha))))
 
INSERT Dim_Tiempo (Tiempo_Key, Anio, Mes_nro, Mes_Nombre, Semestre, Trimestre, Semana_Anio
                	,Semana_Nro_Mes, Dia, Dia_Nombre, Dia_Semana_Nro)
 
   	SELECT
         	  tiempo_key    	= @fecha
         	, anio                 	= Datepart(yyyy, @fecha)
         	, mes                  	= Datepart(mm, @fecha)
         	--, mes_nombre = Datename(mm, @fecha)
         	, mes_nombre  = CASE Datename(mm, @fecha)
                                    	when 'January'         	then 'Enero'
                                    	when 'February'        	then 'Febrero'
                                    	when 'March'    	then 'Marzo'
                                    	when 'April'    	then 'Abril'
                                    	when 'May'             	then 'Mayo'
                                    	when 'June'            	then 'Junio'
                                    	when 'July'            	then 'Julio'
                                    	when 'August'   	then 'Agosto'
                                    	when 'September'	then 'Septiembre'
                                    	when 'October'         	then 'Octubre'
                                    	when 'November'        	then 'Noviembre'
                                    	when 'December'        	then 'Diciembre'
                                    	else Datename(mm, @fecha)
                              	END
         	, semestre      	= CASE Datepart(mm, @fecha)
                                    	when (SELECT Datepart(mm, @fecha)
   	                                          	WHERE Datepart(mm, @fecha) between 1 and 6) then 1
                                    	else   2
                              	  END 
         	, trimestre            	= Datepart(qq, @fecha)
         	, semana_anio   	= Datepart(wk, @fecha)
         	, semana_nro_mes	= Datepart(wk, @fecha) - datepart(week, dateadd(dd,-day(@fecha)+1,@fecha)) +1
         	, dia                  	= Datepart(dd, @fecha)
   	   	, dia_nombre    	= CASE Datename(dw, @fecha)
                                    	when 'Monday'   	then 'Lunes'
                                    	when 'Tuesday'         	then 'Martes'
                                    	when 'Wednesday'	then 'Miercoles'
                                    	when 'Thursday'        	then 'Jueves'
                                    	when 'Friday'   	then 'Viernes'
                                    	when 'Saturday'        	then 'Sabado'
                                    	when 'Sunday'   	then 'Domingo'
                                    	else Datename(dw, @fecha)
                       	END
   	   	--, dia_nombre         	= Datename(dw, @fecha)
         	, dia_semana_nro	= Datepart(dw, @fecha)
         	   
   	SELECT @fecha = Dateadd(dd, 1, @fecha)
   	SELECT @dia     	= Datepart(dd, @fecha)
   	SELECT @mes     	= Datepart(mm, @fecha)
   	SELECT @anio  = Datepart(yy, @fecha) 	CONTINUE
   	
END
GO
