USE [master]
GO
/****** Object:  Database [Littleecommerce]    Script Date: 11/3/2021 5:46:17 PM ******/
CREATE DATABASE [Littleecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Littleecommerce', FILENAME = N'/var/opt/mssql/data/Littleecommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Littleecommerce_log', FILENAME = N'/var/opt/mssql/data/Littleecommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Littleecommerce] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Littleecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Littleecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Littleecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Littleecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Littleecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Littleecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [Littleecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Littleecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Littleecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Littleecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Littleecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Littleecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Littleecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Littleecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Littleecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Littleecommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Littleecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Littleecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Littleecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Littleecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Littleecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Littleecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Littleecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Littleecommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [Littleecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [Littleecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Littleecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Littleecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Littleecommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Littleecommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Littleecommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Littleecommerce', N'ON'
GO
ALTER DATABASE [Littleecommerce] SET QUERY_STORE = OFF
GO
USE [Littleecommerce]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/3/2021 5:46:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[IdItem] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Brand] [nvarchar](max) NULL,
	[NameItem] [nvarchar](max) NULL,
	[C8] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[IdItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SizeClass]    Script Date: 11/3/2021 5:46:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SizeClass](
	[IdSizeClass] [int] IDENTITY(1,1) NOT NULL,
	[Country] [varchar](2) NOT NULL,
	[Label] [varchar](10) NOT NULL,
	[Qta] [int] NOT NULL,
	[C8] [varchar](8) NOT NULL,
	[C2] [varchar](2) NOT NULL,
 CONSTRAINT [PK_SizeClass] PRIMARY KEY CLUSTERED 
(
	[IdSizeClass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variant]    Script Date: 11/3/2021 5:46:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variant](
	[IdVariant] [int] IDENTITY(1,1) NOT NULL,
	[C2] [varchar](2) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[C8] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Variant] PRIMARY KEY CLUSTERED 
(
	[IdVariant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([IdItem], [Price], [Brand], [NameItem], [C8]) VALUES (1, CAST(100.00 AS Decimal(18, 2)), N'Gucci', N'Borsa', N'12345678')
INSERT [dbo].[Item] ([IdItem], [Price], [Brand], [NameItem], [C8]) VALUES (2, CAST(200.00 AS Decimal(18, 2)), N'Versace', N'Portafogli', N'23456789')
INSERT [dbo].[Item] ([IdItem], [Price], [Brand], [NameItem], [C8]) VALUES (3, CAST(250.00 AS Decimal(18, 2)), N'BaciEAbbracci', N'Pantaloni', N'45678901')
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[SizeClass] ON 

INSERT [dbo].[SizeClass] ([IdSizeClass], [Country], [Label], [Qta], [C8], [C2]) VALUES (1, N'CA', N'S', 5, N'12345678', N'AA')
INSERT [dbo].[SizeClass] ([IdSizeClass], [Country], [Label], [Qta], [C8], [C2]) VALUES (2, N'DE', N'S', 5, N'12345678', N'AA')
INSERT [dbo].[SizeClass] ([IdSizeClass], [Country], [Label], [Qta], [C8], [C2]) VALUES (3, N'CA', N'S', 2, N'23456789', N'AA')
INSERT [dbo].[SizeClass] ([IdSizeClass], [Country], [Label], [Qta], [C8], [C2]) VALUES (4, N'DE', N'S', 3, N'23456789', N'AA')
INSERT [dbo].[SizeClass] ([IdSizeClass], [Country], [Label], [Qta], [C8], [C2]) VALUES (5, N'CA', N'S', 4, N'45678901', N'AA')
INSERT [dbo].[SizeClass] ([IdSizeClass], [Country], [Label], [Qta], [C8], [C2]) VALUES (8, N'CA', N'S', 4, N'45678901', N'BB')
INSERT [dbo].[SizeClass] ([IdSizeClass], [Country], [Label], [Qta], [C8], [C2]) VALUES (10, N'DE', N'S', 4, N'45678901', N'BB')
SET IDENTITY_INSERT [dbo].[SizeClass] OFF
GO
SET IDENTITY_INSERT [dbo].[Variant] ON 

INSERT [dbo].[Variant] ([IdVariant], [C2], [Url], [C8]) VALUES (1, N'AA', NULL, N'12345678')
INSERT [dbo].[Variant] ([IdVariant], [C2], [Url], [C8]) VALUES (2, N'AA', NULL, N'23456789')
INSERT [dbo].[Variant] ([IdVariant], [C2], [Url], [C8]) VALUES (3, N'AA', NULL, N'45678901')
INSERT [dbo].[Variant] ([IdVariant], [C2], [Url], [C8]) VALUES (4, N'BB', NULL, N'45678901')
SET IDENTITY_INSERT [dbo].[Variant] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Item_C8]    Script Date: 11/3/2021 5:46:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_C8] ON [dbo].[Item]
(
	[C8] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SizeClass_Unique4Country]    Script Date: 11/3/2021 5:46:18 PM ******/
ALTER TABLE [dbo].[SizeClass] ADD  CONSTRAINT [IX_SizeClass_Unique4Country] UNIQUE NONCLUSTERED 
(
	[C2] ASC,
	[C8] ASC,
	[Country] ASC,
	[Label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SizeClass_Country]    Script Date: 11/3/2021 5:46:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_SizeClass_Country] ON [dbo].[SizeClass]
(
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SizeClass_CountryLabel]    Script Date: 11/3/2021 5:46:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_SizeClass_CountryLabel] ON [dbo].[SizeClass]
(
	[Country] ASC,
	[Label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SizeClass_Label]    Script Date: 11/3/2021 5:46:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_SizeClass_Label] ON [dbo].[SizeClass]
(
	[Label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Variant_C10]    Script Date: 11/3/2021 5:46:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Variant_C10] ON [dbo].[Variant]
(
	[C8] ASC,
	[C2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Variant_C2]    Script Date: 11/3/2021 5:46:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Variant_C2] ON [dbo].[Variant]
(
	[C2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Variant_C8]    Script Date: 11/3/2021 5:46:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Variant_C8] ON [dbo].[Variant]
(
	[C8] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SizeClass] ADD  CONSTRAINT [DF_SizeClass_Qta]  DEFAULT ((0)) FOR [Qta]
GO
USE [master]
GO
ALTER DATABASE [Littleecommerce] SET  READ_WRITE 
GO
