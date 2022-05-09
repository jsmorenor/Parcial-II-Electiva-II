USE [ParcialOut]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [FK_Addresses_Clients]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/05/2022 5:54:55 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 9/05/2022 5:54:55 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clients]') AND type in (N'U'))
DROP TABLE [dbo].[Clients]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/05/2022 5:54:55 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 9/05/2022 5:54:55 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Addresses]') AND type in (N'U'))
DROP TABLE [dbo].[Addresses]
GO
USE [master]
GO
/****** Object:  Database [ParcialOut]    Script Date: 9/05/2022 5:54:55 p. m. ******/
DROP DATABASE [ParcialOut]
GO
/****** Object:  Database [ParcialOut]    Script Date: 9/05/2022 5:54:55 p. m. ******/
CREATE DATABASE [ParcialOut]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ParcialOut', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ParcialOut.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ParcialOut_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ParcialOut_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ParcialOut] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ParcialOut].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ParcialOut] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ParcialOut] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ParcialOut] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ParcialOut] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ParcialOut] SET ARITHABORT OFF 
GO
ALTER DATABASE [ParcialOut] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ParcialOut] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ParcialOut] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ParcialOut] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ParcialOut] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ParcialOut] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ParcialOut] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ParcialOut] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ParcialOut] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ParcialOut] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ParcialOut] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ParcialOut] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ParcialOut] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ParcialOut] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ParcialOut] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ParcialOut] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ParcialOut] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ParcialOut] SET RECOVERY FULL 
GO
ALTER DATABASE [ParcialOut] SET  MULTI_USER 
GO
ALTER DATABASE [ParcialOut] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ParcialOut] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ParcialOut] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ParcialOut] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ParcialOut] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ParcialOut] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ParcialOut', N'ON'
GO
ALTER DATABASE [ParcialOut] SET QUERY_STORE = OFF
GO
USE [ParcialOut]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 9/05/2022 5:54:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id_Address] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](123) NOT NULL,
	[City] [varchar](163) NOT NULL,
	[Region] [varchar](60) NULL,
	[PostalCode] [varchar](15) NULL,
	[Country] [varchar](50) NOT NULL,
	[Client_Id] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id_Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/05/2022 5:54:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id_Category] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](103) NOT NULL,
	[Origin] [char](1) NOT NULL,
	[Origin_Id] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 9/05/2022 5:54:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id_Client] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](128) NOT NULL,
	[ContactName] [varchar](163) NULL,
	[Phone] [varchar](25) NULL,
	[Origin] [char](1) NOT NULL,
	[Origin_Id] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/05/2022 5:54:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id_Product] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](200) NOT NULL,
	[Price] [money] NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Origin_Id] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses]  WITH NOCHECK ADD  CONSTRAINT [FK_Addresses_Clients] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Clients] ([Id_Client])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Clients]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Categories] ([Id_Category])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [ParcialOut] SET  READ_WRITE 
GO
