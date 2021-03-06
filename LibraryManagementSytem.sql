USE [master]
GO
/****** Object:  Database [LibraryManagementDb]    Script Date: 5/11/2020 6:05:11 pm ******/
CREATE DATABASE [LibraryManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagementDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LibraryManagementDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryManagementDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LibraryManagementDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LibraryManagementDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagementDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [LibraryManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryManagementDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryManagementDb] SET QUERY_STORE = OFF
GO
USE [LibraryManagementDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/11/2020 6:05:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 5/11/2020 6:05:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[PublisherId] [int] NOT NULL,
	[Author] [nvarchar](max) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IssueBooks]    Script Date: 5/11/2020 6:05:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueBooks](
	[IssueId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[IssueDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_IssueBooks] PRIMARY KEY CLUSTERED 
(
	[IssueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 5/11/2020 6:05:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherId] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/11/2020 6:05:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[RollNo] [nvarchar](max) NOT NULL,
	[Class] [nvarchar](max) NOT NULL,
	[DOB] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_PublisherId]    Script Date: 5/11/2020 6:05:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_Books_PublisherId] ON [dbo].[Books]
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IssueBooks_BookId]    Script Date: 5/11/2020 6:05:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_IssueBooks_BookId] ON [dbo].[IssueBooks]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IssueBooks_StudentId]    Script Date: 5/11/2020 6:05:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_IssueBooks_StudentId] ON [dbo].[IssueBooks]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishers_PublisherId] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([PublisherId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishers_PublisherId]
GO
ALTER TABLE [dbo].[IssueBooks]  WITH CHECK ADD  CONSTRAINT [FK_IssueBooks_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IssueBooks] CHECK CONSTRAINT [FK_IssueBooks_Books_BookId]
GO
ALTER TABLE [dbo].[IssueBooks]  WITH CHECK ADD  CONSTRAINT [FK_IssueBooks_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IssueBooks] CHECK CONSTRAINT [FK_IssueBooks_Students_StudentId]
GO
USE [master]
GO
ALTER DATABASE [LibraryManagementDb] SET  READ_WRITE 
GO
