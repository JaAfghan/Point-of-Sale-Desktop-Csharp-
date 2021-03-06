USE [master]
GO
/****** Object:  Database [pos]    Script Date: 7/6/2019 2:25:11 AM ******/
CREATE DATABASE [pos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pos', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\pos.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'pos_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\pos_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [pos] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pos] SET ARITHABORT OFF 
GO
ALTER DATABASE [pos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pos] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [pos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pos] SET RECOVERY FULL 
GO
ALTER DATABASE [pos] SET  MULTI_USER 
GO
ALTER DATABASE [pos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [pos]
GO
/****** Object:  Table [dbo].[tbl_catagories]    Script Date: 7/6/2019 2:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_catagories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[catagory] [nvarchar](50) NULL,
	[supplier] [nvarchar](50) NULL,
	[added_by] [nvarchar](50) NULL,
	[added_date] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_invoice]    Script Date: 7/6/2019 2:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_invoice](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[customer_name] [nvarchar](50) NULL,
	[total_payable] [nvarchar](50) NULL,
	[paid_amount] [nvarchar](50) NULL,
	[discount] [nvarchar](50) NULL,
	[due_amount] [nvarchar](50) NULL,
	[change_amount] [nvarchar](50) NULL,
	[sales_date] [datetime] NULL,
	[added_by] [nvarchar](50) NULL,
	[inv_no] [int] NULL,
 CONSTRAINT [PK_tbl_invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_productdetails]    Script Date: 7/6/2019 2:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_productdetails](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[product_id] [int] NULL,
	[inv_no] [int] NULL,
	[product_name] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[quantity] [nvarchar](50) NULL,
	[discount] [nvarchar](50) NULL,
	[total] [nvarchar](50) NULL,
	[purchase_price] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[added_by] [nvarchar](50) NULL,
	[added_date] [datetime] NULL,
	[code] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_stock]    Script Date: 7/6/2019 2:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_stock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[colour_code] [nvarchar](50) NULL,
	[supplier] [nvarchar](50) NULL,
	[catagory] [nvarchar](50) NULL,
	[purchase_price] [nvarchar](50) NULL,
	[retail_price] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[quantity] [nvarchar](50) NULL,
	[added_by] [nvarchar](50) NULL,
	[added_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_stock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_suppliers]    Script Date: 7/6/2019 2:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_suppliers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[company] [nvarchar](50) NULL,
	[adress] [nvarchar](50) NULL,
	[phone_no] [nvarchar](50) NULL,
	[added_by] [nvarchar](50) NULL,
	[added_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_suppliers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_users]    Script Date: 7/6/2019 2:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_users](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[user_type] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[cnic] [nvarchar](50) NULL,
	[adress] [nvarchar](50) NULL,
	[phone_no] [nvarchar](50) NULL,
	[added_by] [nvarchar](50) NULL,
	[added_date] [datetime] NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [pos] SET  READ_WRITE 
GO
