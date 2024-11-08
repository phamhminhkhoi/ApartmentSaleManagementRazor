USE [master]
GO
/****** Object:  Database [SaleManagement]    Script Date: 11/2/2024 7:11:52 PM ******/
CREATE DATABASE [SaleManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaleManagement', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\SaleManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SaleManagement_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\SaleManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SaleManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaleManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaleManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaleManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaleManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaleManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaleManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaleManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SaleManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaleManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaleManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaleManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaleManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaleManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaleManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaleManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaleManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SaleManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaleManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaleManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaleManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaleManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaleManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaleManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaleManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SaleManagement] SET  MULTI_USER 
GO
ALTER DATABASE [SaleManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaleManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaleManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaleManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SaleManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SaleManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SaleManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [SaleManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SaleManagement]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 11/2/2024 7:11:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[DollarPoint] [decimal](18, 2) NULL,
	[Password] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 11/2/2024 7:11:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[PropertyId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyName] [nvarchar](255) NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[SizeSqFt] [int] NOT NULL,
	[Bedrooms] [int] NULL,
	[Bathrooms] [int] NULL,
	[CategoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyCategory]    Script Date: 11/2/2024 7:11:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUser]    Script Date: 11/2/2024 7:11:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUser](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionDetail]    Script Date: 11/2/2024 7:11:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetail](
	[TransactionDetailId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 11/2/2024 7:11:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[BuyerId] [int] NULL,
	[SellerId] [int] NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberId], [Email], [DollarPoint], [Password], [FullName], [RoleId]) VALUES (1, N'admin@gmail.com', NULL, N'admin123', N'Admin User', 1)
INSERT [dbo].[Member] ([MemberId], [Email], [DollarPoint], [Password], [FullName], [RoleId]) VALUES (2, N'minhtu@gmail.com', NULL, N'123', N'Pham Tran Minh Tu', 2)
INSERT [dbo].[Member] ([MemberId], [Email], [DollarPoint], [Password], [FullName], [RoleId]) VALUES (3, N'thanhhai@gmail.com', NULL, N'123', N'Nguyen Thanh Hai', 2)
INSERT [dbo].[Member] ([MemberId], [Email], [DollarPoint], [Password], [FullName], [RoleId]) VALUES (4, N'huynhson@gmail.com', NULL, N'123', N'Huynh Ngoc Son', 3)
INSERT [dbo].[Member] ([MemberId], [Email], [DollarPoint], [Password], [FullName], [RoleId]) VALUES (5, N'levi@gmail.com', NULL, N'123', N'Pham Thi Le Vi', 3)
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Property] ON 

INSERT [dbo].[Property] ([PropertyId], [PropertyName], [Location], [Description], [Price], [SizeSqFt], [Bedrooms], [Bathrooms], [CategoryId]) VALUES (16, N'Luxury Apartment', N'Downtown', N'A modern and luxurious apartment located in the heart of downtown, offering stunning views and premium amenities.', CAST(200000.00 AS Decimal(18, 2)), 1200, 3, 2, 1)
INSERT [dbo].[Property] ([PropertyId], [PropertyName], [Location], [Description], [Price], [SizeSqFt], [Bedrooms], [Bathrooms], [CategoryId]) VALUES (17, N'Family House', N'Suburb', N'A spacious family home in a peaceful suburban area, featuring a large garden, multiple bedrooms, and a welcoming community.', CAST(300000.00 AS Decimal(18, 2)), 2500, 4, 3, 2)
INSERT [dbo].[Property] ([PropertyId], [PropertyName], [Location], [Description], [Price], [SizeSqFt], [Bedrooms], [Bathrooms], [CategoryId]) VALUES (18, N'Stylish Condo', N'City Center', N'A contemporary and stylish condo located in the city center, ideal for those seeking a modern urban lifestyle.', CAST(150000.00 AS Decimal(18, 2)), 900, 2, 1, 3)
INSERT [dbo].[Property] ([PropertyId], [PropertyName], [Location], [Description], [Price], [SizeSqFt], [Bedrooms], [Bathrooms], [CategoryId]) VALUES (35, N'Landmark 81', N'HCM', N'Penthouse to live', CAST(10000000000.00 AS Decimal(18, 2)), 1200, 3, 2, 5)
INSERT [dbo].[Property] ([PropertyId], [PropertyName], [Location], [Description], [Price], [SizeSqFt], [Bedrooms], [Bathrooms], [CategoryId]) VALUES (39, N'Vinhome Ocean Park', N'HN', N'Greate apartment complex', CAST(10000000.00 AS Decimal(18, 2)), 800, 3, 2, 4)
SET IDENTITY_INSERT [dbo].[Property] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyCategory] ON 

INSERT [dbo].[PropertyCategory] ([CategoryId], [CategoryName]) VALUES (1, N'Apartment')
INSERT [dbo].[PropertyCategory] ([CategoryId], [CategoryName]) VALUES (2, N'House')
INSERT [dbo].[PropertyCategory] ([CategoryId], [CategoryName]) VALUES (3, N'Condominium')
INSERT [dbo].[PropertyCategory] ([CategoryId], [CategoryName]) VALUES (4, N'Townhouse')
INSERT [dbo].[PropertyCategory] ([CategoryId], [CategoryName]) VALUES (5, N'Penthouse')
SET IDENTITY_INSERT [dbo].[PropertyCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleUser] ON 

INSERT [dbo].[RoleUser] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[RoleUser] ([RoleId], [RoleName]) VALUES (2, N'Buyer')
INSERT [dbo].[RoleUser] ([RoleId], [RoleName]) VALUES (4, N'Manager')
INSERT [dbo].[RoleUser] ([RoleId], [RoleName]) VALUES (3, N'Seller')
SET IDENTITY_INSERT [dbo].[RoleUser] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionDetail] ON 

INSERT [dbo].[TransactionDetail] ([TransactionDetailId], [TransactionId], [PropertyId], [Quantity], [Price]) VALUES (10, 7, 16, 1, CAST(200000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TransactionDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionId], [TransactionDate], [BuyerId], [SellerId], [TotalAmount]) VALUES (7, CAST(N'2024-10-27T00:00:00.000' AS DateTime), 2, 4, CAST(200000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__RoleUser__8A2B6160254294A7]    Script Date: 11/2/2024 7:11:53 PM ******/
ALTER TABLE [dbo].[RoleUser] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionDetail] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_RoleUser_Member] FOREIGN KEY([RoleId])
REFERENCES [dbo].[RoleUser] ([RoleId])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_RoleUser_Member]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_PropertyCategory_Property] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[PropertyCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_PropertyCategory_Property]
GO
ALTER TABLE [dbo].[TransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_Property_TransactionDetail] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[TransactionDetail] CHECK CONSTRAINT [FK_Property_TransactionDetail]
GO
ALTER TABLE [dbo].[TransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_TransactionDetail] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transactions] ([TransactionId])
GO
ALTER TABLE [dbo].[TransactionDetail] CHECK CONSTRAINT [FK_Transaction_TransactionDetail]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Buyer_Member] FOREIGN KEY([BuyerId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Buyer_Member]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Seller_Member] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Seller_Member]
GO
USE [master]
GO
ALTER DATABASE [SaleManagement] SET  READ_WRITE 
GO
