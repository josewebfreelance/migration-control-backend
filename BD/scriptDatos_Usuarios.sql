USE [master]
GO
/****** Object:  Database [Datos_usuario]    Script Date: 13/06/2021 00:05:49 ******/
CREATE DATABASE [Datos_usuario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Datos_usuario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Datos_usuario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Datos_usuario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Datos_usuario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Datos_usuario] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Datos_usuario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Datos_usuario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Datos_usuario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Datos_usuario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Datos_usuario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Datos_usuario] SET ARITHABORT OFF 
GO
ALTER DATABASE [Datos_usuario] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Datos_usuario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Datos_usuario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Datos_usuario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Datos_usuario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Datos_usuario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Datos_usuario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Datos_usuario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Datos_usuario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Datos_usuario] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Datos_usuario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Datos_usuario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Datos_usuario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Datos_usuario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Datos_usuario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Datos_usuario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Datos_usuario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Datos_usuario] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Datos_usuario] SET  MULTI_USER 
GO
ALTER DATABASE [Datos_usuario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Datos_usuario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Datos_usuario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Datos_usuario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Datos_usuario] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Datos_usuario] SET QUERY_STORE = OFF
GO
USE [Datos_usuario]
GO
/****** Object:  Table [dbo].[contacto]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contacto](
	[idContacto] [int] IDENTITY(1,1) NOT NULL,
	[idPrechequeo] [int] NULL,
	[idTipoContacto] [int] NULL,
	[valor] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [contacto_PD] PRIMARY KEY CLUSTERED 
(
	[idContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delegacion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delegacion](
	[idDelegacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
 CONSTRAINT [delegacion_PK] PRIMARY KEY CLUSTERED 
(
	[idDelegacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctoIdentificacion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctoIdentificacion](
	[idDoctoIdentificacion] [int] IDENTITY(1,1) NOT NULL,
	[idSubTipoDocto] [int] NULL,
	[numero] [varchar](100) NULL,
	[fechaEmision] [date] NULL,
	[fechaVencimiento] [date] NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [doctoIdentificacion_PK] PRIMARY KEY CLUSTERED 
(
	[idDoctoIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctoPersona]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctoPersona](
	[idDoctoPersona] [int] IDENTITY(1,1) NOT NULL,
	[idDoctoIdentificacion] [int] NULL,
	[idPersona] [int] NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [doctoPersona_PK] PRIMARY KEY CLUSTERED 
(
	[idDoctoPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genero]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genero](
	[idGenero] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [genero_PK] PRIMARY KEY CLUSTERED 
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[limiteDinero]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[limiteDinero](
	[idLimiteDinero] [int] IDENTITY(1,1) NOT NULL,
	[idResolucion] [int] NULL,
	[nombre] [varchar](100) NULL,
	[valor] [decimal](12, 2) NULL,
	[activo] [char](1) NULL,
 CONSTRAINT [limiteDinero_PK] PRIMARY KEY CLUSTERED 
(
	[idLimiteDinero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ocupacion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ocupacion](
	[idOcupacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [ocupacion_PK] PRIMARY KEY CLUSTERED 
(
	[idOcupacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[origenFondos]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[origenFondos](
	[idOrigenFondos] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [origenFondos_PK] PRIMARY KEY CLUSTERED 
(
	[idOrigenFondos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pais]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pais](
	[idPais] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[iso] [varchar](3) NULL,
	[iata] [varchar](3) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [pais_PK] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[primerNombre] [varchar](100) NULL,
	[segundoNombre] [varchar](100) NULL,
	[tercerNombre] [varchar](100) NULL,
	[primerApellido] [varchar](100) NULL,
	[segundoApellido] [varchar](100) NULL,
	[apellidoCasada] [varchar](100) NULL,
	[fechaNac] [date] NULL,
	[idGenero] [int] NULL,
	[idOcupacion] [int] NULL,
	[idPaisNacimiento] [int] NULL,
	[idPaisNacionalidad] [int] NULL,
	[idPaisResidencia] [int] NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [persona_Pk] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prechequeo]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prechequeo](
	[idPrechequeo] [int] IDENTITY(1,1) NOT NULL,
	[idDoctoPersona] [int] NULL,
	[codigo] [varchar](100) NULL,
	[fecha] [date] NULL,
	[idDelegacion] [int] NULL,
	[idTipoMovimiento] [int] NULL,
	[fechaLlegada] [date] NULL,
	[fechaSalida] [date] NULL,
	[idTipoViaje] [int] NULL,
	[idRuta] [int] NULL,
	[idPaisOrigen] [int] NULL,
	[idPaisDestino] [int] NULL,
	[placaVehiculo] [varchar](100) NULL,
	[dineroMayorLimite] [char](1) NULL,
	[autorizaCompartir] [char](1) NULL,
	[aurtorizaVerificar] [char](1) NULL,
	[idLimiteDinero] [int] NULL,
	[llaveCifrada] [varchar](1000) NULL,
	[qr] [varchar](1000) NULL,
	[ip] [varchar](25) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [prechequeo_PK] PRIMARY KEY CLUSTERED 
(
	[idPrechequeo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[resolucion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resolucion](
	[idResolucion] [int] IDENTITY(1,1) NOT NULL,
	[idTipoResolucion] [int] NULL,
	[nombre] [varchar](100) NULL,
	[fechaIni] [date] NULL,
	[fechaFin] [date] NULL,
	[activo] [char](1) NULL,
 CONSTRAINT [resolucion_PK] PRIMARY KEY CLUSTERED 
(
	[idResolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rutas]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rutas](
	[idRuta] [int] IDENTITY(1,1) NOT NULL,
	[idTipoTransporte] [int] NULL,
	[idTransportista] [int] NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [rutas_PK] PRIMARY KEY CLUSTERED 
(
	[idRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subTipoDocto]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subTipoDocto](
	[idSubTipoDocto] [int] IDENTITY(1,1) NOT NULL,
	[idTipoDocto] [int] NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [subTipoDocto_PK] PRIMARY KEY CLUSTERED 
(
	[idSubTipoDocto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoArticulo]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoArticulo](
	[idTipoArticulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [tipoArticulo_PK] PRIMARY KEY CLUSTERED 
(
	[idTipoArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoContacto]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoContacto](
	[idTipoContacto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [tipoContacto_PK] PRIMARY KEY CLUSTERED 
(
	[idTipoContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoDocto]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoDocto](
	[idTipoDocto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [tipoDocto_PK] PRIMARY KEY CLUSTERED 
(
	[idTipoDocto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoMoneda]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoMoneda](
	[idTipoMoneda] [int] IDENTITY(1,1) NOT NULL,
	[idPais] [int] NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [tipoMoneda_PK] PRIMARY KEY CLUSTERED 
(
	[idTipoMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoMovimiento]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoMovimiento](
	[idTipoMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [tipoMovimiento_PK] PRIMARY KEY CLUSTERED 
(
	[idTipoMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoResolucion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoResolucion](
	[idTipoResolucion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
 CONSTRAINT [tipoReolucion_PK] PRIMARY KEY CLUSTERED 
(
	[idTipoResolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoTitulo]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoTitulo](
	[idTipoTitulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [tipoTitulo_PK] PRIMARY KEY CLUSTERED 
(
	[idTipoTitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoTransporte]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoTransporte](
	[idTipoTransporte] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [tipoTransporte_PK] PRIMARY KEY CLUSTERED 
(
	[idTipoTransporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoValor]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoValor](
	[idTipoValor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [tipoValor_PK] PRIMARY KEY CLUSTERED 
(
	[idTipoValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoViaje]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoViaje](
	[idTipoViaje] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [tipoViaje_PK] PRIMARY KEY CLUSTERED 
(
	[idTipoViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transportista]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transportista](
	[idTransportista] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [varchar](100) NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [transportista_PK] PRIMARY KEY CLUSTERED 
(
	[idTransportista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[valor]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[valor](
	[idValor] [int] IDENTITY(1,1) NOT NULL,
	[idPrechequeo] [int] NULL,
	[idTipoValor] [int] NULL,
	[idTipoMoneda] [int] NULL,
	[idTipoTitulo] [int] NULL,
	[idTipoArticulo] [int] NULL,
	[valor] [decimal](12, 2) NULL,
	[idOrigenFondos] [int] NULL,
	[activo] [char](1) NULL,
	[idUsuarioIng] [int] NULL,
	[fechaIng] [date] NULL,
	[idUsuarioAct] [int] NULL,
	[fechaAct] [date] NULL,
 CONSTRAINT [valor_PK] PRIMARY KEY CLUSTERED 
(
	[idValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[delegacion] ON 

INSERT [dbo].[delegacion] ([idDelegacion], [nombre]) VALUES (1, N'$')
SET IDENTITY_INSERT [dbo].[delegacion] OFF
GO
SET IDENTITY_INSERT [dbo].[doctoIdentificacion] ON 

INSERT [dbo].[doctoIdentificacion] ([idDoctoIdentificacion], [idSubTipoDocto], [numero], [fechaEmision], [fechaVencimiento], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, 1, N'2399519990101', CAST(N'1993-02-14' AS Date), CAST(N'2021-05-25' AS Date), N'A', 1, CAST(N'2021-05-25' AS Date), 1, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[doctoIdentificacion] ([idDoctoIdentificacion], [idSubTipoDocto], [numero], [fechaEmision], [fechaVencimiento], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (2, 1, N'123456', CAST(N'2021-05-25' AS Date), CAST(N'2021-05-25' AS Date), N'A', 1, CAST(N'2021-05-26' AS Date), 1, CAST(N'2021-05-26' AS Date))
SET IDENTITY_INSERT [dbo].[doctoIdentificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[doctoPersona] ON 

INSERT [dbo].[doctoPersona] ([idDoctoPersona], [idDoctoIdentificacion], [idPersona], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (2, 1, 27, N'A', 1, CAST(N'2021-05-25' AS Date), 1, CAST(N'2021-05-26' AS Date))
SET IDENTITY_INSERT [dbo].[doctoPersona] OFF
GO
SET IDENTITY_INSERT [dbo].[genero] ON 

INSERT [dbo].[genero] ([idGenero], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'Masculino', N'S', 1, CAST(N'2021-05-19' AS Date), 1, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[genero] ([idGenero], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (2, N'Femenino', N'S', 1, CAST(N'2021-05-20' AS Date), 1, CAST(N'2021-05-20' AS Date))
SET IDENTITY_INSERT [dbo].[genero] OFF
GO
SET IDENTITY_INSERT [dbo].[limiteDinero] ON 

INSERT [dbo].[limiteDinero] ([idLimiteDinero], [idResolucion], [nombre], [valor], [activo]) VALUES (3, 2, N'Limete dolares', CAST(10000.00 AS Decimal(12, 2)), N'S')
SET IDENTITY_INSERT [dbo].[limiteDinero] OFF
GO
SET IDENTITY_INSERT [dbo].[ocupacion] ON 

INSERT [dbo].[ocupacion] ([idOcupacion], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'medico', N'A', 1, CAST(N'2021-05-19' AS Date), 1, CAST(N'2021-05-25' AS Date))
SET IDENTITY_INSERT [dbo].[ocupacion] OFF
GO
SET IDENTITY_INSERT [dbo].[origenFondos] ON 

INSERT [dbo].[origenFondos] ([idOrigenFondos], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'Ventas', N'S', 1, CAST(N'2021-06-11' AS Date), 1, CAST(N'2021-06-11' AS Date))
SET IDENTITY_INSERT [dbo].[origenFondos] OFF
GO
SET IDENTITY_INSERT [dbo].[pais] ON 

INSERT [dbo].[pais] ([idPais], [nombre], [iso], [iata], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'Guatemala', N'iso', N'gua', N'A', 1, CAST(N'2021-05-27' AS Date), 1, CAST(N'2021-05-27' AS Date))
INSERT [dbo].[pais] ([idPais], [nombre], [iso], [iata], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (2, N'España', N'iso', N'gua', N'A', 1, CAST(N'2021-05-27' AS Date), 1, CAST(N'2021-05-27' AS Date))
SET IDENTITY_INSERT [dbo].[pais] OFF
GO
SET IDENTITY_INSERT [dbo].[persona] ON 

INSERT [dbo].[persona] ([idPersona], [primerNombre], [segundoNombre], [tercerNombre], [primerApellido], [segundoApellido], [apellidoCasada], [fechaNac], [idGenero], [idOcupacion], [idPaisNacimiento], [idPaisNacionalidad], [idPaisResidencia], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (26, N'Edgar', N'Dardon', N'junior', N'dardon', N'sandoval', N'carrera', CAST(N'2021-05-19' AS Date), 1, 1, 1, 1, 1, N'S', 1, CAST(N'2021-05-19' AS Date), 1, CAST(N'2021-05-19' AS Date))
INSERT [dbo].[persona] ([idPersona], [primerNombre], [segundoNombre], [tercerNombre], [primerApellido], [segundoApellido], [apellidoCasada], [fechaNac], [idGenero], [idOcupacion], [idPaisNacimiento], [idPaisNacionalidad], [idPaisResidencia], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (27, N'Edgar', N'Dardon', N'junior', N'dardon', N'sandoval', N'carrera', CAST(N'2021-05-19' AS Date), 1, 1, 1, 1, 1, N'S', 1, CAST(N'2021-05-19' AS Date), 1, CAST(N'2021-05-19' AS Date))
INSERT [dbo].[persona] ([idPersona], [primerNombre], [segundoNombre], [tercerNombre], [primerApellido], [segundoApellido], [apellidoCasada], [fechaNac], [idGenero], [idOcupacion], [idPaisNacimiento], [idPaisNacionalidad], [idPaisResidencia], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (28, N'Edgar', N'Dardon', N'junior', N'dardon', N'sandoval', N'carrera', CAST(N'2021-05-19' AS Date), 1, 1, 1, 1, 1, N'S', 1, CAST(N'2021-05-19' AS Date), 1, CAST(N'2021-05-19' AS Date))
INSERT [dbo].[persona] ([idPersona], [primerNombre], [segundoNombre], [tercerNombre], [primerApellido], [segundoApellido], [apellidoCasada], [fechaNac], [idGenero], [idOcupacion], [idPaisNacimiento], [idPaisNacionalidad], [idPaisResidencia], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (29, N'Edgar', N'Dardon', N'junior', N'dardon', N'sandoval', N'carrera', CAST(N'2021-05-19' AS Date), 1, 1, 1, 1, 1, N'S', 1, CAST(N'2021-05-19' AS Date), 1, CAST(N'2021-05-19' AS Date))
INSERT [dbo].[persona] ([idPersona], [primerNombre], [segundoNombre], [tercerNombre], [primerApellido], [segundoApellido], [apellidoCasada], [fechaNac], [idGenero], [idOcupacion], [idPaisNacimiento], [idPaisNacionalidad], [idPaisResidencia], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (30, N'Edgar', N'Dardon', N'junior', N'dardon', N'sandoval', N'carrera', CAST(N'2021-05-19' AS Date), 1, 1, 1, 1, 1, N'S', 1, CAST(N'2021-05-19' AS Date), 1, CAST(N'2021-05-19' AS Date))
INSERT [dbo].[persona] ([idPersona], [primerNombre], [segundoNombre], [tercerNombre], [primerApellido], [segundoApellido], [apellidoCasada], [fechaNac], [idGenero], [idOcupacion], [idPaisNacimiento], [idPaisNacionalidad], [idPaisResidencia], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (31, N'Edgar', N'Dardon', N'junior', N'dardon', N'sandoval', N'carrera', CAST(N'2021-05-19' AS Date), 1, 1, 1, 1, 1, N'S', 1, CAST(N'2021-05-19' AS Date), 1, CAST(N'2021-05-19' AS Date))
INSERT [dbo].[persona] ([idPersona], [primerNombre], [segundoNombre], [tercerNombre], [primerApellido], [segundoApellido], [apellidoCasada], [fechaNac], [idGenero], [idOcupacion], [idPaisNacimiento], [idPaisNacionalidad], [idPaisResidencia], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (32, N'ana', N'Dardon', N'junior', N'dardon', N'sandoval', N'carrera', CAST(N'2021-05-19' AS Date), 1, 1, 1, 1, 1, N'S', 1, CAST(N'2021-05-19' AS Date), 1, CAST(N'2021-05-19' AS Date))
INSERT [dbo].[persona] ([idPersona], [primerNombre], [segundoNombre], [tercerNombre], [primerApellido], [segundoApellido], [apellidoCasada], [fechaNac], [idGenero], [idOcupacion], [idPaisNacimiento], [idPaisNacionalidad], [idPaisResidencia], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (33, N'rutiiiii2', N'Dardon', N'junior', N'dardon', N'sandoval', N'carrera', CAST(N'2021-05-19' AS Date), 1, 1, 1, 1, 1, N'S', 1, CAST(N'2021-05-19' AS Date), 1, CAST(N'2021-05-19' AS Date))
INSERT [dbo].[persona] ([idPersona], [primerNombre], [segundoNombre], [tercerNombre], [primerApellido], [segundoApellido], [apellidoCasada], [fechaNac], [idGenero], [idOcupacion], [idPaisNacimiento], [idPaisNacionalidad], [idPaisResidencia], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (34, N'rutiiiii', N'ivan', N'junior', N'dardon', N'sandoval', N'carrera', CAST(N'1993-02-14' AS Date), 1, 1, 1, 1, 1, N'S', 1, CAST(N'1993-02-14' AS Date), 2, CAST(N'1993-02-14' AS Date))
SET IDENTITY_INSERT [dbo].[persona] OFF
GO
SET IDENTITY_INSERT [dbo].[prechequeo] ON 

INSERT [dbo].[prechequeo] ([idPrechequeo], [idDoctoPersona], [codigo], [fecha], [idDelegacion], [idTipoMovimiento], [fechaLlegada], [fechaSalida], [idTipoViaje], [idRuta], [idPaisOrigen], [idPaisDestino], [placaVehiculo], [dineroMayorLimite], [autorizaCompartir], [aurtorizaVerificar], [idLimiteDinero], [llaveCifrada], [qr], [ip], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (13, 2, N'1as', CAST(N'2021-06-07' AS Date), 1, 1, CAST(N'2021-06-07' AS Date), CAST(N'2021-06-07' AS Date), 1, 3, 1, 1, N'abc', N's', N's', N's', 3, N'hdfhfgh1564', N'0x00', N'asd', N'S', 1, CAST(N'2021-06-07' AS Date), 1, CAST(N'2021-06-07' AS Date))
INSERT [dbo].[prechequeo] ([idPrechequeo], [idDoctoPersona], [codigo], [fecha], [idDelegacion], [idTipoMovimiento], [fechaLlegada], [fechaSalida], [idTipoViaje], [idRuta], [idPaisOrigen], [idPaisDestino], [placaVehiculo], [dineroMayorLimite], [autorizaCompartir], [aurtorizaVerificar], [idLimiteDinero], [llaveCifrada], [qr], [ip], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (14, 2, N'1as', CAST(N'2021-06-07' AS Date), 1, 1, CAST(N'2021-06-07' AS Date), CAST(N'2021-06-07' AS Date), 1, 3, 1, 1, N'abc', N's', N's', N's', 3, N'hdfhfgh1564', N'0x00', N'asd', N'S', 1, CAST(N'2021-06-07' AS Date), 1, CAST(N'2021-06-07' AS Date))
INSERT [dbo].[prechequeo] ([idPrechequeo], [idDoctoPersona], [codigo], [fecha], [idDelegacion], [idTipoMovimiento], [fechaLlegada], [fechaSalida], [idTipoViaje], [idRuta], [idPaisOrigen], [idPaisDestino], [placaVehiculo], [dineroMayorLimite], [autorizaCompartir], [aurtorizaVerificar], [idLimiteDinero], [llaveCifrada], [qr], [ip], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (15, 2, N'1as', CAST(N'2021-06-07' AS Date), 1, 1, CAST(N'2021-06-07' AS Date), CAST(N'2021-06-07' AS Date), 1, 3, 1, 1, N'abc', N's', N's', N's', 3, N'hdfhfgh1564', NULL, N'asd', N'S', 1, CAST(N'2021-06-07' AS Date), 1, CAST(N'2021-06-07' AS Date))
INSERT [dbo].[prechequeo] ([idPrechequeo], [idDoctoPersona], [codigo], [fecha], [idDelegacion], [idTipoMovimiento], [fechaLlegada], [fechaSalida], [idTipoViaje], [idRuta], [idPaisOrigen], [idPaisDestino], [placaVehiculo], [dineroMayorLimite], [autorizaCompartir], [aurtorizaVerificar], [idLimiteDinero], [llaveCifrada], [qr], [ip], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (16, 2, N'1as', CAST(N'2021-06-07' AS Date), 1, 1, CAST(N'2021-06-07' AS Date), CAST(N'2021-06-07' AS Date), 1, 3, 1, 1, N'abc', N's', N's', N's', 3, N'hdfhfgh1564', NULL, N'asd', N'S', 1, CAST(N'2021-06-07' AS Date), 1, CAST(N'2021-06-07' AS Date))
INSERT [dbo].[prechequeo] ([idPrechequeo], [idDoctoPersona], [codigo], [fecha], [idDelegacion], [idTipoMovimiento], [fechaLlegada], [fechaSalida], [idTipoViaje], [idRuta], [idPaisOrigen], [idPaisDestino], [placaVehiculo], [dineroMayorLimite], [autorizaCompartir], [aurtorizaVerificar], [idLimiteDinero], [llaveCifrada], [qr], [ip], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (17, 2, N'1as', CAST(N'2021-06-07' AS Date), 1, 1, CAST(N'2021-06-07' AS Date), CAST(N'2021-06-07' AS Date), 1, 3, 1, 1, N'abc', N's', N's', N's', 3, N'hdfhfgh1564', NULL, N'asd', N'S', 1, CAST(N'2021-06-07' AS Date), 1, CAST(N'2021-06-07' AS Date))
SET IDENTITY_INSERT [dbo].[prechequeo] OFF
GO
SET IDENTITY_INSERT [dbo].[resolucion] ON 

INSERT [dbo].[resolucion] ([idResolucion], [idTipoResolucion], [nombre], [fechaIni], [fechaFin], [activo]) VALUES (2, 1, N'res2020', CAST(N'2021-06-07' AS Date), CAST(N'2021-06-07' AS Date), N'S')
SET IDENTITY_INSERT [dbo].[resolucion] OFF
GO
SET IDENTITY_INSERT [dbo].[rutas] ON 

INSERT [dbo].[rutas] ([idRuta], [idTipoTransporte], [idTransportista], [nombre], [descripcion], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (3, 1, 1, N'avianca', N'dasdkj', N's', 1, CAST(N'2021-06-07' AS Date), 1, CAST(N'2021-06-07' AS Date))
SET IDENTITY_INSERT [dbo].[rutas] OFF
GO
SET IDENTITY_INSERT [dbo].[subTipoDocto] ON 

INSERT [dbo].[subTipoDocto] ([idSubTipoDocto], [idTipoDocto], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, 1, N'CUI', N'A', 1, CAST(N'2021-05-25' AS Date), 1, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[subTipoDocto] ([idSubTipoDocto], [idTipoDocto], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (14, 1, N'IGSS', N'A', 1, CAST(N'2021-05-26' AS Date), 1, CAST(N'2021-05-26' AS Date))
INSERT [dbo].[subTipoDocto] ([idSubTipoDocto], [idTipoDocto], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (15, 1, N'IGSS', N'A', 1, CAST(N'2021-05-26' AS Date), 1, CAST(N'2021-05-26' AS Date))
INSERT [dbo].[subTipoDocto] ([idSubTipoDocto], [idTipoDocto], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (16, 1, N'IGSS', N'A', 1, CAST(N'2021-05-26' AS Date), 1, CAST(N'2021-05-26' AS Date))
INSERT [dbo].[subTipoDocto] ([idSubTipoDocto], [idTipoDocto], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (17, 1, N'IGSS', N'A', 1, CAST(N'2021-05-26' AS Date), 1, CAST(N'2021-05-26' AS Date))
SET IDENTITY_INSERT [dbo].[subTipoDocto] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoArticulo] ON 

INSERT [dbo].[tipoArticulo] ([idTipoArticulo], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'mercaderia', N'S', 1, CAST(N'2021-06-11' AS Date), 1, CAST(N'2021-06-11' AS Date))
SET IDENTITY_INSERT [dbo].[tipoArticulo] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoDocto] ON 

INSERT [dbo].[tipoDocto] ([idTipoDocto], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'CUI', N'A', 1, CAST(N'2021-05-25' AS Date), 1, CAST(N'2021-05-25' AS Date))
SET IDENTITY_INSERT [dbo].[tipoDocto] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoMoneda] ON 

INSERT [dbo].[tipoMoneda] ([idTipoMoneda], [idPais], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, 1, N'Q', N'S', 1, CAST(N'2021-06-11' AS Date), 1, CAST(N'2021-06-11' AS Date))
SET IDENTITY_INSERT [dbo].[tipoMoneda] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoMovimiento] ON 

INSERT [dbo].[tipoMovimiento] ([idTipoMovimiento], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'compra casa', N'S', 1, CAST(N'2021-06-07' AS Date), 1, CAST(N'2021-06-07' AS Date))
SET IDENTITY_INSERT [dbo].[tipoMovimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoResolucion] ON 

INSERT [dbo].[tipoResolucion] ([idTipoResolucion], [nombre], [activo]) VALUES (1, N'Dolares', N'S')
SET IDENTITY_INSERT [dbo].[tipoResolucion] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoTitulo] ON 

INSERT [dbo].[tipoTitulo] ([idTipoTitulo], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'Titulo', N'A', 1, CAST(N'2021-06-11' AS Date), 1, CAST(N'2021-06-11' AS Date))
SET IDENTITY_INSERT [dbo].[tipoTitulo] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoTransporte] ON 

INSERT [dbo].[tipoTransporte] ([idTipoTransporte], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'avianca', N'S', 1, CAST(N'2021-06-07' AS Date), 1, CAST(N'2021-06-07' AS Date))
SET IDENTITY_INSERT [dbo].[tipoTransporte] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoValor] ON 

INSERT [dbo].[tipoValor] ([idTipoValor], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'Quetzal', N'S', 1, CAST(N'2021-06-11' AS Date), 1, CAST(N'2021-06-11' AS Date))
SET IDENTITY_INSERT [dbo].[tipoValor] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoViaje] ON 

INSERT [dbo].[tipoViaje] ([idTipoViaje], [nombre], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'Aereo', N'S', 1, CAST(N'2021-06-07' AS Date), 1, CAST(N'2021-06-07' AS Date))
SET IDENTITY_INSERT [dbo].[tipoViaje] OFF
GO
SET IDENTITY_INSERT [dbo].[transportista] ON 

INSERT [dbo].[transportista] ([idTransportista], [nombre], [descripcion], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (1, N'edgar', N'piloto', N'S', 1, CAST(N'2021-06-07' AS Date), 1, CAST(N'2021-06-07' AS Date))
SET IDENTITY_INSERT [dbo].[transportista] OFF
GO
SET IDENTITY_INSERT [dbo].[valor] ON 

INSERT [dbo].[valor] ([idValor], [idPrechequeo], [idTipoValor], [idTipoMoneda], [idTipoTitulo], [idTipoArticulo], [valor], [idOrigenFondos], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (8, 13, 1, 1, 1, 1, CAST(1000.00 AS Decimal(12, 2)), 1, N'S', 1, CAST(N'2021-06-11' AS Date), 1, CAST(N'2021-06-11' AS Date))
INSERT [dbo].[valor] ([idValor], [idPrechequeo], [idTipoValor], [idTipoMoneda], [idTipoTitulo], [idTipoArticulo], [valor], [idOrigenFondos], [activo], [idUsuarioIng], [fechaIng], [idUsuarioAct], [fechaAct]) VALUES (9, 13, 1, 1, 1, 1, CAST(1000.00 AS Decimal(12, 2)), 1, N'S', 1, CAST(N'2021-06-11' AS Date), 1, CAST(N'2021-06-11' AS Date))
SET IDENTITY_INSERT [dbo].[valor] OFF
GO
ALTER TABLE [dbo].[contacto]  WITH CHECK ADD  CONSTRAINT [contacto_prechequeo_FK] FOREIGN KEY([idPrechequeo])
REFERENCES [dbo].[prechequeo] ([idPrechequeo])
GO
ALTER TABLE [dbo].[contacto] CHECK CONSTRAINT [contacto_prechequeo_FK]
GO
ALTER TABLE [dbo].[contacto]  WITH CHECK ADD  CONSTRAINT [contacto_tipoContacto_FK] FOREIGN KEY([idTipoContacto])
REFERENCES [dbo].[tipoContacto] ([idTipoContacto])
GO
ALTER TABLE [dbo].[contacto] CHECK CONSTRAINT [contacto_tipoContacto_FK]
GO
ALTER TABLE [dbo].[doctoIdentificacion]  WITH CHECK ADD  CONSTRAINT [doctoIdentificacion_subTipoDocto_FK] FOREIGN KEY([idSubTipoDocto])
REFERENCES [dbo].[subTipoDocto] ([idSubTipoDocto])
GO
ALTER TABLE [dbo].[doctoIdentificacion] CHECK CONSTRAINT [doctoIdentificacion_subTipoDocto_FK]
GO
ALTER TABLE [dbo].[doctoPersona]  WITH CHECK ADD  CONSTRAINT [doctoPersona_doctoIdentificacion_FK] FOREIGN KEY([idDoctoIdentificacion])
REFERENCES [dbo].[doctoIdentificacion] ([idDoctoIdentificacion])
GO
ALTER TABLE [dbo].[doctoPersona] CHECK CONSTRAINT [doctoPersona_doctoIdentificacion_FK]
GO
ALTER TABLE [dbo].[doctoPersona]  WITH CHECK ADD  CONSTRAINT [doctoPersona_persona_FK] FOREIGN KEY([idPersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[doctoPersona] CHECK CONSTRAINT [doctoPersona_persona_FK]
GO
ALTER TABLE [dbo].[limiteDinero]  WITH CHECK ADD  CONSTRAINT [id_Resolucion_FK] FOREIGN KEY([idResolucion])
REFERENCES [dbo].[resolucion] ([idResolucion])
GO
ALTER TABLE [dbo].[limiteDinero] CHECK CONSTRAINT [id_Resolucion_FK]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [persona_genero_FK] FOREIGN KEY([idGenero])
REFERENCES [dbo].[genero] ([idGenero])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona_genero_FK]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [persona_ocupacion_FK] FOREIGN KEY([idOcupacion])
REFERENCES [dbo].[ocupacion] ([idOcupacion])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona_ocupacion_FK]
GO
ALTER TABLE [dbo].[prechequeo]  WITH CHECK ADD  CONSTRAINT [prechequeo_delegacion_FK] FOREIGN KEY([idDelegacion])
REFERENCES [dbo].[delegacion] ([idDelegacion])
GO
ALTER TABLE [dbo].[prechequeo] CHECK CONSTRAINT [prechequeo_delegacion_FK]
GO
ALTER TABLE [dbo].[prechequeo]  WITH CHECK ADD  CONSTRAINT [prechequeo_doctoPersona_FK] FOREIGN KEY([idDoctoPersona])
REFERENCES [dbo].[doctoPersona] ([idDoctoPersona])
GO
ALTER TABLE [dbo].[prechequeo] CHECK CONSTRAINT [prechequeo_doctoPersona_FK]
GO
ALTER TABLE [dbo].[prechequeo]  WITH CHECK ADD  CONSTRAINT [prechequeo_limiteDinero_FK] FOREIGN KEY([idLimiteDinero])
REFERENCES [dbo].[limiteDinero] ([idLimiteDinero])
GO
ALTER TABLE [dbo].[prechequeo] CHECK CONSTRAINT [prechequeo_limiteDinero_FK]
GO
ALTER TABLE [dbo].[prechequeo]  WITH CHECK ADD  CONSTRAINT [prechequeo_rutas_FK] FOREIGN KEY([idRuta])
REFERENCES [dbo].[rutas] ([idRuta])
GO
ALTER TABLE [dbo].[prechequeo] CHECK CONSTRAINT [prechequeo_rutas_FK]
GO
ALTER TABLE [dbo].[prechequeo]  WITH CHECK ADD  CONSTRAINT [prechequeo_tipoMovimiento_FK] FOREIGN KEY([idTipoMovimiento])
REFERENCES [dbo].[tipoMovimiento] ([idTipoMovimiento])
GO
ALTER TABLE [dbo].[prechequeo] CHECK CONSTRAINT [prechequeo_tipoMovimiento_FK]
GO
ALTER TABLE [dbo].[prechequeo]  WITH CHECK ADD  CONSTRAINT [prechequeo_tipoViaje_FK] FOREIGN KEY([idTipoViaje])
REFERENCES [dbo].[tipoViaje] ([idTipoViaje])
GO
ALTER TABLE [dbo].[prechequeo] CHECK CONSTRAINT [prechequeo_tipoViaje_FK]
GO
ALTER TABLE [dbo].[resolucion]  WITH CHECK ADD  CONSTRAINT [resolucion_tipoResolucion_FK] FOREIGN KEY([idTipoResolucion])
REFERENCES [dbo].[tipoResolucion] ([idTipoResolucion])
GO
ALTER TABLE [dbo].[resolucion] CHECK CONSTRAINT [resolucion_tipoResolucion_FK]
GO
ALTER TABLE [dbo].[rutas]  WITH CHECK ADD  CONSTRAINT [FK_idTipoTransporte] FOREIGN KEY([idTipoTransporte])
REFERENCES [dbo].[tipoTransporte] ([idTipoTransporte])
GO
ALTER TABLE [dbo].[rutas] CHECK CONSTRAINT [FK_idTipoTransporte]
GO
ALTER TABLE [dbo].[rutas]  WITH CHECK ADD  CONSTRAINT [FK_idTransportista] FOREIGN KEY([idTransportista])
REFERENCES [dbo].[transportista] ([idTransportista])
GO
ALTER TABLE [dbo].[rutas] CHECK CONSTRAINT [FK_idTransportista]
GO
ALTER TABLE [dbo].[subTipoDocto]  WITH CHECK ADD  CONSTRAINT [subTipoDocto_tipoDocto_FK] FOREIGN KEY([idTipoDocto])
REFERENCES [dbo].[tipoDocto] ([idTipoDocto])
GO
ALTER TABLE [dbo].[subTipoDocto] CHECK CONSTRAINT [subTipoDocto_tipoDocto_FK]
GO
ALTER TABLE [dbo].[valor]  WITH CHECK ADD  CONSTRAINT [idOrigenFondos_FK] FOREIGN KEY([idOrigenFondos])
REFERENCES [dbo].[origenFondos] ([idOrigenFondos])
GO
ALTER TABLE [dbo].[valor] CHECK CONSTRAINT [idOrigenFondos_FK]
GO
ALTER TABLE [dbo].[valor]  WITH CHECK ADD  CONSTRAINT [idPrechequeo_FK] FOREIGN KEY([idPrechequeo])
REFERENCES [dbo].[prechequeo] ([idPrechequeo])
GO
ALTER TABLE [dbo].[valor] CHECK CONSTRAINT [idPrechequeo_FK]
GO
ALTER TABLE [dbo].[valor]  WITH CHECK ADD  CONSTRAINT [idTipoArticulo_FK] FOREIGN KEY([idTipoArticulo])
REFERENCES [dbo].[tipoArticulo] ([idTipoArticulo])
GO
ALTER TABLE [dbo].[valor] CHECK CONSTRAINT [idTipoArticulo_FK]
GO
ALTER TABLE [dbo].[valor]  WITH CHECK ADD  CONSTRAINT [idTipoMoneda_FK] FOREIGN KEY([idTipoMoneda])
REFERENCES [dbo].[tipoMoneda] ([idTipoMoneda])
GO
ALTER TABLE [dbo].[valor] CHECK CONSTRAINT [idTipoMoneda_FK]
GO
ALTER TABLE [dbo].[valor]  WITH CHECK ADD  CONSTRAINT [idTipoTitulo_FK] FOREIGN KEY([idTipoTitulo])
REFERENCES [dbo].[tipoTitulo] ([idTipoTitulo])
GO
ALTER TABLE [dbo].[valor] CHECK CONSTRAINT [idTipoTitulo_FK]
GO
ALTER TABLE [dbo].[valor]  WITH CHECK ADD  CONSTRAINT [idTipoValor_FK] FOREIGN KEY([idTipoValor])
REFERENCES [dbo].[tipoValor] ([idTipoValor])
GO
ALTER TABLE [dbo].[valor] CHECK CONSTRAINT [idTipoValor_FK]
GO
/****** Object:  StoredProcedure [dbo].[sp_addprechequeo]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_addprechequeo] (
@idDoctoPersona		int,
@codigo				varchar(100),
@fecha				date,
@idDelegacion		int,
@idTipoMovimiento	int,
@fechaLlegada		date,
@fechaSalida			date,
@idTipoViaje			int,
@idRuta				int,
@idPaisOrigen		int,
@idPaisDestino		int,
@placaVehiculo		varchar(100),
@dineroMayorLimite	char(1),
@autorizaCompartir	char(1),
@aurtorizaVerificar	char(1),
@idLimiteDinero		int,
@llaveCifrada		varchar(1000),
@qr					varchar(1000),
@ip					varchar(25),
@activo				char(1),
@idUsuarioIng		int,
@fechaIng			date,
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

insert into prechequeo(idDoctoPersona,codigo,fecha,idDelegacion,idTipoMovimiento,fechaLlegada,fechaSalida,idTipoViaje,idRuta,idPaisOrigen,idPaisDestino,placaVehiculo,dineroMayorLimite,autorizaCompartir,aurtorizaVerificar,idLimiteDinero,
llaveCifrada,qr,ip,activo,idUsuarioIng,fechaIng,idUsuarioAct,fechaAct)
values
(
@idDoctoPersona,
@codigo,
@fecha,
@idDelegacion,
@idTipoMovimiento,
@fechaLlegada,
@fechaSalida,
@idTipoViaje,
@idRuta,
@idPaisOrigen,
@idPaisDestino,
@placaVehiculo,
@dineroMayorLimite,
@autorizaCompartir,
@aurtorizaVerificar,
@idLimiteDinero,
@llaveCifrada,
@qr,
@ip,
@activo,
@idUsuarioIng,
@fechaIng,
@idUsuarioAct,
@fechaAct
)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_addval]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_addval] (
@idPrechequeo		int,
@idTipoValor			int,
@idTipoMoneda		int,
@idTipoTitulo		int,
@idTipoArticulo		int,
@valor				decimal(12,2),
@idOrigenFondos		int,
@activo				char(1),
@idUsuarioIng		int,
@fechaIng			date,
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

insert into valor(idPrechequeo,idTipoValor,idTipoMoneda,idTipoTitulo,idTipoArticulo,valor,idOrigenFondos,activo,idUsuarioIng,fechaIng,idUsuarioAct,fechaAct)
values
(
@idPrechequeo,
@idTipoValor,
@idTipoMoneda,
@idTipoTitulo,
@idTipoArticulo,
@valor,
@idOrigenFondos,
@activo,
@idUsuarioIng,
@fechaIng,
@idUsuarioAct,
@fechaAct
)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteprec]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_deleteprec](
@idprec int
)
as
begin

delete from prechequeo where idPrechequeo = @idprec

end

GO
/****** Object:  StoredProcedure [dbo].[sp_delpais]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_delpais](@idtDoc int)
as
begin
delete from pais where idPais = @idtDoc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DELsubTipoDocto]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_DELsubTipoDocto](
@idtDoc int
)
as
begin

delete from subTipoDocto where idSubTipoDocto = @idtDoc

end

GO
/****** Object:  StoredProcedure [dbo].[sp_DELtipoDocto]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DELtipoDocto](
@idtDoc int
)
as
begin

delete from tipoDocto where idTipoDocto = @idtDoc

end

GO
/****** Object:  StoredProcedure [dbo].[sp_edit_tipoDocto]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_edit_tipoDocto](
@idtDoc	int,
@nombre				varchar(100),
@activo				char(1),
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

update tipoDocto set 
nombre = @nombre,
activo = @activo,
idUsuarioAct = @idUsuarioAct,
fechaAct = getdate()
where idTipoDocto = @idtDoc

end

GO
/****** Object:  StoredProcedure [dbo].[sp_editprec]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_editprec](
@idprec	int,
@codigo				varchar(100),
@fecha				date,
@fechaLlegada		date,
@fechaSalida			date,
@idTipoViaje			int,
@idRuta				int,
@idPaisOrigen		int,
@idPaisDestino		int,
@placaVehiculo		varchar(100),
@dineroMayorLimite	char(1),
@autorizaCompartir	char(1),
@aurtorizaVerificar	char(1),
@llaveCifrada		varchar(1000),
@qr					varchar(1000),
@ip					varchar(25),
@activo				char(1),
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

update prechequeo set 

codigo=@codigo,
fecha=@fecha,
fechaLlegada =@fechaLlegada,
@fechaSalida=@fechaSalida,
idRuta=@idRuta,
@idPaisOrigen=@idPaisOrigen,
@idPaisDestino=@idPaisDestino,
placaVehiculo=@placaVehiculo,
@dineroMayorLimite=@dineroMayorLimite,
@autorizaCompartir=@autorizaCompartir,
aurtorizaVerificar=@aurtorizaVerificar,
llaveCifrada=@llaveCifrada,
qr=@qr,
ip=@ip,
activo=@activo,
idUsuarioAct=@idUsuarioAct,
fechaAct= GETDATE()
where idPrechequeo = @idprec

end

GO
/****** Object:  StoredProcedure [dbo].[sp_editsubTipoDocto]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_editsubTipoDocto](
@idtDoc	int,
@nombre				varchar(100),
@activo				char(1),
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

update subTipoDocto set 
nombre = @nombre,
activo = @activo,
idUsuarioAct = @idUsuarioAct,
fechaAct = getdate()
where idSubTipoDocto = @idtDoc

end

GO
/****** Object:  StoredProcedure [dbo].[sp_eliminardoctoIdentificacion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_eliminardoctoIdentificacion](
@idDoc int
)
as
begin

delete from doctoIdentificacion where idDoctoIdentificacion = @idDoc

end

GO
/****** Object:  StoredProcedure [dbo].[sp_eliminardoctopersona]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_eliminardoctopersona](
@iddoctopersona int
)
as
begin

delete from doctoPersona where idDoctoPersona = @iddoctopersona

end

GO
/****** Object:  StoredProcedure [dbo].[sp_eliminargenero]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_eliminargenero](
@idgenero int
)
as
begin

delete from genero where idGenero = @idgenero

end

GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarocupacion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_eliminarocupacion](
@idocupacion int
)
as
begin

delete from ocupacion where idOcupacion = @idocupacion

end

GO
/****** Object:  StoredProcedure [dbo].[sp_lispaisid]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_lispaisid](@idtipod int)
as
begin

select * from pais where idPais = @idtipod
end

GO
/****** Object:  StoredProcedure [dbo].[sp_lisPrechequeo]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_lisPrechequeo]
as
begin

select * from prechequeo
end


GO
/****** Object:  StoredProcedure [dbo].[sp_listardoctoPersona]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listardoctoPersona]
as
begin

select * from doctoPersona
end


GO
/****** Object:  StoredProcedure [dbo].[sp_listargenero]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_listargenero]
as
begin

select* from genero
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listarocupacion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarocupacion]
as
begin

select * from ocupacion
end


GO
/****** Object:  StoredProcedure [dbo].[sp_listarpais]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarpais]
as
begin
select * from pais
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listarsubTipoDocto]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarsubTipoDocto]
as
begin

select * from subTipoDocto
end


GO
/****** Object:  StoredProcedure [dbo].[sp_listarsubTipoDoctoID]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarsubTipoDoctoID](@idsubdoc int)
as
begin

select * from subTipoDocto where idSubTipoDocto = @idsubdoc
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listartipodoc]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listartipodoc]
as
begin

select * from doctoIdentificacion
end


GO
/****** Object:  StoredProcedure [dbo].[sp_listaval]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listaval]
as
begin

select * from valor
end


GO
/****** Object:  StoredProcedure [dbo].[sp_listdoc]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listdoc](@idtipod int)
as
begin

select * from tipoDocto where idTipoDocto = @idtipod
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listdocID]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listdocID](@idtipod int)
as
begin

select * from tipoDocto where idTipoDocto = @idtipod
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listipodoc]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listipodoc]
as
begin

select * from tipoDocto
end


GO
/****** Object:  StoredProcedure [dbo].[sp_modificardoctoIdentificacion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_modificardoctoIdentificacion](
@idDoc	int,
@numero varchar(100),
@activo					char(1),
@idUsuarioAct			int,
@fechaAct				date
)
as
begin

update doctoIdentificacion set 
numero = @numero,
activo = @activo,
idUsuarioAct = @idUsuarioAct,
fechaAct = getdate()
where idDoctoIdentificacion = @idDoc

end

GO
/****** Object:  StoredProcedure [dbo].[sp_modificardoctopersona]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_modificardoctopersona](
@iddoctopersona int,
@activo					char(1),
@idUsuarioAct			int,
@fechaAct				date
)
as
begin

update doctoPersona set 
activo = @activo,
idUsuarioAct = @idUsuarioAct,
fechaAct = getdate()
where idDoctoPersona = @iddoctopersona

end

GO
/****** Object:  StoredProcedure [dbo].[sp_modificargenero]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_modificargenero](
@idgenero int,
@nombre				varchar(100),
@activo				char(1),
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

update genero set 
nombre = @nombre,
activo = @activo,
idUsuarioAct = @idUsuarioAct,
fechaAct = GETDATE()
where idGenero = @idgenero

end

GO
/****** Object:  StoredProcedure [dbo].[sp_modificarocupacion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[sp_modificarocupacion](
@idocupacion int,
@nombre				varchar(100),
@activo				char(1),
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

update ocupacion set 
nombre = @nombre,
activo = @activo,
idUsuarioAct = @idUsuarioAct,
fechaAct = getdate()
where idOcupacion = @idocupacion

end

GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerdoctoIdentificacion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_obtenerdoctoIdentificacion](@idtipodoc int)
as
begin

select * from doctoIdentificacion where idDoctoIdentificacion = @idtipodoc
end

GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerdoctopersonaid]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_obtenerdoctopersonaid](@iddoctopersona int)
as
begin

select * from doctoPersona where idDoctoPersona = @iddoctopersona
end

GO
/****** Object:  StoredProcedure [dbo].[sp_obtenergenid]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_obtenergenid](@idgenero int)
as
begin

select * from genero where idGenero = @idgenero
end

GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerocupacionid]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_obtenerocupacionid](@idocupacion int)
as
begin

select * from ocupacion where idOcupacion = @idocupacion
end

GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerpreID]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_obtenerpreID](@idprec int)
as
begin

select * from prechequeo where idPrechequeo = @idprec
end

GO
/****** Object:  StoredProcedure [dbo].[sp_registrar_subTipoDocto]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_registrar_subTipoDocto](

@idTipoDocto			int,
@nombre				varchar(100),
@activo				char(1),
@idUsuarioIng		int,
@fechaIng			date,
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

insert into subTipoDocto(
idTipoDocto,
nombre,
activo,
idUsuarioIng,
fechaIng,
idUsuarioAct,
fechaAct)
values
(
@idTipoDocto,
@nombre,
@activo,
@idUsuarioIng,
getdate(),
@idUsuarioAct,
getdate()

)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_registrar_tipoDocto]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_registrar_tipoDocto](

@nombre				varchar(100),
@activo				char(1),
@idUsuarioIng		int,
@fechaIng			date,
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

insert into tipoDocto(

nombre,
activo,
idUsuarioIng,
fechaIng,
idUsuarioAct,
fechaAct
)
values
(

@nombre,
@activo,
@idUsuarioIng,
getdate(),
@idUsuarioAct,
getdate()

)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_registrardoctoIdentificacion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_registrardoctoIdentificacion](
@idSubTipoDocto			int,
@numero					varchar(100),
@fechaEmision			date,
@fechaVencimiento		date,
@activo					char(1),
@idUsuarioIng			int,
@fechaIng				date,
@idUsuarioAct			int,
@fechaAct				date
)
as
begin

insert into doctoIdentificacion(
idSubTipoDocto,
numero,
fechaEmision,
fechaVencimiento,
activo,
idUsuarioIng,
fechaIng,
idUsuarioAct,
fechaAct)
values
(
@idSubTipoDocto,
@numero,
@fechaEmision,
@fechaVencimiento,
@activo,
@idUsuarioIng,
getdate(),
@idUsuarioAct,
getdate()

)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_registrardoctopersona]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_registrardoctopersona](
@idDoctoIdentificacion	int,
@idPersona				int,
@activo					char(1),
@idUsuarioIng			int,
@fechaIng				date,
@idUsuarioAct			int,
@fechaAct				date
)
as
begin

insert into doctoPersona(idDoctoIdentificacion,idPersona,activo,idUsuarioIng,fechaIng,idUsuarioAct,fechaAct)
values
(
@idDoctoIdentificacion,
@idPersona,
@activo,
@idUsuarioIng,
@fechaIng,
@idUsuarioAct,
@fechaAct

)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_registrargenero]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_registrargenero](

@nombre				varchar(100),
@activo				char(1),
@idUsuarioIng		int,
@fechaIng			date,
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

insert into genero(nombre,activo,idUsuarioIng,fechaIng,idUsuarioAct,fechaAct)
values
(
@nombre,			
@activo,			
@idUsuarioIng,
@fechaIng,	
@idUsuarioAct,		
@fechaAct
)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_registrarocupacion]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_registrarocupacion](
@nombre				varchar(100),
@activo				char(1),
@idUsuarioIng		int,
@fechaIng			date,
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

insert into ocupacion(nombre,activo,idUsuarioIng,fechaIng,idUsuarioAct,fechaAct)
values
(
@nombre,			
@activo,			
@idUsuarioIng,		
@fechaIng,	
@idUsuarioAct,		
@fechaAct			

)

end


GO
/****** Object:  StoredProcedure [dbo].[sp_regpais]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_regpais](

@nombre				varchar(100),
@iso					varchar(3),
@iata				varchar(3),
@activo				char(1),
@idUsuarioIng		int,
@fechaIng			date,
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

insert into pais(nombre,iso,iata,activo,idUsuarioIng,fechaIng,idUsuarioAct,fechaAct)
values
(
@nombre,
@iso,
@iata,
@activo,
@idUsuarioIng,
getdate(),
@idUsuarioAct,
getdate()

)
end
GO
/****** Object:  StoredProcedure [dbo].[spedit_pais]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spedit_pais](
@idtDoc	int,
@nombre				varchar(100),
@iso					varchar(3),
@iata				varchar(3),
@activo				char(1),
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

update pais set 
nombre =@nombre,
iso = @iso,
iata = @iata,
activo = @activo,
idUsuarioAct=@idUsuarioAct,
fechaAct = getdate()
where idPais = @idtDoc

end

GO
/****** Object:  StoredProcedure [dbo].[usp_eliminar]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_eliminar](
@idusuario int
)
as
begin

delete from persona where idPersona = @idusuario

end

GO
/****** Object:  StoredProcedure [dbo].[usp_listar]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_listar]
as
begin

select * from persona
end


GO
/****** Object:  StoredProcedure [dbo].[usp_modificarpersona]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_modificarpersona](
@idpersona int,
@primerNombre		varchar(100),
@segundoNombre		varchar(100),
@tercerNombre		varchar(100),
@primerApellido		varchar(100),
@segundoApellido		varchar(100),
@apellidoCasada		varchar(100),
@fechaNac			date,
@idGenero			int,
@idOcupacion			int,
@idPaisNacimiento	int,
@idPaisNacionalidad	int,
@idPaisResidencia	int,
@activo				char(1),
@idUsuarioIng		int,
@fechaIng			date,
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

update persona set 
primerNombre = @primerNombre,
segundoNombre= @segundoNombre,
tercerNombre= @tercerNombre,
primerApellido=@primerApellido,
segundoApellido= @segundoApellido,
apellidoCasada = @apellidoCasada,
fechaNac = @fechaNac,
idGenero = @idGenero,
idOcupacion = @idOcupacion,
idPaisNacimiento = @idPaisNacimiento,
idPaisNacionalidad = @idPaisNacionalidad,
idPaisResidencia = @idPaisResidencia,
activo = @activo,
idUsuarioIng = @idUsuarioIng,
fechaIng = @fechaIng,
idUsuarioAct = @idUsuarioAct,
fechaAct = @fechaAct
where idPersona = @idpersona

end

GO
/****** Object:  StoredProcedure [dbo].[usp_obtener]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_obtener](@idusuario int)
as
begin

select * from persona where idPersona = @idusuario
end
GO
/****** Object:  StoredProcedure [dbo].[usp_registrarpersona]    Script Date: 13/06/2021 00:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_registrarpersona](
@primerNombre		varchar(100),
@segundoNombre		varchar(100),
@tercerNombre		varchar(100),
@primerApellido		varchar(100),
@segundoApellido		varchar(100),
@apellidoCasada		varchar(100),
@fechaNac			date,
@idGenero			int,
@idOcupacion			int,
@idPaisNacimiento	int,
@idPaisNacionalidad	int,
@idPaisResidencia	int,
@activo				char(1),
@idUsuarioIng		int,
@fechaIng			date,
@idUsuarioAct		int,
@fechaAct			date
)
as
begin

insert into persona(primerNombre,segundoNombre,tercerNombre,primerApellido,segundoApellido,apellidoCasada,fechaNac,idGenero,idOcupacion,idPaisNacimiento,idPaisNacionalidad,idPaisResidencia,activo,idUsuarioIng,fechaIng,idUsuarioAct,fechaAct	)
values
(
@primerNombre,
@segundoNombre,		
@tercerNombre,		
@primerApellido,		
@segundoApellido,		
@apellidoCasada,		
@fechaNac,			
@idGenero,			
@idOcupacion,			
@idPaisNacimiento,	
@idPaisNacionalidad,	
@idPaisResidencia,	
@activo,				
@idUsuarioIng,		
@fechaIng,			
@idUsuarioAct,		
@fechaAct	
)

end


GO
USE [master]
GO
ALTER DATABASE [Datos_usuario] SET  READ_WRITE 
GO
