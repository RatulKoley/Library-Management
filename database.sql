USE [master]
GO
/****** Object:  Database [libraryproject]    Script Date: 03-02-2023 01:30:19 PM ******/
CREATE DATABASE [libraryproject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'libraryproject', FILENAME = N'D:\Installed Apps\sql server\MSSQL15.SQLEXPRESS\MSSQL\DATA\libraryproject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'libraryproject_log', FILENAME = N'D:\Installed Apps\sql server\MSSQL15.SQLEXPRESS\MSSQL\DATA\libraryproject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [libraryproject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [libraryproject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [libraryproject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [libraryproject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [libraryproject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [libraryproject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [libraryproject] SET ARITHABORT OFF 
GO
ALTER DATABASE [libraryproject] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [libraryproject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [libraryproject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [libraryproject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [libraryproject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [libraryproject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [libraryproject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [libraryproject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [libraryproject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [libraryproject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [libraryproject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [libraryproject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [libraryproject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [libraryproject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [libraryproject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [libraryproject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [libraryproject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [libraryproject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [libraryproject] SET  MULTI_USER 
GO
ALTER DATABASE [libraryproject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [libraryproject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [libraryproject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [libraryproject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [libraryproject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [libraryproject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [libraryproject] SET QUERY_STORE = OFF
GO
USE [libraryproject]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 03-02-2023 01:30:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Book_ID] [int] IDENTITY(1,1) NOT NULL,
	[Book_Name] [varchar](50) NULL,
	[Book_Author] [varchar](50) NULL,
	[Date_Added] [datetime] NULL,
	[Available_Books] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrow]    Script Date: 03-02-2023 01:30:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Book_Name] [varchar](50) NULL,
	[Book_ID] [int] NULL,
	[Customer_ID] [int] NULL,
	[Borrow_Date] [datetime] NULL,
	[Return_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 03-02-2023 01:30:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Name] [varchar](50) NULL,
	[Gender] [char](1) NULL,
	[Email] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Admin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (6, N'Ramayan', N'Balmiki Das', CAST(N'2023-05-21T00:02:00.000' AS DateTime), 4)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (8, N'Mahabharat', N'Kalidas', CAST(N'2023-03-21T00:00:00.000' AS DateTime), 8)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (9, N'Harry Potter', N'J. K. Rowling', CAST(N'2023-02-13T00:00:00.000' AS DateTime), 10)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (10, N'The London Adventure', N'Ruskin Bond', CAST(N'2023-02-24T00:00:00.000' AS DateTime), 13)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (11, N'Indo-PAK War 1971', N'Rajnath Singh', CAST(N'2023-01-19T00:00:00.000' AS DateTime), 13)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (12, N'War and Peace', N'Leo Tolstoy', CAST(N'2022-07-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (13, N'Crime and Punishment', N'Fyodor Dostoyevsky', CAST(N'2021-12-13T00:00:00.000' AS DateTime), 24)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (14, N' Alice''s Adventures in Wonderland', N'Lewis Carroll', CAST(N'2022-04-22T00:00:00.000' AS DateTime), 16)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (15, N'The Discovery Of India', N'Jawaharlal Nehru', CAST(N'2023-04-01T00:00:00.000' AS DateTime), 98)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (16, N'Kanaiha', N'Krishna', CAST(N'2023-05-13T00:00:00.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Borrow] ON 
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (17, NULL, 11, 6, CAST(N'2023-01-28T00:00:00.000' AS DateTime), CAST(N'2023-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (18, NULL, 8, 9, CAST(N'2000-04-12T00:00:00.000' AS DateTime), CAST(N'2000-05-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (19, NULL, 12, 16, CAST(N'2023-01-28T00:00:00.000' AS DateTime), CAST(N'2023-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (20, NULL, 14, 6, CAST(N'2023-01-28T00:00:00.000' AS DateTime), CAST(N'2023-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (21, NULL, 15, 12, CAST(N'2023-01-28T00:00:00.000' AS DateTime), CAST(N'2023-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (22, N'Ramayan', 6, 6, CAST(N'2023-01-31T11:56:19.063' AS DateTime), CAST(N'2023-02-07T11:56:28.780' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (23, N' Alice''s Adventures in Wonderland', 14, 6, CAST(N'2023-01-31T12:47:24.707' AS DateTime), CAST(N'2023-02-07T12:47:24.707' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (24, N'The London Adventure', 10, 8, CAST(N'2023-01-31T12:52:46.840' AS DateTime), CAST(N'2023-02-07T12:52:46.840' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (25, N'The London Adventure', 10, 8, CAST(N'2023-01-31T12:53:31.343' AS DateTime), CAST(N'2023-02-07T12:53:31.343' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (26, N'The Discovery Of India', 15, 8, CAST(N'2023-01-31T12:53:49.897' AS DateTime), CAST(N'2023-02-07T12:53:49.897' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (27, NULL, 12, 10, CAST(N'2023-01-28T00:00:00.000' AS DateTime), CAST(N'2023-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (28, N'The Discovery Of India', 15, 6, CAST(N'2023-01-31T14:31:25.187' AS DateTime), CAST(N'2023-02-07T14:31:25.187' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (29, NULL, 9, 16, CAST(N'2023-01-28T00:00:00.000' AS DateTime), CAST(N'2000-05-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (30, N' Alice''s Adventures in Wonderland', 14, 8, CAST(N'2023-01-31T14:51:42.637' AS DateTime), CAST(N'2023-02-07T14:51:42.637' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (31, N'Crime and Punishment', 13, 12, CAST(N'2023-01-31T15:24:20.037' AS DateTime), CAST(N'2023-02-07T15:24:20.037' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (32, N' Alice''s Adventures in Wonderland', 14, 6, CAST(N'2023-01-31T15:29:22.737' AS DateTime), CAST(N'2023-02-07T15:29:22.737' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (33, N'Kanaiha', 16, 6, CAST(N'2023-02-03T12:20:25.940' AS DateTime), CAST(N'2023-02-10T12:20:25.943' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Borrow] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (6, N'Ratul', N'M', N'backet@yahoo.com', N'Byomkesh', 1)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (7, N'Sam Mohan', N'F', N'sam@gmail.com', N'sam', 0)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (8, N'Chiku Nisan', N'M', N'Chiku@gmail.com', N'chiku', NULL)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (9, N'Amit Sekhar', N'F', N'amit@gmail.com', N'amit', NULL)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (10, N'Shila Shamra', N'F', N'shila@gmail.com', N'shila', 0)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (12, N'Nipun Bajpayi', N'M', N'nipun@gmail.com', N'nipun', 0)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (15, N'Sekhar Murmu', N'F', N'nipun34@gmail.com', N'nipun2', 1)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (16, N'Neha Banerjee', N'F', N'nehadhupia@gmail.com', N'neha12', 0)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (17, N'Riya Das', N'F', N'riya@yahoo.com', N'riya99', 0)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (18, N'Sagar Hagra', N'M', N'sagar@gmail.com', N'Sagar', 1)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (19, N'Nihar Ranjana', N'F', N'nihar@mail.com', N'niharr', NULL)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (20, N'Jaisankar', N'F', N'jai@gmail.com', N'jai', NULL)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (21, N'Swarup Mukherjee', N'M', N'swarup@yahoo.com', N'Swarup', NULL)
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Gender], [Email], [UserName], [Admin]) VALUES (22, N'Niram Singha', N'F', N'niram@gmail.com', N'niram', NULL)
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
USE [master]
GO
ALTER DATABASE [libraryproject] SET  READ_WRITE 
GO
