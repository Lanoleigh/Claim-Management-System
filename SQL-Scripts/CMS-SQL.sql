USE [master]
GO
/****** Object:  Database [CMS]    Script Date: 2025/01/28 10:54:36 ******/
CREATE DATABASE [CMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\CMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\CMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CMS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CMS] SET  MULTI_USER 
GO
ALTER DATABASE [CMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CMS] SET QUERY_STORE = ON
GO
ALTER DATABASE [CMS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CMS]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2025/01/28 10:54:36 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2025/01/28 10:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2025/01/28 10:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2025/01/28 10:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2025/01/28 10:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2025/01/28 10:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2025/01/28 10:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[EmailAddress] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2025/01/28 10:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claims]    Script Date: 2025/01/28 10:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[claim_ID] [varchar](8) NOT NULL,
	[fk_lecturer_id] [nvarchar](450) NOT NULL,
	[fk_staff_id] [nvarchar](450) NOT NULL,
	[claim_amount] [float] NULL,
	[hours_Worked] [float] NULL,
	[dateOfClaim] [date] NULL,
	[description] [varchar](50) NULL,
	[status] [varchar](10) NULL,
	[FilePath] [varchar](90) NULL,
PRIMARY KEY CLUSTERED 
(
	[claim_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturers]    Script Date: 2025/01/28 10:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturers](
	[Id] [nvarchar](450) NOT NULL,
	[Lecturer_ID] [nvarchar](max) NOT NULL,
	[lecturer_name] [nvarchar](max) NOT NULL,
	[lecturer_surname] [nvarchar](max) NOT NULL,
	[phone_number_custom] [nvarchar](max) NOT NULL,
	[Hourly_Rate] [float] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Lecturers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2025/01/28 10:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [nvarchar](450) NOT NULL,
	[Staff_ID] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[phone_number] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241009132434_CustomIdentity', N'8.0.8')
GO
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'04242752-BF00-4468-BDDB-FC99156F8188', N'alice.j@univ.edu', N'P@ssw0rd1', N'alice.j', N'ALICE.J', N'alice.j@univ.edu', N'ALICE.J@UNIV.EDU', 1, N'AQAAAAIAAYagAAAAELBrsjHjuGkDddSgjCcKfPIB0mcdJOnemS5BrilpncIH8SFrZmWNMkw4/Ikqbugo8Q==', N'E6F0EE20-D4DF-4ABE-88D5-2D2D6ABE7731', N'd0667038-b04e-4d39-a5e4-be144620dac3', N'1234567890', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'09E16E73-27DE-4910-8098-3162D4C6284E', N'michael.brown@example.com', N'Qwerty123', N'michael.brown', N'MICHAEL.BROWN', N'michael.brown@example.com', N'MICHAEL.BROWN@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAENA5AkHC0VowQFK7B1Ulm/Hzr8rtgXT9ftM9ApfW7m4rdFLW9oU3vP0vXPDn0mmzSg==', N'C43FAAE5-A76E-4847-8015-1061714CD545', N'ae4b8979-f2c6-48a2-ade4-7d0f2f42dbc3', N'6677889900', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1E0D26D4-0872-4178-A99D-945BDF636CE6', N'emily.johnson@example.com', N'Pass1234!', N'emily.johnson', N'EMILY.JOHNSON', N'emily.johnson@example.com', N'EMILY.JOHNSON@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAEM4hfMK/mrQLCV6+uPsNaNg90XXwCNrNPIzAUY1UuTr/0DeZsyt3B/R/FenDrjDShw==', N'601FCE29-506A-47BE-A6D8-324027D7CD16', N'0051d032-d60c-46e3-b5e3-404d67ef5b20', N'1122334455', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'311F30DD-66E0-431B-A599-C335B3C19643', N'james.taylor@example.com', N'Str0ngPass', N'james.taylor', N'JAMES.TAYLOR', N'james.taylor@example.com', N'JAMES.TAYLOR@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAEGCvjbD8RJR6A+VeOPoHNjtJKKbRHSBT6Eg8f+FNqqUSS88MA7u9vkKsvRBI7aBjpw==', N'FE1E42F3-9AF7-4DAE-9D07-2EF7310F35AA', N'5800ad5b-1b99-4c4d-b4bd-93786ea9cb99', N'7788990011', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'36717B42-3AA5-4DF9-82C1-F97F942A3FAD', N'jane.smith@example.com', N'Secur3Pwd2', N'jane.smith', N'JANE.SMITH', N'jane.smith@example.com', N'JANE.SMITH@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAENwr/MJ2UPA8BDDl9bxv9DshR/Ie+0IQAVPfe+z51kcFHQHp/BRBXh62ouVK3tQJ8w==', N'352E97D1-64A7-4C62-8BEB-F4A990E2056E', N'4ff9eeaf-e0fa-4bc3-a3f2-0b4424758a55', N'0987654321', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4FC8FC46-83C4-4FDD-99FB-BF2C74088993', N'bob.smith@uni.edu', N'Secur3Pwd2', N'bob.smith', N'BOB.SMITH', N'bob.smith@uni.edu', N'BOB.SMITH@UNI.EDU', 1, N'AQAAAAIAAYagAAAAEEDBOHcAqruft+UJnKJijinKM5X9TyFwI2f/mPNXaz8JbJZkRyV+vERn5DZZTlnkKw==', N'186C0AE2-9EC1-4F4E-B8BC-0A7CC5931586', N'27fa205b-bc99-4539-b0b8-d25d67dea211', N'0987654321', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6F0D573A-CCED-40B3-BC32-B12BFF80ECAF', N'sarah.davis@example.com', N'LetMeIn56', N'sarah.davis', N'SARAH.DAVIS', N'sarah.davis@example.com', N'SARAH.DAVIS@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAECMuSXRE9jF8A2wJsConYg7LRwBWB6sBWZnt+j2QcCFexsqYXsdOoO4PxyZiFL+kHg==', N'65A9D43D-B44F-4544-90AD-992A6DBB2AD0', N'fd3cb947-df64-4b5d-aea7-fce59fef5c62', N'4433221100', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9B9F36F1-3950-4A31-988A-04E4C790D546', N'david.miller@example.com', N'Passw0rd!', N'david.miller', N'DAVID.MILLER', N'david.miller@example.com', N'DAVID.MILLER@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAEOChjWnMnJSGRAAD08wq/l0ed3zom2xzNDilGI3jNmDUJHJy2jPZaRiEEfe14Gs+8g==', N'B7DD98B3-C095-4034-86F9-F8B81CD3125F', N'f99e2e40-20b1-4c88-856c-7649f597f78d', N'2233445566', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9F689CFD-8B26-4F5D-900F-415C67295114', N'laura.wilson@example.com', N'Welc0me98', N'laura.wilson', N'LAURA.WILSON', N'laura.wilson@example.com', N'LAURA.WILSON@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAELbFNKQbYIMN0tDDbvUMiLg1ZS9z9h/m5sv+N8rHoAtL6/EN1yA0vOeGe7K5vrxQhg==', N'14D5702D-F6F6-4C7B-B41B-DE168A4ED2D1', N'0ffdfcb1-cd37-407d-8fb5-6d455351d7de', N'3344556677', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'CCFBE781-7233-4990-A358-987385AF4CB8', N'carol.t@univ.edu', N'Pass1234!', N'carol.t', N'CAROL.T', N'carol.t@univ.edu', N'CAROL.T@UNIV.EDU', 1, N'AQAAAAIAAYagAAAAEBs6SS1dOLa+dZS1IczZkRcOAG9FQhXR5tudvCSU3ntK5ALvQuJL5oxTsWoWr/6R/A==', N'4557132D-235F-4AEB-898D-117E447762B9', N'0e86b6a3-db31-4e4b-8599-303215fb9b63', N'1122334455', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'CEDF66CA-6882-4F95-AAD7-72AF620C256F', N'john.doe@example.com', N'P@ssw0rd1', N'john.doe', N'JOHN.DOE', N'john.doe@example.com', N'JOHN.DOE@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAEAxCJL25BRsCdGrfPmpbTj4VE4Prmdg6dSb20arqq4PsxegkcuEMJCfRTJOLyjA3qw==', N'427E955D-E885-4E44-A42D-22859E71107E', N'344568bc-923a-44d4-a9fa-cfdee1daddf2', N'1234567890', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'E05B3383-AEBD-4547-88D3-5758ABB4A06C', N'admin01@example.com', N'P@ssw0rd1', N'Admin', N'ADMIN', N'admin01@example.com', N'ADMIN01@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAEFYpJvN9/A1WAAOqCRxTc55qkXN/wIoZiWc81lDOiJ7xYZuWaxuuVWzwlah3OKQnRQ==', N'866A8C51-C1DB-47FC-9ECE-5350E51E3211', N'16abf91f-6ccf-4635-8b83-d0030f8da625', N'1234567890', 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [EmailAddress], [Password], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'F1AE1F6F-B525-4BDA-8BCF-0CA5AF808B8E', N'david.b@univ.edu', N'Qwerty123', N'david.brown', N'DAVID.BROWN', N'david.b@univ.edu', N'DAVID.B@UNIV.EDU', 1, N'AQAAAAIAAYagAAAAEIBwOJegEkyOh+7/IRntCoajO0iFXLM1rsknjkdkw2+POBxg/RPXOVFczinp/8VTpg==', N'94915EF0-820E-482C-A639-8B6D014F2FFB', N'0c0d8793-33d8-40ab-985f-b74c0784aa8c', N'6677889900', 0, 0, NULL, 0, 0)
GO
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000001', N'1', N'3', 162060, 120, CAST(N'2024-02-15' AS Date), N'Good working environment.', N'Processing', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000002', N'1', N'2', 135050, 100, CAST(N'2024-01-20' AS Date), N'Indifferent experience overall.', N'Pending', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000003', N'1', N'3', 189070, 140, CAST(N'2024-03-10' AS Date), N'Productive and collaborative.', N'Rejected', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000004', N'2', N'3', 159583, 110, CAST(N'2024-04-25' AS Date), N'Challenging but rewarding.', N'Processing', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000005', N'2', N'3', 130568, 90, CAST(N'2024-06-05' AS Date), N'Supportive team but some challenges.', N'Processing', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000006', N'2', N'3', 152329, 105, CAST(N'2024-02-28' AS Date), N'Indifferent experience overall.', N'Processing', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000007', N'2', N'2', 188598, 130, CAST(N'2024-07-15' AS Date), N'Collaborative environment.', N'Pending', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000008', N'3', N'3', 192000, 160, CAST(N'2024-03-22' AS Date), N'Good working environment.', N'Processing', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000009', N'3', N'1', 120000, 100, CAST(N'2024-05-12' AS Date), N'Challenging but rewarding.', N'Pending', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000010', N'3', N'3', 96000, 80, CAST(N'2024-01-10' AS Date), N'Supportive team.', N'Processing', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000011', N'4', N'1', 81023, 90, CAST(N'2024-06-20' AS Date), N'Good working environment.', N'Pending', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000012', N'4', N'1', 135038, 150, CAST(N'2024-04-05' AS Date), N'Productive and collaborative.', N'Pending', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000013', N'4', N'3', 126035, 140, CAST(N'2024-03-18' AS Date), N'Indifferent experience overall.', N'Approved', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000014', N'5', N'1', 180000, 120, CAST(N'2024-07-01' AS Date), N'Collaborative environment.', N'Pending', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C000015', N'5', N'2', 150000, 100, CAST(N'2024-02-07' AS Date), N'Challenging but rewarding.', N'Pending', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C0016', N'4', N'2', 50400, 56, CAST(N'2024-10-14' AS Date), N'hellooooooooooooo.', N'Pending', N'/FileUpload/ST10258321.docx')
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C0017', N'4', N'3', 88200, 98, CAST(N'2024-10-14' AS Date), N'This is another tester.', N'Approved', N'/FileUpload/PROG.drawio.png')
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C0018', N'4', N'3', 60300, 67, CAST(N'2024-10-16' AS Date), N'Testting', N'Approved', N'/FileUpload/PROG.drawio.png')
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C0019', N'4', N'1', 70200, 78, CAST(N'2024-10-16' AS Date), N'This is for the video.', N'Rejected', N'/FileUpload/PROG.drawio.png')
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C0020', N'4', N'3', 83700, 93, CAST(N'2024-10-16' AS Date), N'This is for the video.', N'Approved', N'/FileUpload/CMS-Queries.sql')
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C0021', N'4', N'2', 108900, 121, CAST(N'2024-10-17' AS Date), N'Bleach bankai', N'Pending', N'/FileUpload/PROG6212POE.pdf')
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C0022', N'4', N'2', 80100, 89, CAST(N'2024-10-17' AS Date), N'This is for the word document.', N'Pending', N'/FileUpload/PROG6212POE.pdf')
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C0023', N'4', N'3', 83700, 93, CAST(N'2024-10-18' AS Date), N'This is for the video.', N'Rejected', N'/FileUpload/PROG6212POE.pdf')
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C0024', N'1', N'3', 162000, 120, CAST(N'2024-11-19' AS Date), N'This is for the presentation.', N'Approved', NULL)
INSERT [dbo].[Claims] ([claim_ID], [fk_lecturer_id], [fk_staff_id], [claim_amount], [hours_Worked], [dateOfClaim], [description], [status], [FilePath]) VALUES (N'C0025', N'5', N'3', 75000, 50, CAST(N'2025-01-13' AS Date), N'Student intake ', N'Approved', NULL)
GO
INSERT [dbo].[Lecturers] ([Id], [Lecturer_ID], [lecturer_name], [lecturer_surname], [phone_number_custom], [Hourly_Rate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1', N'L001', N'John', N'Doe', N'0000000096', 1350.5, N'john.doe', N'JOHN.DOE', N'john.doe@example.com', N'JOHN.DOE@EXAMPLE.COM', 1, N'PasswordHash1', N'SecurityStamp1', N'ConcurrencyStamp1', 1, 0, NULL, 1, 0)
INSERT [dbo].[Lecturers] ([Id], [Lecturer_ID], [lecturer_name], [lecturer_surname], [phone_number_custom], [Hourly_Rate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2', N'L002', N'Jane', N'Smith', N'0987654321', 1450.75, N'jane.smith', N'JANE.SMITH', N'jane.smith@example.com', N'JANE.SMITH@EXAMPLE.COM', 1, N'PasswordHash2', N'SecurityStamp2', N'ConcurrencyStamp2', 1, 0, NULL, 1, 0)
INSERT [dbo].[Lecturers] ([Id], [Lecturer_ID], [lecturer_name], [lecturer_surname], [phone_number_custom], [Hourly_Rate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3', N'L003', N'Emily', N'JohnsonS', N'1122334455', 1200, N'emily.johnson', N'EMILY.JOHNSON', N'emily.johnson@example.com', N'EMILY.JOHNSON@EXAMPLE.COM', 1, N'PasswordHash3', N'SecurityStamp3', N'ConcurrencyStamp3', 1, 0, NULL, 1, 0)
INSERT [dbo].[Lecturers] ([Id], [Lecturer_ID], [lecturer_name], [lecturer_surname], [phone_number_custom], [Hourly_Rate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4', N'L004', N'Michael', N'Brown', N'6677889900', 900.25, N'michael.brown', N'MICHAEL.BROWN', N'michael.brown@example.com', N'MICHAEL.BROWN@EXAMPLE.COM', 1, N'PasswordHash4', N'SecurityStamp4', N'ConcurrencyStamp4', 1, 0, NULL, 1, 0)
INSERT [dbo].[Lecturers] ([Id], [Lecturer_ID], [lecturer_name], [lecturer_surname], [phone_number_custom], [Hourly_Rate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5', N'L005', N'Sarah', N'Davis', N'4433221100', 1500, N'sarah.davis', N'SARAH.DAVIS', N'sarah.davis@example.com', N'SARAH.DAVIS@EXAMPLE.COM', 1, N'PasswordHash5', N'SecurityStamp5', N'ConcurrencyStamp5', 1, 0, NULL, 1, 0)
INSERT [dbo].[Lecturers] ([Id], [Lecturer_ID], [lecturer_name], [lecturer_surname], [phone_number_custom], [Hourly_Rate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6', N'L006', N'David', N'Miller', N'2233445566', 1300.5, N'david.miller', N'DAVID.MILLER', N'david.miller@example.com', N'DAVID.MILLER@EXAMPLE.COM', 1, N'PasswordHash6', N'SecurityStamp6', N'ConcurrencyStamp6', 1, 0, NULL, 1, 0)
INSERT [dbo].[Lecturers] ([Id], [Lecturer_ID], [lecturer_name], [lecturer_surname], [phone_number_custom], [Hourly_Rate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7', N'L007', N'Laura', N'Wilson', N'3344556677', 1100.75, N'laura.wilson', N'LAURA.WILSON', N'laura.wilson@example.com', N'LAURA.WILSON@EXAMPLE.COM', 1, N'PasswordHash7', N'SecurityStamp7', N'ConcurrencyStamp7', 1, 0, NULL, 1, 0)
INSERT [dbo].[Lecturers] ([Id], [Lecturer_ID], [lecturer_name], [lecturer_surname], [phone_number_custom], [Hourly_Rate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8', N'L008', N'James', N'Taylor', N'7788990011', 1425, N'james.taylor', N'JAMES.TAYLOR', N'james.taylor@example.com', N'JAMES.TAYLOR@EXAMPLE.COM', 1, N'PasswordHash8', N'SecurityStamp8', N'ConcurrencyStamp8', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[Staff] ([Id], [Staff_ID], [Name], [Surname], [title], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [phone_number], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1', N'PC123', N'Alice', N'Johnson', N'Programme Coordinator', N'alice.j', N'ALICE.J', N'alice.j@univ.edu', N'ALICE.J@UNIV.EDU', 1, N'PasswordHash9', N'SecurityStamp9', N'ConcurrencyStamp9', N'1234567890', 1, 0, NULL, 1, 0)
INSERT [dbo].[Staff] ([Id], [Staff_ID], [Name], [Surname], [title], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [phone_number], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2', N'PC456', N'Bob', N'Smith', N'Programme Coordinator', N'bob.smith', N'BOB.SMITH', N'bob.smith@uni.edu', N'BOB.SMITH@UNI.EDU', 1, N'PasswordHash10', N'SecurityStamp10', N'ConcurrencyStamp10', N'0987654321', 1, 0, NULL, 1, 0)
INSERT [dbo].[Staff] ([Id], [Staff_ID], [Name], [Surname], [title], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [phone_number], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3', N'AM789', N'Carol', N'Taylor', N'Academic Manager', N'carol.t', N'CAROL.T', N'carol.t@univ.edu', N'CAROL.T@UNIV.EDU', 1, N'PasswordHash11', N'SecurityStamp11', N'ConcurrencyStamp11', N'1122334455', 1, 0, NULL, 1, 0)
INSERT [dbo].[Staff] ([Id], [Staff_ID], [Name], [Surname], [title], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [phone_number], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4', N'ADMIN001', N'Admin', N'User', N'Administrator', N'Admin', N'ADMIN', N'admin01@example.com', N'ADMIN01@EXAMPLE.COM', 1, N'AQAAAAEAACcQAAAAEGURoHXUN7oZrmH1Ro8yoR6SwQAA3tRBXgOUMgRuJHGZOMHR5Q==', N'BECD4D4F-8224-4AF4-95EB-1E14B0850220', N'6350264A-C9FB-46CA-8841-51C307224811', N'1234567890', 1, 0, NULL, 1, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2025/01/28 10:54:36 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2025/01/28 10:54:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2025/01/28 10:54:36 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2025/01/28 10:54:36 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2025/01/28 10:54:36 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2025/01/28 10:54:36 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2025/01/28 10:54:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD FOREIGN KEY([fk_lecturer_id])
REFERENCES [dbo].[Lecturers] ([Id])
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD FOREIGN KEY([fk_staff_id])
REFERENCES [dbo].[Staff] ([Id])
GO
USE [master]
GO
ALTER DATABASE [CMS] SET  READ_WRITE 
GO
