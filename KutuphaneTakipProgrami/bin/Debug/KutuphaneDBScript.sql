USE [master]
GO
/****** Object:  Database [KutuphaneDB]    Script Date: 14.05.2013 21:56:30 ******/
CREATE DATABASE [KutuphaneDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KutuphaneDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KutuphaneDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KutuphaneDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KutuphaneDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KutuphaneDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KutuphaneDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KutuphaneDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KutuphaneDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KutuphaneDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KutuphaneDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KutuphaneDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KutuphaneDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KutuphaneDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [KutuphaneDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KutuphaneDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KutuphaneDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KutuphaneDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KutuphaneDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KutuphaneDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KutuphaneDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KutuphaneDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KutuphaneDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KutuphaneDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KutuphaneDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KutuphaneDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KutuphaneDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KutuphaneDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KutuphaneDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KutuphaneDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KutuphaneDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KutuphaneDB] SET  MULTI_USER 
GO
ALTER DATABASE [KutuphaneDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KutuphaneDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KutuphaneDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KutuphaneDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [KutuphaneDB]
GO
/****** Object:  Table [dbo].[TbEmanet]    Script Date: 14.05.2013 21:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbEmanet](
	[TcKimlikNo] [char](11) NOT NULL,
	[KitapAdi] [nvarchar](50) NOT NULL,
	[YazarAdi] [nvarchar](50) NOT NULL,
	[VerilisTarihi] [date] NOT NULL,
	[BitisTarihi] [date] NULL,
	[TeslimTarihi] [date] NULL,
	[HasarDurumu] [nvarchar](50) NULL,
 CONSTRAINT [PK_TbEmanet] PRIMARY KEY CLUSTERED 
(
	[TcKimlikNo] ASC,
	[KitapAdi] ASC,
	[YazarAdi] ASC,
	[VerilisTarihi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbKitaplar]    Script Date: 14.05.2013 21:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbKitaplar](
	[KitapAdi] [nvarchar](50) NOT NULL,
	[YazarAdi] [nvarchar](50) NOT NULL,
	[KitapTuru] [nvarchar](50) NULL,
	[YayinEvi] [nvarchar](50) NULL,
	[BarkodNo] [nvarchar](50) NULL,
	[TeminTarihi] [nvarchar](50) NULL,
	[TeminBicimi] [nvarchar](50) NULL,
	[StokSayisi] [bigint] NULL,
 CONSTRAINT [PK_TbKitaplar] PRIMARY KEY CLUSTERED 
(
	[KitapAdi] ASC,
	[YazarAdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TbKullanici]    Script Date: 14.05.2013 21:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbKullanici](
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TbOkunanKitaplar]    Script Date: 14.05.2013 21:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbOkunanKitaplar](
	[TcKimlikNo] [nchar](11) NOT NULL,
	[KitapAdi] [nvarchar](50) NOT NULL,
	[YazarAdi] [nvarchar](50) NOT NULL,
	[VerilisTarihi] [date] NOT NULL,
	[BitisTarihi] [date] NULL,
	[TeslimTarihi] [date] NULL,
	[HasarDurumu] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TbUyeler]    Script Date: 14.05.2013 21:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbUyeler](
	[TcKimlikNo] [char](11) NOT NULL,
	[AdiSoyadi] [nvarchar](50) NULL,
	[DogumTarihi] [nvarchar](50) NULL,
	[DogumYeri] [nvarchar](50) NULL,
	[Cinsiyet] [nvarchar](50) NULL,
	[UyelikTarihi] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Eposta] [nvarchar](50) NULL,
	[Adres] [nvarchar](max) NULL,
 CONSTRAINT [PK_TbUyeler] PRIMARY KEY CLUSTERED 
(
	[TcKimlikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TbKitaplar] ([KitapAdi], [YazarAdi], [KitapTuru], [YayinEvi], [BarkodNo], [TeminTarihi], [TeminBicimi], [StokSayisi]) VALUES (N'HER YÖNÜYLE C# 5.0', N'VOLKAN AKTAŞ', N'AKADEMİK', N'KODLAB', N'97860552011111', N'09.05.2013', N'HEDİYE', 4)
INSERT [dbo].[TbKitaplar] ([KitapAdi], [YazarAdi], [KitapTuru], [YayinEvi], [BarkodNo], [TeminTarihi], [TeminBicimi], [StokSayisi]) VALUES (N'İSKENDER', N'ELİF ŞAFAK', N'EDEBİYAT', N'DOĞAN KİTAP', N'5542245622', N'09.05.2013', N'HEDİYE', 1)
INSERT [dbo].[TbKitaplar] ([KitapAdi], [YazarAdi], [KitapTuru], [YayinEvi], [BarkodNo], [TeminTarihi], [TeminBicimi], [StokSayisi]) VALUES (N'KIRILGAN NESNELERT6E', N'JACQUES BADOZRE', N'GDEFGFD', N'TUBİTAK', N'9789754031416', N'09.05.2013', N'HEDİYE', 2)
INSERT [dbo].[TbKitaplar] ([KitapAdi], [YazarAdi], [KitapTuru], [YayinEvi], [BarkodNo], [TeminTarihi], [TeminBicimi], [StokSayisi]) VALUES (N'METAL FIRTINA', N'BURAK TURNA', N'EDEBİYAT', N'TİMAŞ', N'97997526310099', N'09.05.2013', N'SATIN ALMA', 1)
INSERT [dbo].[TbKitaplar] ([KitapAdi], [YazarAdi], [KitapTuru], [YayinEvi], [BarkodNo], [TeminTarihi], [TeminBicimi], [StokSayisi]) VALUES (N'SAVAŞÇI', N'DOĞAN CÜCELOĞLU', N'EDEBİYAT', N'REMZİ KİTABEVİ', N'9789751408259', N'09.05.2013', N'HEDİYE', 1)
INSERT [dbo].[TbKitaplar] ([KitapAdi], [YazarAdi], [KitapTuru], [YayinEvi], [BarkodNo], [TeminTarihi], [TeminBicimi], [StokSayisi]) VALUES (N'VERİ TABANI SİSTEMLERİ', N'YALÇIN ÖZKAN', N'AKADEMİK', N'ALFA', N'9786051060989', N'09.05.2013', N'SATIN ALMA', 1)
INSERT [dbo].[TbKullanici] ([KullaniciAdi], [Sifre]) VALUES (N'admin', N'1')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'31456235556', N'GELECEĞİN HARİTASI', N'DENİZ ÜLKE ARIBOĞAN', CAST(0x0F370B00 AS Date), CAST(0x16370B00 AS Date), CAST(0x0F370B00 AS Date), N'Hasarlı Getirdi')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'31637472327', N'HER YÖNÜYLE C# 5.0', N'VOLKAN AKTAŞ', CAST(0x0F370B00 AS Date), CAST(0x1B370B00 AS Date), CAST(0x0F370B00 AS Date), N'Hasarlı Getirdi')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'78755454545', N'SAVAŞÇI', N'DOĞAN CÜCELOĞLU', CAST(0x0F370B00 AS Date), CAST(0x1A370B00 AS Date), CAST(0x10370B00 AS Date), N'')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'54875623254', N'METAL FIRTINA', N'BURAK TURNA', CAST(0x0F370B00 AS Date), CAST(0x14370B00 AS Date), CAST(0x10370B00 AS Date), N'Hasarlı Getirdi')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'78755454545', N'HER YÖNÜYLE C# 5.0', N'VOLKAN AKTAŞ', CAST(0x10370B00 AS Date), CAST(0x10370B00 AS Date), CAST(0x10370B00 AS Date), N'Hasarlı Getirdi')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'78755454545', N'VERİ TABANI SİSTEMLERİ', N'YALÇIN ÖZKAN', CAST(0x0F370B00 AS Date), CAST(0x14370B00 AS Date), CAST(0x10370B00 AS Date), N'Hasarlı Getirdi')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'31637472328', N'KIRILGAN NESNELER', N'JACQUES BADOZ', CAST(0x0F370B00 AS Date), CAST(0x1A370B00 AS Date), CAST(0x10370B00 AS Date), N'Hasarlı Getirdi')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'31637472329', N'HER YÖNÜYLE C# 5.0', N'VOLKAN AKTAŞ', CAST(0x10370B00 AS Date), CAST(0x10370B00 AS Date), CAST(0x10370B00 AS Date), N'')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'78755454545', N'SAVAŞÇI', N'DOĞAN CÜCELOĞLU', CAST(0x11370B00 AS Date), CAST(0x11370B00 AS Date), CAST(0x12370B00 AS Date), N'')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'78755454545', N'VERİ TABANI SİSTEMLERİ', N'YALÇIN ÖZKAN', CAST(0x11370B00 AS Date), CAST(0x11370B00 AS Date), CAST(0x13370B00 AS Date), N'')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'23131232222', N'DSsa', N'Ddsadsada', CAST(0x14370B00 AS Date), CAST(0x14370B00 AS Date), CAST(0x14370B00 AS Date), N'Hasarlı Getirdi')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'31637472329', N'HER YÖNÜYLE C# 5.0', N'VOLKAN AKTAŞ', CAST(0x11370B00 AS Date), CAST(0x11370B00 AS Date), CAST(0x14370B00 AS Date), N'')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'31637472329', N'HER YÖNÜYLE C# 5.0', N'VOLKAN AKTAŞ', CAST(0x14370B00 AS Date), CAST(0x1B370B00 AS Date), CAST(0x14370B00 AS Date), N'')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'54875623254', N'HER YÖNÜYLE C# 5.0', N'VOLKAN AKTAŞ', CAST(0x14370B00 AS Date), CAST(0x1B370B00 AS Date), CAST(0x15370B00 AS Date), N'')
INSERT [dbo].[TbOkunanKitaplar] ([TcKimlikNo], [KitapAdi], [YazarAdi], [VerilisTarihi], [BitisTarihi], [TeslimTarihi], [HasarDurumu]) VALUES (N'31637472329', N'GELECEĞİN HARİTASI', N'DENİZ ÜLKE ARIBOĞAN', CAST(0x14370B00 AS Date), CAST(0x1B370B00 AS Date), CAST(0x14370B00 AS Date), N'Hasarlı Getirdi')
INSERT [dbo].[TbUyeler] ([TcKimlikNo], [AdiSoyadi], [DogumTarihi], [DogumYeri], [Cinsiyet], [UyelikTarihi], [Telefon], [Eposta], [Adres]) VALUES (N'44654654654', N'MEHMET KIVANÇ', N'09.05.2013', N'AFYONKARAHİSAR', N'ERKEK', N'09.05.2013', N'032226584711', N'kivanc@mynet.com', N'100. Yıl  Mah 11548 Sokak No:7 Seyhan  ADANA')
INSERT [dbo].[TbUyeler] ([TcKimlikNo], [AdiSoyadi], [DogumTarihi], [DogumYeri], [Cinsiyet], [UyelikTarihi], [Telefon], [Eposta], [Adres]) VALUES (N'78755454545', N'HASAN ÖZER', N'04.05.2013', N'İZMİR', N'ERKEK', N'04.05.2013', N'50659845678', N'ozer@yandex.com', N'Yeşilyurt Mah. 71113 Sokak. No:6 Seyhan')
ALTER TABLE [dbo].[TbEmanet]  WITH CHECK ADD  CONSTRAINT [FK_TbEmanet_TbKitaplar] FOREIGN KEY([KitapAdi], [YazarAdi])
REFERENCES [dbo].[TbKitaplar] ([KitapAdi], [YazarAdi])
GO
ALTER TABLE [dbo].[TbEmanet] CHECK CONSTRAINT [FK_TbEmanet_TbKitaplar]
GO
ALTER TABLE [dbo].[TbEmanet]  WITH CHECK ADD  CONSTRAINT [FK_TbEmanet_TbUyeler] FOREIGN KEY([TcKimlikNo])
REFERENCES [dbo].[TbUyeler] ([TcKimlikNo])
GO
ALTER TABLE [dbo].[TbEmanet] CHECK CONSTRAINT [FK_TbEmanet_TbUyeler]
GO
USE [master]
GO
ALTER DATABASE [KutuphaneDB] SET  READ_WRITE 
GO
