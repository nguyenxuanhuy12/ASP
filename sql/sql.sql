USE [master]
GO
/****** Object:  Database [webBH]    Script Date: 11/11/2023 2:39:56 CH ******/
CREATE DATABASE [webBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webBH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\webBH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'webBH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\webBH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [webBH] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [webBH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [webBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webBH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [webBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webBH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [webBH] SET  MULTI_USER 
GO
ALTER DATABASE [webBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webBH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [webBH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [webBH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [webBH] SET QUERY_STORE = ON
GO
ALTER DATABASE [webBH] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [webBH]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/11/2023 2:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Sum] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/11/2023 2:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/11/2023 2:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/11/2023 2:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Avatar] [varchar](100) NULL,
	[CategoryId] [int] NULL,
	[Price] [nchar](10) NULL,
	[Mota] [ntext] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/11/2023 2:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [Name], [Avatar], [Description]) VALUES (1, N'ROGPHONE', N'asus.png', N'Hiệu Năng Chơi Game Và Khả Năng Tản Nhiệt Tốt')
INSERT [dbo].[Category] ([id], [Name], [Avatar], [Description]) VALUES (2, N'BLACKSHARK', N'blackshark.png', N'Hiệu Năng Tốt Sạc Nhanh Nhẹ Nhàng Thon Gọn')
INSERT [dbo].[Category] ([id], [Name], [Avatar], [Description]) VALUES (3, N'REDMAGIC', N'redmagic.png', N'Hiệu Năng Cân Đối Tản Nhiệt Tốt Nhẹ Nhàng')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (15, N'Asus', N'asus_20231111123705.png', 1, N'12.000.000', N'Chinh phạt mọi giới hạn - Snapdragon 888 mạnh mẽ, RAM LPDDR5, bộ nhớ UFS 3.1 Hiển thị đẳng cấp - Màn hình AMOLED tần số quét 144Hz, phản hồi 1ms, kính Gorilla Victus Tính năng dành cho game thủ - Cảm ứng đa điểm AirTrigger 5, loa kép chất lượng')
INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (16, N'Rog Phone 2', N'rog2_20231111123622.png', 1, N'8.000.000 ', N'Chinh phạt mọi giới hạn - Snapdragon 888 mạnh mẽ, RAM LPDDR5, bộ nhớ UFS 3.1 Hiển thị đẳng cấp - Màn hình AMOLED tần số quét 144Hz, phản hồi 1ms, kính Gorilla Victus Tính năng dành cho game thủ - Cảm ứng đa điểm AirTrigger 5, loa kép chất lượng')
INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (17, N'Rog Phone 3', N'rog3_20231111123603.png', 1, N'9.000.000 ', N'Chinh phạt mọi giới hạn - Snapdragon 888 mạnh mẽ, RAM LPDDR5, bộ nhớ UFS 3.1 Hiển thị đẳng cấp - Màn hình AMOLED tần số quét 144Hz, phản hồi 1ms, kính Gorilla Victus Tính năng dành cho game thủ - Cảm ứng đa điểm AirTrigger 5, loa kép chất lượng')
INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (18, N'Rog Phone 5', N'rog5_20231111123540.png', 1, N'11.000.000', N'Chinh phạt mọi giới hạn - Snapdragon 888 mạnh mẽ, RAM LPDDR5, bộ nhớ UFS 3.1 Hiển thị đẳng cấp - Màn hình AMOLED tần số quét 144Hz, phản hồi 1ms, kính Gorilla Victus Tính năng dành cho game thủ - Cảm ứng đa điểm AirTrigger 5, loa kép chất lượng')
INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (19, N'Black Shark 6', N'blackshark_20231111123408.png', 2, N'12.000.000', N'Chinh phạt mọi giới hạn - Snapdragon 888 mạnh mẽ, RAM LPDDR5, bộ nhớ UFS 3.1 Hiển thị đẳng cấp - Màn hình AMOLED tần số quét 144Hz, phản hồi 1ms, kính Gorilla Victus Tính năng dành cho game thủ - Cảm ứng đa điểm AirTrigger 5, loa kép chất lượng')
INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (20, N'Black Shark 2', N'blackshark2_20231111123344.png', 2, N'8.000.000 ', N'Chinh phạt mọi giới hạn - Snapdragon 888 mạnh mẽ, RAM LPDDR5, bộ nhớ UFS 3.1 Hiển thị đẳng cấp - Màn hình AMOLED tần số quét 144Hz, phản hồi 1ms, kính Gorilla Victus Tính năng dành cho game thủ - Cảm ứng đa điểm AirTrigger 5, loa kép chất lượng')
INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (21, N'Black Shark 3', N'blackshark3_20231111123133.png', 2, N'9.000.000 ', N'Chinh phạt mọi giới hạn - Snapdragon 888 mạnh mẽ, RAM LPDDR5, bộ nhớ UFS 3.1 Hiển thị đẳng cấp - Màn hình AMOLED tần số quét 144Hz, phản hồi 1ms, kính Gorilla Victus Tính năng dành cho game thủ - Cảm ứng đa điểm AirTrigger 5, loa kép chất lượng')
INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (22, N'Black Shark 4', N'blackshark4_20231111123116.png', 2, N'12.000.000', N'Chinh phạt mọi giới hạn - Snapdragon 888 mạnh mẽ, RAM LPDDR5, bộ nhớ UFS 3.1 Hiển thị đẳng cấp - Màn hình AMOLED tần số quét 144Hz, phản hồi 1ms, kính Gorilla Victus Tính năng dành cho game thủ - Cảm ứng đa điểm AirTrigger 5, loa kép chất lượng')
INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (23, N'Redmi K40 Gaming', N'redmagic_20231111123026.png', 3, N'8.000.000 ', N'Chinh phạt mọi giới hạn - Snapdragon 888 mạnh mẽ, RAM LPDDR5, bộ nhớ UFS 3.1 Hiển thị đẳng cấp - Màn hình AMOLED tần số quét 144Hz, phản hồi 1ms, kính Gorilla Victus Tính năng dành cho game thủ - Cảm ứng đa điểm AirTrigger 5, loa kép chất lượng')
INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (24, N'Redmi K50 Gaming', N'redmik50_20231111123006.png', 3, N'9.000.000 ', N'Chinh phạt mọi giới hạn - Snapdragon 888 mạnh mẽ, RAM LPDDR5, bộ nhớ UFS 3.1 Hiển thị đẳng cấp - Màn hình AMOLED tần số quét 144Hz, phản hồi 1ms, kính Gorilla Victus Tính năng dành cho game thủ - Cảm ứng đa điểm AirTrigger 5, loa kép chất lượng')
INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (25, N'Redmi K60 Gaming', N'redmik60_20231111122939.png', 3, N'12.000.000', N'Chinh phạt mọi giới hạn - Snapdragon 888 mạnh mẽ, RAM LPDDR5, bộ nhớ UFS 3.1 Hiển thị đẳng cấp - Màn hình AMOLED tần số quét 144Hz, phản hồi 1ms, kính Gorilla Victus Tính năng dành cho game thủ - Cảm ứng đa điểm AirTrigger 5, loa kép chất lượng')
INSERT [dbo].[Product] ([id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (26, N'Rog Phone 77', NULL, 1, N'12.000.000', N'Black Shark 5 sở hữu cấu hình với con chip xử lý Snapdragon 870 5G (7 nm), đi kèm đó là dung lượng bộ nhớ lên đến 128GB 8GB RAM, 128GB 12GB RAM, 256GB 12GB RAM. ')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (1, N'huy44', N'huy44', N'hhh@gmail.com', N'1234')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (8, N'nhat', N'nhat', N'xuanhuy@gmail.com', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (9, N'hhuy', N'hhuy', N'xhuy@gmail.com', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (19, N'huyy11', N'huyy11', N'huy111@gmail.com', N'123')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (20, NULL, NULL, N'huy33@gmail.com', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (21, NULL, NULL, N'huy44@gmail.com', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (22, NULL, NULL, N'phap@gmail.com', N'202cb962ac59075b964b07152d234b70')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [webBH] SET  READ_WRITE 
GO
