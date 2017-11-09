USE [master]
GO
/****** Object:  Database [PermissionsDB]    Script Date: 2017/11/9 10:32:43 ******/
CREATE DATABASE [PermissionsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PermissionsDB', FILENAME = N'D:\Data\PermissionsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PermissionsDB_log', FILENAME = N'D:\Data\PermissionsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PermissionsDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PermissionsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PermissionsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PermissionsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PermissionsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PermissionsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PermissionsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PermissionsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PermissionsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PermissionsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PermissionsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PermissionsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PermissionsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PermissionsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PermissionsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PermissionsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PermissionsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PermissionsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PermissionsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PermissionsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PermissionsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PermissionsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PermissionsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PermissionsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PermissionsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PermissionsDB] SET  MULTI_USER 
GO
ALTER DATABASE [PermissionsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PermissionsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PermissionsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PermissionsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PermissionsDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PermissionsDB', N'ON'
GO
ALTER DATABASE [PermissionsDB] SET QUERY_STORE = OFF
GO
USE [PermissionsDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PermissionsDB]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 2017/11/9 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [varchar](100) NULL,
	[Action] [varchar](300) NULL,
	[Method] [varchar](10) NULL,
	[PID] [int] NULL,
	[Memo] [text] NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 2017/11/9 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RoleID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2017/11/9 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 2017/11/9 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2017/11/9 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([ID], [PermissionName], [Action], [Method], [PID], [Memo]) VALUES (1, N'首页', N'/', N'get', NULL, NULL)
INSERT [dbo].[Permissions] ([ID], [PermissionName], [Action], [Method], [PID], [Memo]) VALUES (2, N'登录', N'/login', N'get', NULL, NULL)
INSERT [dbo].[Permissions] ([ID], [PermissionName], [Action], [Method], [PID], [Memo]) VALUES (3, N'登录', N'/login', N'post', NULL, NULL)
INSERT [dbo].[Permissions] ([ID], [PermissionName], [Action], [Method], [PID], [Memo]) VALUES (4, N'联系方式', N'/home/contact', N'get', NULL, NULL)
INSERT [dbo].[Permissions] ([ID], [PermissionName], [Action], [Method], [PID], [Memo]) VALUES (5, N'关于', N'/home/about', N'get', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Permissions] OFF
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 1)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 2)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 3)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 5)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (2, 1)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (2, 4)
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[Roles] ([ID], [RoleName]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[UserRoles] ([UserID], [RoleID]) VALUES (1, 1)
INSERT [dbo].[UserRoles] ([UserID], [RoleID]) VALUES (2, 2)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Name], [UserName], [Password]) VALUES (1, N'张三丰', N'zsf', N'zsf')
INSERT [dbo].[Users] ([ID], [Name], [UserName], [Password]) VALUES (2, N'李四收', N'lss', N'lss')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Users]    Script Date: 2017/11/9 10:32:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([ID])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Permissions]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
USE [master]
GO
ALTER DATABASE [PermissionsDB] SET  READ_WRITE 
GO
