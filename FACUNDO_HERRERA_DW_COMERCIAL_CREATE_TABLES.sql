USE [DW_COMERCIAL]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 6/4/2023 22:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Categoria](
	[CATEGORIA_KEY] Integer IDENTITY(1,1) NOT NULL,
	[COD_CATEGORIA] Varchar(500),
	[DESC_CATEGORIA] Varchar(500),
	[FECHA_ALTA] Datetime,
	[USUARIO_ALTA] Varchar(500),
	[FECHA_UPDATE] Datetime,
	[USUARIO_UPDATE] Varchar(500),
		 CONSTRAINT [PK_Categoria_CATEGORIA_KEY] PRIMARY KEY CLUSTERED 
(
	[CATEGORIA_KEY] ASC
)

) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[Cliente]    Script Date: 6/4/2023 22:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Cliente](
	[CLIENTE_KEY] Integer IDENTITY(1,1) NOT NULL,
	[COD_CLIENTE] Varchar(500),
	[NOMBRE] Varchar(500),
	[APELLIDO] Varchar(500),
	[FECHA_ALTA] Datetime,
	[USUARIO_ALTA] Varchar(500),
	[FECHA_UPDATE] Datetime,
	[USUARIO_UPDATE] Varchar(500),
		 CONSTRAINT [PK_Cliente_CLIENTE_KEY] PRIMARY KEY CLUSTERED 
(
	[CLIENTE_KEY] ASC
)

) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[Pais]    Script Date: 6/4/2023 22:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Pais](
	[PAIS_KEY] Integer IDENTITY(1,1) NOT NULL,
	[COD_PAIS] Varchar(3),
	[DESC_PAIS] Varchar(500),
	[FECHA_ALTA] Datetime,
	[USUARIO_ALTA] Varchar(500),
	[FECHA_UPDATE] Datetime,
	[USUARIO_UPDATE] Varchar(500),
		 CONSTRAINT [PK_Pais_PAIS_KEY] PRIMARY KEY CLUSTERED 
(
	[PAIS_KEY] ASC
)

) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[Producto]    Script Date: 6/4/2023 22:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Producto](
	[PRODUCTO_KEY] Integer IDENTITY(1,1) NOT NULL,
	[COD_PRODUCTO] Varchar(500),
	[DESC_PRODUCTO] Varchar(500),
	[FECHA_ALTA] Datetime,
	[USUARIO_ALTA] Varchar(500),
	[FECHA_UPDATE] Datetime,
	[USUARIO_UPDATE] Varchar(500),
		 CONSTRAINT [PK_Producto_PRODUCTO_KEY] PRIMARY KEY CLUSTERED 
(
	[PRODUCTO_KEY] ASC
)

) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[Sucursal]    Script Date: 6/4/2023 22:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Sucursal](
	[SUCURSAL_KEY] Integer IDENTITY(1,1) NOT NULL,
	[COD_SUCURSAL] Varchar(500),
	[DESC_SUCURSAL] Varchar(500),
	[FECHA_ALTA] Datetime,
	[USUARIO_ALTA] Varchar(500),
	[FECHA_UPDATE] Datetime,
	[USUARIO_UPDATE] Varchar(500),
		CONSTRAINT [PK_Sucursal_SUCURSAL_KEY] PRIMARY KEY CLUSTERED 
(
	[SUCURSAL_KEY] ASC
)

) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[DIM_TIEMPO]    Script Date: 6/4/2023 22:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Tiempo](
	[TIEMPO_KEY] smalldatetime NOT NULL,
	[ANIO] integer,
	[MES_NRO] integer,
	[MES_NOMBRE] varchar(15),
	[SEMESTRE] integer,
	[TRIMESTRE] integer,
	[SEMANA_ANIO] integer,
	[SEMANA_NRO_MES] integer,
	[DIA] integer,
	[DIA_NOMBRE] varchar(20),
	[DIA_SEMANA_NRO] integer,
	[FECHA_ALTA] Datetime,
	[USUARIO_ALTA] Varchar(500),
	[FECHA_UPDATE] Datetime,
	[USUARIO_UPDATE] Varchar(500),
		CONSTRAINT [PK_Tiempo_TIEMPO_KEY] PRIMARY KEY CLUSTERED 
(
	[TIEMPO_KEY] ASC
)
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[Vendedor]    Script Date: 6/4/2023 22:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Vendedor](
	[VENDEDOR_KEY] Integer IDENTITY(1,1) NOT NULL,
	[COD_VENDEDOR] Integer,
	[NOMBRE] Varchar(500),
	[APELLIDO] Varchar(500),
	[FECHA_ALTA] Datetime,
	[USUARIO_ALTA] Varchar(500),
	[FECHA_UPDATE] Datetime,
	[USUARIO_UPDATE] Varchar(500),
	 CONSTRAINT [PK_Vendedor_VENDEDOR_KEY] PRIMARY KEY CLUSTERED 
(
	[VENDEDOR_KEY] ASC
)
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[STG_FACT_Ventas]    Script Date: 11/4/2023 19:23:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FACT_Ventas](
	[PRODUCTO_KEY] INTEGER CONSTRAINT FK_Producto REFERENCES [dbo].[DIM_Producto]([PRODUCTO_KEY]),
	[CATEGORIA_KEY] INTEGER CONSTRAINT FK_Categoria REFERENCES [dbo].[DIM_Categoria]([CATEGORIA_KEY]),
	[CLIENTE_KEY] INTEGER CONSTRAINT FK_Cliente REFERENCES [dbo].[DIM_Cliente]([CLIENTE_KEY]),
	[PAIS_KEY] INTEGER CONSTRAINT FK_Pais REFERENCES [dbo].[DIM_Pais]([PAIS_KEY]),
	[VENDEDOR_KEY] INTEGER CONSTRAINT FK_Vendedor REFERENCES [dbo].[DIM_Vendedor]([VENDEDOR_KEY]),
	[SUCURSAL_KEY] INTEGER CONSTRAINT FK_Sucursal REFERENCES [dbo].[DIM_Sucursal]([SUCURSAL_KEY]),
	[TIEMPO_KEY] SMALLDATETIME CONSTRAINT FK_Tiempo REFERENCES [dbo].[DIM_Tiempo]([TIEMPO_KEY]),
	[CANTIDAD_VENDIDA] DECIMAL(18,2) NULL,
	[MONTO_VENDIDO] DECIMAL(18,2) NULL,
	[PRECIO] DECIMAL(18,2) NULL,
	[COMISION_COMERCIAL] DECIMAL(18,2) NULL,
	[FECHA_ALTA] DATETIME,
	[USUARIO_ALTA] VARCHAR(500) 
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[INT_DIM_Categoria]    Script Date: 14/4/2023 00:54:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INT_DIM_Categoria](
	[DESC_CATEGORIA] [varchar](500) NULL,
	[COD_CATEGORIA] [varchar](500) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[INT_DIM_Cliente]    Script Date: 14/4/2023 00:54:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INT_DIM_Cliente](
	[COD_CLIENTE] [varchar](500) NULL,
	[NOMBRE] [varchar](500) NULL,
	[APELLIDO] [varchar](500) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[INT_DIM_Pais]    Script Date: 14/4/2023 00:54:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INT_DIM_Pais](
	[DESC_PAIS] [varchar](500) NULL,
	[COD_PAIS] [varchar](3) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[INT_DIM_Producto]    Script Date: 14/4/2023 00:55:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INT_DIM_Producto](
	[DESC_PRODUCTO] [varchar](500) NULL,
	[COD_PRODUCTO] [varchar](500) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[INT_DIM_Sucursal]    Script Date: 14/4/2023 00:55:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INT_DIM_Sucursal](
	[DESC_SUCURSAL] [varchar](500) NULL,
	[COD_SUCURSAL] [varchar](500) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[INT_DIM_Vendedor]    Script Date: 14/4/2023 00:55:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INT_DIM_Vendedor](
	[COD_VENDEDOR] [varchar](500) NULL,
	[NOMBRE] [varchar](500) NULL,
	[APELLIDO] [varchar](500) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[INT_FACT_Ventas]    Script Date: 14/4/2023 00:56:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INT_FACT_Ventas](
	[COD_PRODUCTO] [varchar](100) NULL,
	[COD_CATEGORIA] [varchar](100) NULL,
	[COD_CLIENTE] [varchar](100) NULL,
	[COD_PAIS] [varchar](100) NULL,
	[COD_VENDEDOR] [varchar](100) NULL,
	[COD_SUCURSAL] [varchar](100) NULL,
	[FECHA] [smalldatetime] NULL,
	[CANTIDAD_VENDIDA] [decimal](18, 2) NULL,
	[MONTO_VENDIDO] [decimal](18, 2) NULL,
	[PRECIO] [decimal](18, 2) NULL,
	[COMISION_COMERCIAL] [decimal](18, 2) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[STG_DIM_Categoria]    Script Date: 14/4/2023 00:56:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_DIM_Categoria](
	[DESC_CATEGORIA] [varchar](500) NULL,
	[COD_CATEGORIA] [varchar](500) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[STG_DIM_Cliente]    Script Date: 14/4/2023 00:57:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_DIM_Cliente](
	[DESC_CLIENTE] [varchar](500) NULL,
	[COD_CLIENTE] [varchar](500) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[STG_DIM_Pais]    Script Date: 14/4/2023 00:57:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_DIM_Pais](
	[DESC_PAIS] [varchar](500) NULL,
	[COD_PAIS] [varchar](500) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[STG_DIM_Producto]    Script Date: 14/4/2023 00:57:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_DIM_Producto](
	[DESC_PRODUCTO] [varchar](500) NULL,
	[COD_PRODUCTO] [varchar](500) NULL
) ON [PRIMARY]
GO


--=================================================================================================

/****** Object:  Table [dbo].[STG_DIM_Sucursal]    Script Date: 14/4/2023 00:57:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_DIM_Sucursal](
	[DESC_SUCURSAL] [varchar](500) NULL,
	[COD_SUCURSAL] [varchar](500) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[STG_DIM_Vendedor]    Script Date: 14/4/2023 00:58:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_DIM_Vendedor](
	[DESC_VENDEDOR] [varchar](500) NULL,
	[COD_VENDEDOR] [varchar](500) NULL
) ON [PRIMARY]
GO

--=================================================================================================

/****** Object:  Table [dbo].[STG_FACT_Ventas]    Script Date: 14/4/2023 00:58:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_FACT_Ventas](
	[COD_PRODUCTO] [varchar](500) NULL,
	[COD_CATEGORIA] [varchar](500) NULL,
	[COD_CLIENTE] [varchar](500) NULL,
	[COD_PAIS] [varchar](500) NULL,
	[COD_VENDEDOR] [varchar](500) NULL,
	[COD_SUCURSAL] [varchar](500) NULL,
	[FECHA] [varchar](500) NULL,
	[CANTIDAD_VENDIDA] [varchar](500) NULL,
	[MONTO_VENDIDO] [varchar](500) NULL,
	[PRECIO] [varchar](500) NULL,
	[COMISION_COMERCIAL] [varchar](500) NULL
) ON [PRIMARY]
GO

