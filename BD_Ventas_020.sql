USE [master]
GO
/****** Object:  Database [BD_VENTAS_020]    Script Date: 23/8/2020 12:49:53 p. m. ******/
CREATE DATABASE [BD_VENTAS_020]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_VENTAS_020', FILENAME = N'/var/opt/mssql/data/BD_VENTAS_020.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_VENTAS_020_log', FILENAME = N'/var/opt/mssql/data/BD_VENTAS_020_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD_VENTAS_020] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_VENTAS_020].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_VENTAS_020] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_VENTAS_020] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_VENTAS_020] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_VENTAS_020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_VENTAS_020] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_VENTAS_020] SET  MULTI_USER 
GO
ALTER DATABASE [BD_VENTAS_020] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_VENTAS_020] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_VENTAS_020] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_VENTAS_020] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_VENTAS_020] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_VENTAS_020', N'ON'
GO
ALTER DATABASE [BD_VENTAS_020] SET QUERY_STORE = OFF
GO
USE [BD_VENTAS_020]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[ID_CLIENTE] [int] IDENTITY(1,1) NOT NULL,
	[NOMB_CLIENTE] [varchar](45) NOT NULL,
	[DIRECCION] [varchar](60) NOT NULL,
	[PAIS] [varchar](20) NULL,
	[SALDO_INIC] [float] NULL,
	[SALDO_ACT] [float] NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_IDCLIENTE] PRIMARY KEY CLUSTERED 
(
	[ID_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorAcceso]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorAcceso](
	[IdRegistro] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](15) NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_ErrorAcceso] PRIMARY KEY CLUSTERED 
(
	[IdRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FABRICANTES]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FABRICANTES](
	[ID_FABRICANTE] [int] IDENTITY(1,1) NOT NULL,
	[NOMB_FABRICANTE] [varchar](30) NOT NULL,
	[DIRECCION] [varchar](60) NOT NULL,
	[PAIS] [varchar](20) NULL,
 CONSTRAINT [PK_IDFABRICANTE] PRIMARY KEY CLUSTERED 
(
	[ID_FABRICANTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[ID_PRODUCTO] [int] IDENTITY(1,1) NOT NULL,
	[DESC_PRODUCTO] [varchar](45) NOT NULL,
	[ID_FABRICANTE] [int] NOT NULL,
	[COSTO] [float] NULL,
	[PRECIO] [float] NULL,
	[CANTIDAD] [int] NULL,
 CONSTRAINT [PK_IDPRODUCTO] PRIMARY KEY CLUSTERED 
(
	[ID_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO_T]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO_T](
	[USUARIO] [varchar](15) NULL,
	[CLAVE] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENDEDOR]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENDEDOR](
	[ID_VENDEDOR] [int] IDENTITY(1,1) NOT NULL,
	[NOMB_VENDEDOR] [varchar](45) NOT NULL,
	[ID_JEFE] [int] NULL,
	[OFICINA] [varchar](20) NULL,
	[COMISION] [float] NULL,
 CONSTRAINT [PK_IDVENDEDOR] PRIMARY KEY CLUSTERED 
(
	[ID_VENDEDOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTAS]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTAS](
	[Factura] [varchar](50) NOT NULL,
	[FECHA] [datetime] NOT NULL,
	[ID_CLIENTE] [int] NOT NULL,
	[ID_VENDEDOR] [int] NOT NULL,
	[ID_PROD] [int] NOT NULL,
	[CANTIDAD] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLIENTES] ON 

INSERT [dbo].[CLIENTES] ([ID_CLIENTE], [NOMB_CLIENTE], [DIRECCION], [PAIS], [SALDO_INIC], [SALDO_ACT], [Estatus]) VALUES (1, N'ELVIN DANIEL GERMAN CORCINO', N'LOS RIOS', N'REPUBLICS DOMINICANA', 15000, 15000, 1)
INSERT [dbo].[CLIENTES] ([ID_CLIENTE], [NOMB_CLIENTE], [DIRECCION], [PAIS], [SALDO_INIC], [SALDO_ACT], [Estatus]) VALUES (2, N'MARTHA LA GALLINA', N'PALO CON ELLA', N'ECUADOR', 100, 100, 1)
INSERT [dbo].[CLIENTES] ([ID_CLIENTE], [NOMB_CLIENTE], [DIRECCION], [PAIS], [SALDO_INIC], [SALDO_ACT], [Estatus]) VALUES (3, N'ANA MARTHA GOLLEJO', N'EL SARGENTO EN OLLA', N'PANAMA', 300, 500, 1)
INSERT [dbo].[CLIENTES] ([ID_CLIENTE], [NOMB_CLIENTE], [DIRECCION], [PAIS], [SALDO_INIC], [SALDO_ACT], [Estatus]) VALUES (5, N'ANIBAL BRAVO', N'LOS CONCONES #23', N'ECUADOR', 100, 100, 1)
INSERT [dbo].[CLIENTES] ([ID_CLIENTE], [NOMB_CLIENTE], [DIRECCION], [PAIS], [SALDO_INIC], [SALDO_ACT], [Estatus]) VALUES (6, N'Emmanuel ', N'Santos', N'Republica Dominicana', 1200, 1500, 1)
INSERT [dbo].[CLIENTES] ([ID_CLIENTE], [NOMB_CLIENTE], [DIRECCION], [PAIS], [SALDO_INIC], [SALDO_ACT], [Estatus]) VALUES (9, N'Foe ', N'fdafa', N'Repu', 1400, 1200, 1)
SET IDENTITY_INSERT [dbo].[CLIENTES] OFF
GO
SET IDENTITY_INSERT [dbo].[FABRICANTES] ON 

INSERT [dbo].[FABRICANTES] ([ID_FABRICANTE], [NOMB_FABRICANTE], [DIRECCION], [PAIS]) VALUES (1, N'Induveca S.A.', N'Av. Máximo Gómez No. 182,
Santo Domingo', N'República Dominicana')
INSERT [dbo].[FABRICANTES] ([ID_FABRICANTE], [NOMB_FABRICANTE], [DIRECCION], [PAIS]) VALUES (2, N'Grupo Rica', N'KM 6 1/2 Autopista Duarte, Santo Domingo, DN. ', N'República Dominicana')
INSERT [dbo].[FABRICANTES] ([ID_FABRICANTE], [NOMB_FABRICANTE], [DIRECCION], [PAIS]) VALUES (5, N'Victorina', N'Av. Núñez de Cáceres esq. Calle 1, San Gerónimo', N'República Dominicana')
INSERT [dbo].[FABRICANTES] ([ID_FABRICANTE], [NOMB_FABRICANTE], [DIRECCION], [PAIS]) VALUES (7, N'Molinos Modernos S.A', N'O Vargas 1, Villa Duarte, Santo Domingo', N'República Dominicana')
SET IDENTITY_INSERT [dbo].[FABRICANTES] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTOS] ON 

INSERT [dbo].[PRODUCTOS] ([ID_PRODUCTO], [DESC_PRODUCTO], [ID_FABRICANTE], [COSTO], [PRECIO], [CANTIDAD]) VALUES (2, N'SALAMI SÚPER ESPECIAL INDUVECA', 1, 150, 250, 372)
INSERT [dbo].[PRODUCTOS] ([ID_PRODUCTO], [DESC_PRODUCTO], [ID_FABRICANTE], [COSTO], [PRECIO], [CANTIDAD]) VALUES (3, N'Leche entera de vaca grado A', 1, 35, 50, 102)
INSERT [dbo].[PRODUCTOS] ([ID_PRODUCTO], [DESC_PRODUCTO], [ID_FABRICANTE], [COSTO], [PRECIO], [CANTIDAD]) VALUES (2005, N'ESPAGUETIS MILANO 200g', 7, 160, 180, 296)
INSERT [dbo].[PRODUCTOS] ([ID_PRODUCTO], [DESC_PRODUCTO], [ID_FABRICANTE], [COSTO], [PRECIO], [CANTIDAD]) VALUES (3005, N'TR', 5, 12, 15, 19)
SET IDENTITY_INSERT [dbo].[PRODUCTOS] OFF
GO
INSERT [dbo].[USUARIO_T] ([USUARIO], [CLAVE]) VALUES (N'egerman', N'1234')
INSERT [dbo].[USUARIO_T] ([USUARIO], [CLAVE]) VALUES (N'admin', N'123')
INSERT [dbo].[USUARIO_T] ([USUARIO], [CLAVE]) VALUES (N'estudiante', N'123')
GO
SET IDENTITY_INSERT [dbo].[VENDEDOR] ON 

INSERT [dbo].[VENDEDOR] ([ID_VENDEDOR], [NOMB_VENDEDOR], [ID_JEFE], [OFICINA], [COMISION]) VALUES (1, N'Alex De los Santos', NULL, N'Principal', 15)
SET IDENTITY_INSERT [dbo].[VENDEDOR] OFF
GO
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'z3y212', CAST(N'2004-05-23T14:25:10.000' AS DateTime), 1, 1, 2, 3)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'676856', CAST(N'2020-08-22T15:47:26.153' AS DateTime), 1, 1, 3, 2)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'0344d9', CAST(N'2020-08-22T15:51:57.547' AS DateTime), 3, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'16f509', CAST(N'2020-08-22T15:53:38.633' AS DateTime), 6, 1, 2, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'16f509', CAST(N'2020-08-22T15:53:38.633' AS DateTime), 6, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'8a783a', CAST(N'2020-08-22T16:19:49.843' AS DateTime), 3, 1, 3, 2)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'8a783a', CAST(N'2020-08-22T16:19:49.843' AS DateTime), 3, 1, 2, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'8a783a', CAST(N'2020-08-22T16:19:49.843' AS DateTime), 3, 1, 2005, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'ba4843', CAST(N'2020-08-22T16:33:19.817' AS DateTime), 3, 1, 2005, 301)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'8e4957', CAST(N'2020-08-22T16:41:03.073' AS DateTime), 3, 1, 3, 4)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'8e4957', CAST(N'2020-08-22T16:41:03.073' AS DateTime), 3, 1, 2005, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'85f7f7', CAST(N'2020-08-23T07:31:01.537' AS DateTime), 3, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'85f7f7', CAST(N'2020-08-23T07:31:01.537' AS DateTime), 3, 1, 2005, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'cb6765', CAST(N'2020-08-23T07:33:11.917' AS DateTime), 1, 1, 2005, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'cb6765', CAST(N'2020-08-23T07:33:11.917' AS DateTime), 1, 1, 3, 2)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'5f9618', CAST(N'2020-08-23T07:35:43.813' AS DateTime), 3, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'5f9618', CAST(N'2020-08-23T07:35:43.813' AS DateTime), 3, 1, 2005, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'3a5517', CAST(N'2020-08-23T07:38:36.403' AS DateTime), 3, 1, 2005, 2)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'3a5517', CAST(N'2020-08-23T07:38:36.403' AS DateTime), 3, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'f31bf3', CAST(N'2020-08-23T11:30:34.170' AS DateTime), 5, 1, 2005, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'f31bf3', CAST(N'2020-08-23T11:30:34.170' AS DateTime), 5, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'1ad50b', CAST(N'2020-08-23T11:40:44.560' AS DateTime), 3, 1, 3005, 2)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'1ad50b', CAST(N'2020-08-23T11:40:44.560' AS DateTime), 3, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'1ad50b', CAST(N'2020-08-23T11:40:44.560' AS DateTime), 3, 1, 2, 3)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'b9d873', CAST(N'2020-08-23T11:40:48.367' AS DateTime), 3, 1, 3005, 2)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'b9d873', CAST(N'2020-08-23T11:40:48.367' AS DateTime), 3, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'b9d873', CAST(N'2020-08-23T11:40:48.367' AS DateTime), 3, 1, 2, 3)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'29e116', CAST(N'2020-08-23T11:41:08.187' AS DateTime), 3, 1, 3005, 2)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'29e116', CAST(N'2020-08-23T11:41:08.187' AS DateTime), 3, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'29e116', CAST(N'2020-08-23T11:41:08.187' AS DateTime), 3, 1, 2, 3)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'8bef5f', CAST(N'2020-08-23T12:02:10.450' AS DateTime), 2, 1, 2005, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'8bef5f', CAST(N'2020-08-23T12:02:10.450' AS DateTime), 2, 1, 3005, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'd9f02e', CAST(N'2020-08-23T12:03:34.687' AS DateTime), 2, 1, 2005, 2)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'd9f02e', CAST(N'2020-08-23T12:03:34.687' AS DateTime), 2, 1, 3, 2)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'e5dae3', CAST(N'2020-08-23T07:49:43.187' AS DateTime), 3, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'474b4b', CAST(N'2020-08-23T11:44:08.197' AS DateTime), 5, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'caa98c', CAST(N'2020-08-23T11:49:03.290' AS DateTime), 2, 1, 3005, 2)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'caa98c', CAST(N'2020-08-23T11:49:03.290' AS DateTime), 2, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'caa98c', CAST(N'2020-08-23T11:49:03.290' AS DateTime), 2, 1, 2005, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'da7ae6', CAST(N'2020-08-23T11:50:09.993' AS DateTime), 2, 1, 3005, 2)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'da7ae6', CAST(N'2020-08-23T11:50:09.993' AS DateTime), 2, 1, 3, 1)
INSERT [dbo].[VENTAS] ([Factura], [FECHA], [ID_CLIENTE], [ID_VENDEDOR], [ID_PROD], [CANTIDAD]) VALUES (N'da7ae6', CAST(N'2020-08-23T11:50:09.993' AS DateTime), 2, 1, 2005, 1)
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_IDFABRICANTE_FABRICANTE] FOREIGN KEY([ID_FABRICANTE])
REFERENCES [dbo].[FABRICANTES] ([ID_FABRICANTE])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_IDFABRICANTE_FABRICANTE]
GO
ALTER TABLE [dbo].[VENDEDOR]  WITH CHECK ADD  CONSTRAINT [FK_IDJEFE_IDVENDEDOR] FOREIGN KEY([ID_JEFE])
REFERENCES [dbo].[VENDEDOR] ([ID_VENDEDOR])
GO
ALTER TABLE [dbo].[VENDEDOR] CHECK CONSTRAINT [FK_IDJEFE_IDVENDEDOR]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_IDCLIENTE] FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTES] ([ID_CLIENTE])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_IDCLIENTE]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_IDPROD] FOREIGN KEY([ID_PROD])
REFERENCES [dbo].[PRODUCTOS] ([ID_PRODUCTO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_IDPROD]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_IDVENDEDOR] FOREIGN KEY([ID_VENDEDOR])
REFERENCES [dbo].[VENDEDOR] ([ID_VENDEDOR])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_IDVENDEDOR]
GO
/****** Object:  StoredProcedure [dbo].[proc_CLIENTES_NOMBRE]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[proc_CLIENTES_NOMBRE]
@textBuscar varchar(50)
as
select * from CLIENTES
where ID_CLIENTE like '%'+@textBuscar+'%' or NOMB_CLIENTE like '%'+@textBuscar+'%'
GO
/****** Object:  StoredProcedure [dbo].[proc_CLIENTESDelete]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_CLIENTESDelete]
(
	@IdCliente int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[CLIENTES]
	WHERE
		([ID_CLIENTE] = @IdCliente)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CLIENTESInsert]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_CLIENTESInsert]
(
	@IdCliente int = NULL OUTPUT, 
	@NombCliente varchar(45), 
	@Direccion varchar(60), 
	@Pais varchar(20) = NULL, 
	@SaldoInic float = NULL, 
	@SaldoAct float = NULL, 
	@Estatus bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	
	
	INSERT
	INTO [CLIENTES]
	(
		[NOMB_CLIENTE], 
		[DIRECCION], 
		[PAIS], 
		[SALDO_INIC], 
		[SALDO_ACT], 
		[Estatus]
	)
	
	VALUES
	(
		@NombCliente, 
		@Direccion, 
		@Pais, 
		@SaldoInic, 
		@SaldoAct, 
		@Estatus
	)


	SET @Err = @@Error

		
	SELECT @IdCliente = SCOPE_IDENTITY()

	

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CLIENTESInsertUpdate]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_CLIENTESInsertUpdate]
@IdCliente int, 
@NombCliente varchar(45), 
@Direccion varchar(60), 
@Pais varchar(20) = NULL, 
@SaldoInic float = NULL, 
@SaldoAct float = NULL, 
@Estatus bit = NULL
AS
 IF @IdCliente = 0
INSERT INTO [CLIENTES] ([NOMB_CLIENTE], [DIRECCION], [PAIS], [SALDO_INIC], [SALDO_ACT], [Estatus])
	VALUES(@NombCliente, @Direccion, @Pais, @SaldoInic, @SaldoAct, @Estatus)

 ELSE
 	UPDATE [CLIENTES] SET
		[NOMB_CLIENTE] = @NombCliente, 
		[DIRECCION] = @Direccion, 
		[PAIS] = @Pais, 
		[SALDO_INIC] = @SaldoInic, 
		[SALDO_ACT] = @SaldoAct, 
		[Estatus] = @Estatus
	WHERE
		([ID_CLIENTE] = @IdCliente)
GO
/****** Object:  StoredProcedure [dbo].[proc_CLIENTESLoadAll]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_CLIENTESLoadAll]
AS
BEGIN
	SELECT
		[ID_CLIENTE], 
		[NOMB_CLIENTE], 
		[DIRECCION], 
		[PAIS], 
		[SALDO_INIC], 
		[SALDO_ACT], 
		[Estatus]
	FROM [dbo].[CLIENTES]
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CLIENTESLoadByPrimaryKey]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_CLIENTESLoadByPrimaryKey]
(
	@IdCliente int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID_CLIENTE], 
		[NOMB_CLIENTE], 
		[DIRECCION], 
		[PAIS], 
		[SALDO_INIC], 
		[SALDO_ACT], 
		[Estatus]
	FROM [dbo].[CLIENTES]
	WHERE
		([ID_CLIENTE] = @IdCliente)

END
GO
/****** Object:  StoredProcedure [dbo].[proc_CLIENTESUpdate]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_CLIENTESUpdate]
(
	@IdCliente int, 
	@NombCliente varchar(45), 
	@Direccion varchar(60), 
	@Pais varchar(20) = NULL, 
	@SaldoInic float = NULL, 
	@SaldoAct float = NULL, 
	@Estatus bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	
	
	

	UPDATE [CLIENTES]
	SET
		[NOMB_CLIENTE] = @NombCliente, 
		[DIRECCION] = @Direccion, 
		[PAIS] = @Pais, 
		[SALDO_INIC] = @SaldoInic, 
		[SALDO_ACT] = @SaldoAct, 
		[Estatus] = @Estatus
	WHERE
		([ID_CLIENTE] = @IdCliente)

	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_FABRICANTE_NOMBRE]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_FABRICANTE_NOMBRE]
@textBuscar varchar(50)
as
select * from FABRICANTES
where ID_FABRICANTE like '%'+@textBuscar+'%' or NOMB_FABRICANTE like '%'+@textBuscar+'%'
GO
/****** Object:  StoredProcedure [dbo].[proc_FABRICANTESDelete]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_FABRICANTESDelete]
(
	@IdFabricante int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[FABRICANTES]
	WHERE
		([ID_FABRICANTE] = @IdFabricante)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_FABRICANTESInsert]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_FABRICANTESInsert]
(
	@IdFabricante int = NULL OUTPUT, 
	@NombFabricante varchar(30), 
	@Direccion varchar(60), 
	@Pais varchar(20) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	
	
	INSERT
	INTO [FABRICANTES]
	(
		[NOMB_FABRICANTE], 
		[DIRECCION], 
		[PAIS]
	)
	
	VALUES
	(
		@NombFabricante, 
		@Direccion, 
		@Pais
	)


	SET @Err = @@Error

		
	SELECT @IdFabricante = SCOPE_IDENTITY()

	

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_FABRICANTESLoadAll]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_FABRICANTESLoadAll]
AS
BEGIN
	SELECT
		[ID_FABRICANTE], 
		[NOMB_FABRICANTE], 
		[DIRECCION], 
		[PAIS]
	FROM [dbo].[FABRICANTES]
END
GO
/****** Object:  StoredProcedure [dbo].[proc_FABRICANTESLoadByPrimaryKey]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_FABRICANTESLoadByPrimaryKey]
(
	@IdFabricante int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID_FABRICANTE], 
		[NOMB_FABRICANTE], 
		[DIRECCION], 
		[PAIS]
	FROM [dbo].[FABRICANTES]
	WHERE
		([ID_FABRICANTE] = @IdFabricante)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_FABRICANTESUpdate]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_FABRICANTESUpdate]
(
	@IdFabricante int, 
	@NombFabricante varchar(30), 
	@Direccion varchar(60), 
	@Pais varchar(20) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	
	
	

	UPDATE [FABRICANTES]
	SET
		[NOMB_FABRICANTE] = @NombFabricante, 
		[DIRECCION] = @Direccion, 
		[PAIS] = @Pais
	WHERE
		([ID_FABRICANTE] = @IdFabricante)

	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_InhabilitarCLIENTESUpdate]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[proc_InhabilitarCLIENTESUpdate]
(
	@IdCliente int, 
	@Estatus int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	

	UPDATE [CLIENTES]
	SET
		[Estatus] = @Estatus
	WHERE
		([ID_CLIENTE] = @IdCliente)

	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PRODUCTOS_NOMBRE]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[proc_PRODUCTOS_NOMBRE]
@textBuscar varchar(50)
as
select * from PRODUCTOS
where ID_PRODUCTO like '%'+@textBuscar+'%' or DESC_PRODUCTO like '%'+@textBuscar+'%'
GO
/****** Object:  StoredProcedure [dbo].[proc_PRODUCTOSDelete]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_PRODUCTOSDelete]
(
	@IdProducto int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[PRODUCTOS]
	WHERE
		([ID_PRODUCTO] = @IdProducto)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PRODUCTOSInsert]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_PRODUCTOSInsert]
(
	@IdProducto int = NULL OUTPUT, 
	@DescProducto varchar(45), 
	@IdFabricante int, 
	@Costo float = NULL, 
	@Precio float = NULL,
	@Cantidad int = 0
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	
	
	INSERT
	INTO [PRODUCTOS]
	(
		[DESC_PRODUCTO], 
		[ID_FABRICANTE], 
		[COSTO], 
		[PRECIO],
		[CANTIDAD]
		
	)
	
	VALUES
	(
		@DescProducto, 
		@IdFabricante, 
		@Costo, 
		@Precio,
		@Cantidad
	)


	SET @Err = @@Error

		
	SELECT @IdProducto = SCOPE_IDENTITY()

	

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PRODUCTOSLoadAll]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_PRODUCTOSLoadAll]
AS
BEGIN
SELECT TOP (1000) [ID_PRODUCTO]
      ,[DESC_PRODUCTO]
      ,Fabricante.NOMB_FABRICANTE
      ,[COSTO]
      ,[PRECIO]
	  ,[CANTIDAD]
	  ,Producto.ID_FABRICANTE
  FROM [BD_VENTAS_020].[dbo].[PRODUCTOS] as Producto
  Inner Join [BD_VENTAS_020].[dbo].[FABRICANTES] as Fabricante
  on Producto.ID_FABRICANTE = Fabricante.ID_FABRICANTE
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PRODUCTOSLoadByPrimaryKey]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_PRODUCTOSLoadByPrimaryKey]
(
	@IdProducto int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT TOP (1000) [ID_PRODUCTO]
      ,[DESC_PRODUCTO]
      ,Fabricante.NOMB_FABRICANTE
      ,[COSTO]
      ,[PRECIO]
	  ,[CANTIDAD]
	  ,Producto.ID_FABRICANTE
    FROM [BD_VENTAS_020].[dbo].[PRODUCTOS] as Producto
    Inner Join [BD_VENTAS_020].[dbo].[FABRICANTES] as Fabricante
    on Producto.ID_FABRICANTE = Fabricante.ID_FABRICANTE
	WHERE
		([ID_PRODUCTO] = @IdProducto)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PRODUCTOSUpdate]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_PRODUCTOSUpdate]
(
	@IdProducto int, 
	@DescProducto varchar(45), 
	@IdFabricante int, 
	@Costo float = NULL, 
	@Precio float = NULL,
	@Cantidad int = 0
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	
	
	

	UPDATE [PRODUCTOS]
	SET
		[DESC_PRODUCTO] = @DescProducto, 
		[ID_FABRICANTE] = @IdFabricante, 
		[COSTO] = @Costo, 
		[PRECIO] = @Precio,
		[CANTIDAD] = [CANTIDAD]
	WHERE
		([ID_PRODUCTO] = @IdProducto)

	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_VENDEDOR_NOMBRE]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[proc_VENDEDOR_NOMBRE]
@textBuscar varchar(50)
as
select * from VENDEDOR
where ID_VENDEDOR like '%'+@textBuscar+'%' or NOMB_VENDEDOR like '%'+@textBuscar+'%'
GO
/****** Object:  StoredProcedure [dbo].[proc_VENDEDORDelete]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_VENDEDORDelete]
(
	@IdVendedor int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[VENDEDOR]
	WHERE
		([ID_VENDEDOR] = @IdVendedor)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_VENDEDORInsert]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_VENDEDORInsert]
(
	@IdVendedor int = NULL OUTPUT, 
	@NombVendedor varchar(45), 
	@IdJefe int = NULL, 
	@Oficina varchar(20) = NULL, 
	@Comision float = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	
	
	INSERT
	INTO [VENDEDOR]
	(
		[NOMB_VENDEDOR], 
		[ID_JEFE], 
		[OFICINA], 
		[COMISION]
	)
	
	VALUES
	(
		@NombVendedor, 
		@IdJefe, 
		@Oficina, 
		@Comision
	)


	SET @Err = @@Error

		
	SELECT @IdVendedor = SCOPE_IDENTITY()

	

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_VENDEDORLoadAll]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_VENDEDORLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID_VENDEDOR], 
		[NOMB_VENDEDOR], 
		[ID_JEFE], 
		[OFICINA], 
		[COMISION]
	FROM [dbo].[VENDEDOR]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_VENDEDORLoadByPrimaryKey]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_VENDEDORLoadByPrimaryKey]
(
	@IdVendedor int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID_VENDEDOR], 
		[NOMB_VENDEDOR], 
		[ID_JEFE], 
		[OFICINA], 
		[COMISION]
	FROM [dbo].[VENDEDOR]
	WHERE
		([ID_VENDEDOR] = @IdVendedor)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_VENDEDORUpdate]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_VENDEDORUpdate]
(
	@IdVendedor int, 
	@NombVendedor varchar(45), 
	@IdJefe int = NULL, 
	@Oficina varchar(20) = NULL, 
	@Comision float = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	
	
	

	UPDATE [VENDEDOR]
	SET
		[NOMB_VENDEDOR] = @NombVendedor, 
		[ID_JEFE] = @IdJefe, 
		[OFICINA] = @Oficina, 
		[COMISION] = @Comision
	WHERE
		([ID_VENDEDOR] = @IdVendedor)

	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_VentasInsert]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_VentasInsert]
	@Factura varchar(50),
	@FECHA datetime,
	@ID_CLIENTE	int,
	@ID_VENDEDOR int,
	@ID_PROD int,
	@CANTIDAD int
as

INSERT INTO VENTAS(
Factura,
FECHA,
ID_CLIENTE,
ID_VENDEDOR,
ID_PROD,
CANTIDAD) VALUES (@Factura, @FECHA, @ID_CLIENTE, @ID_VENDEDOR, @ID_PROD, @CANTIDAD)
GO
/****** Object:  StoredProcedure [dbo].[proc_VentasLoadAll]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_VentasLoadAll]
	as
Select * From  Ventas
GO
/****** Object:  StoredProcedure [dbo].[proc_VentasObtener]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_VentasObtener]
as
Select VENTAS.factura, VENTAS.FECHA, 
	Cliente.ID_CLIENTE, Cliente.NOMB_CLIENTE,
	Vendedor.ID_VENDEDOR, Vendedor.NOMB_VENDEDOR, 
	Producto.ID_PRODUCTO, VENTAS.CANTIDAD, Producto.DESC_PRODUCTO
FROM VENTAS INNER JOIN CLIENTES Cliente 
ON VENTAS.ID_CLIENTE = Cliente.ID_CLIENTE INNER JOIN VENDEDOR Vendedor 
ON VENTAS.ID_VENDEDOR = Vendedor.ID_VENDEDOR INNER JOIN PRODUCTOS Producto 
ON VENTAS.ID_PROD = Producto.ID_PRODUCTO
order by ventas.Factura
GO
/****** Object:  StoredProcedure [dbo].[proc_VentasObtenerFactura]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[proc_VentasObtenerFactura]
@factura varchar(50)
	as
Select * From  Ventas
where Factura = @factura
GO
/****** Object:  StoredProcedure [dbo].[proc_VentasRebajar]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_VentasRebajar]
	@ID_PROD int,
	@CANTIDAD int
as
UPDATE PRODUCTOS SET CANTIDAD = CANTIDAD - @CANTIDAD  WHERE PRODUCTOS.ID_PRODUCTO = @ID_PROD
GO
/****** Object:  StoredProcedure [dbo].[Usp_ValidarUsuario]    Script Date: 23/8/2020 12:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE proc [dbo].[Usp_ValidarUsuario]
(
   @usuario varchar(15),
   @clave varchar(15)
)
as
begin

	SELECT [USUARIO]
		  ,[CLAVE]
	  FROM [BD_VENTAS_020].[dbo].[USUARIO_T]
    where usuario=@usuario
	 and clave = @clave 
end
GO
USE [master]
GO
ALTER DATABASE [BD_VENTAS_020] SET  READ_WRITE 
GO
