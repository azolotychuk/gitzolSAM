USE [master]
GO
/****** Object:  Database [flower]    Script Date: 14.02.2024 15:45:48 ******/
CREATE DATABASE [flower]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'flower', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\flower.mdf' , SIZE = 38208KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'flower_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\flower_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [flower] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [flower].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [flower] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [flower] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [flower] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [flower] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [flower] SET ARITHABORT OFF 
GO
ALTER DATABASE [flower] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [flower] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [flower] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [flower] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [flower] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [flower] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [flower] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [flower] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [flower] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [flower] SET  DISABLE_BROKER 
GO
ALTER DATABASE [flower] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [flower] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [flower] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [flower] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [flower] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [flower] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [flower] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [flower] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [flower] SET  MULTI_USER 
GO
ALTER DATABASE [flower] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [flower] SET DB_CHAINING OFF 
GO
ALTER DATABASE [flower] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [flower] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [flower] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [flower] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [flower] SET QUERY_STORE = OFF
GO
USE [flower]
GO
/****** Object:  Table [dbo].[login]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id] [nchar](10) NOT NULL,
	[password] [nchar](10) NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Букеты]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Букеты](
	[Код букета] [int] NOT NULL,
	[Букеты] [nvarchar](255) NULL,
	[Цена] [money] NULL,
	[Букетов в наличии] [int] NULL,
	[Состав букета] [nvarchar](255) NULL,
	[Код покупателя] [int] NULL,
	[Код поставщика] [int] NULL,
 CONSTRAINT [PK_Букеты] PRIMARY KEY CLUSTERED 
(
	[Код букета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ДОСТАВКА(Б)]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ДОСТАВКА(Б)](
	[Код покупателя1] [int] NULL,
	[Адрес покупателя] [nvarchar](255) NULL,
	[Приобретённый товар] [int] NULL,
	[Цена] [money] NULL,
	[Количество] [int] NULL,
	[Дата заказа] [datetime] NULL,
	[Дата отгрузки] [datetime] NULL,
	[Доставка] [int] NULL,
	[Стоимость доставки] [money] NULL,
	[Общая стоимость] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[доставка_подстанова]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[доставка_подстанова](
	[Код доставки] [int] NOT NULL,
	[Доставка] [nvarchar](255) NULL,
	[Стоимость доставки] [money] NULL,
	[Отчёт о доставке] [nvarchar](255) NULL,
 CONSTRAINT [PK_доставка_подстанова] PRIMARY KEY CLUSTERED 
(
	[Код доставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ в срочном порядке]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ в срочном порядке](
	[Адрес покупателя] [nvarchar](255) NULL,
	[Доставка] [int] NULL,
	[Отчёт о доставке] [nvarchar](255) NULL,
	[ФИО работника по службе доставки] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЗАЛ(Б)]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЗАЛ(Б)](
	[Код покупателя] [int] NULL,
	[Приобретённый товар(букеты)] [int] NULL,
	[Цена] [money] NULL,
	[Количество товара] [int] NULL,
	[Общая стоимость] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЗАЛ(К)]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЗАЛ(К)](
	[Код покупателя] [int] NULL,
	[Приобретённый товар(комнатные растения)] [int] NULL,
	[Цена] [money] NULL,
	[Количество товара] [int] NULL,
	[Общая стоимость] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЗАЛ(П)]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЗАЛ(П)](
	[Код покупателя] [int] NULL,
	[Приобретённые подарочные коробки] [int] NULL,
	[Цена] [money] NULL,
	[Количество товара] [int] NULL,
	[Общая стоимость] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЗАЛ(С)]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЗАЛ(С)](
	[Код покупателя] [int] NULL,
	[Приобретённый сопутствующий товар] [int] NULL,
	[Цена] [money] NULL,
	[Количество товара] [int] NULL,
	[Общая стоимость] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЗАЛ(Ц+У)]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЗАЛ(Ц+У)](
	[Код покупателя] [int] NULL,
	[Приобретённый товар(срезанные цветы)] [smallint] NULL,
	[Срезанные цветы(поштучно).Цена] [money] NULL,
	[Количество товара] [int] NULL,
	[Упаковка цветов(при покупке срезанных цветов)] [int] NULL,
	[Упаковка цветов.Цена] [money] NULL,
	[Общая стоимость] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Комнатные растения]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Комнатные растения](
	[Код комнатного растения] [int] NOT NULL,
	[Комнатные растения] [nvarchar](255) NULL,
	[Цена] [money] NULL,
	[Имеется в наличии] [int] NULL,
	[Описание ухода] [nvarchar](255) NULL,
	[Код поставщика] [int] NULL,
 CONSTRAINT [PK_Комнатные растения] PRIMARY KEY CLUSTERED 
(
	[Код комнатного растения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Наличие товара]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Наличие товара](
	[Букеты] [nvarchar](255) NULL,
	[Букетов в наличии] [int] NULL,
	[Комнатные растения] [nvarchar](255) NULL,
	[Комнатные растения.Имеется в наличии] [int] NULL,
	[Подарочные коробки] [nvarchar](255) NULL,
	[Подарочные коробки.Имеется в наличии] [int] NULL,
	[Товар] [nvarchar](255) NULL,
	[Сопутствующие товары.Имеется в наличии] [int] NULL,
	[Ассортимент] [nvarchar](255) NULL,
	[Срезанные цветы(поштучно).Имеется в наличии] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Отказ от товара]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отказ от товара](
	[Адрес покупателя] [nvarchar](255) NULL,
	[Приобретённый товар] [int] NULL,
	[Количество] [int] NULL,
	[Дата заказа] [datetime] NULL,
	[Доставка] [int] NULL,
	[Отчёт о доставке] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Подарочные коробки]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Подарочные коробки](
	[Код подарочной коробки] [int] NOT NULL,
	[Подарочные коробки] [nvarchar](255) NULL,
	[Цена] [money] NULL,
	[Имеется в наличии] [int] NULL,
	[Код поставщика] [int] NULL,
 CONSTRAINT [PK_Подарочные коробки] PRIMARY KEY CLUSTERED 
(
	[Код подарочной коробки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Покупатели(доставка)]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Покупатели(доставка)](
	[Код покупателя1] [int] NOT NULL,
	[Адрес покупателя] [nvarchar](255) NULL,
	[Приобретённый товар] [int] NULL,
	[Количество] [int] NULL,
	[Дата заказа] [datetime] NULL,
	[Дата отгрузки] [datetime] NULL,
	[Доставка] [int] NULL,
	[Стоимость доставки] [money] NULL,
	[Отчёт о доставке] [nvarchar](255) NULL,
	[Код работника по службе доставки] [int] NULL,
	[Общая стоимость] [money] NULL,
 CONSTRAINT [PK_Покупатели(доставка)] PRIMARY KEY CLUSTERED 
(
	[Код покупателя1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Покупатели(зал)]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Покупатели(зал)](
	[Код покупателя] [int] NOT NULL,
	[Приобретённый товар(букеты)] [int] NULL,
	[Приобретённый товар(комнатные растения)] [int] NULL,
	[Приобретённый товар(срезанные цветы)] [smallint] NULL,
	[Упаковка цветов(при покупке срезанных цветов)] [int] NULL,
	[Приобретённый сопутствующий товар] [int] NULL,
	[Приобретённые подарочные коробки] [int] NULL,
	[Количество товара] [int] NULL,
	[Общая стоимость] [money] NULL,
	[Код флориста] [int] NULL,
 CONSTRAINT [PK_Покупатели(зал)] PRIMARY KEY CLUSTERED 
(
	[Код покупателя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[Код поставщика] [int] NOT NULL,
	[Наименование компании] [nvarchar](255) NULL,
	[Номер телефона компании] [nvarchar](255) NULL,
	[Адрес компании] [nvarchar](255) NULL,
 CONSTRAINT [PK_Поставщики] PRIMARY KEY CLUSTERED 
(
	[Код поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Служба доставки]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Служба доставки](
	[Код работника по службе доставки] [int] NOT NULL,
	[ФИО работника по службе доставки] [nvarchar](255) NULL,
	[График работы работника по службе доставки] [nvarchar](255) NULL,
	[Код покупателя] [int] NULL,
 CONSTRAINT [PK_Служба доставки] PRIMARY KEY CLUSTERED 
(
	[Код работника по службе доставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сопутствующие товары]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сопутствующие товары](
	[Код сопутствующих товаров] [int] NOT NULL,
	[Товар] [nvarchar](255) NULL,
	[Цена] [money] NULL,
	[Имеется в наличии] [int] NULL,
	[Код поставщика] [int] NULL,
 CONSTRAINT [PK_Сопутствующие товары] PRIMARY KEY CLUSTERED 
(
	[Код сопутствующих товаров] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Срезанные цветы(поштучно)]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Срезанные цветы(поштучно)](
	[Код срезанных цветов] [smallint] NOT NULL,
	[Ассортимент] [nvarchar](255) NULL,
	[Цена] [money] NULL,
	[Имеется в наличии] [int] NULL,
	[Описание] [nvarchar](255) NULL,
	[Код поставщика] [int] NULL,
 CONSTRAINT [PK_Срезанные цветы(поштучно)] PRIMARY KEY CLUSTERED 
(
	[Код срезанных цветов] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Упаковка цветов]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Упаковка цветов](
	[Код упаковки] [int] NOT NULL,
	[Упаковочные товары] [nvarchar](255) NULL,
	[Цена] [money] NULL,
	[Код поставщика] [int] NULL,
 CONSTRAINT [PK_Упаковка цветов] PRIMARY KEY CLUSTERED 
(
	[Код упаковки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Флористы]    Script Date: 14.02.2024 15:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Флористы](
	[Код флориста] [int] NOT NULL,
	[ФИО флориста] [nvarchar](255) NULL,
	[График работы флориста] [nvarchar](255) NULL,
 CONSTRAINT [PK_Флористы] PRIMARY KEY CLUSTERED 
(
	[Код флориста] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Букеты]  WITH CHECK ADD  CONSTRAINT [FK_Букеты_Поставщики] FOREIGN KEY([Код поставщика])
REFERENCES [dbo].[Поставщики] ([Код поставщика])
GO
ALTER TABLE [dbo].[Букеты] CHECK CONSTRAINT [FK_Букеты_Поставщики]
GO
ALTER TABLE [dbo].[Комнатные растения]  WITH CHECK ADD  CONSTRAINT [FK_Комнатные растения_Поставщики] FOREIGN KEY([Код поставщика])
REFERENCES [dbo].[Поставщики] ([Код поставщика])
GO
ALTER TABLE [dbo].[Комнатные растения] CHECK CONSTRAINT [FK_Комнатные растения_Поставщики]
GO
ALTER TABLE [dbo].[Подарочные коробки]  WITH CHECK ADD  CONSTRAINT [FK_Подарочные коробки_Поставщики] FOREIGN KEY([Код поставщика])
REFERENCES [dbo].[Поставщики] ([Код поставщика])
GO
ALTER TABLE [dbo].[Подарочные коробки] CHECK CONSTRAINT [FK_Подарочные коробки_Поставщики]
GO
ALTER TABLE [dbo].[Покупатели(доставка)]  WITH CHECK ADD  CONSTRAINT [FK_Покупатели(доставка)_доставка_подстанова] FOREIGN KEY([Доставка])
REFERENCES [dbo].[доставка_подстанова] ([Код доставки])
GO
ALTER TABLE [dbo].[Покупатели(доставка)] CHECK CONSTRAINT [FK_Покупатели(доставка)_доставка_подстанова]
GO
ALTER TABLE [dbo].[Покупатели(доставка)]  WITH CHECK ADD  CONSTRAINT [FK_Покупатели(доставка)_Служба доставки] FOREIGN KEY([Код работника по службе доставки])
REFERENCES [dbo].[Служба доставки] ([Код работника по службе доставки])
GO
ALTER TABLE [dbo].[Покупатели(доставка)] CHECK CONSTRAINT [FK_Покупатели(доставка)_Служба доставки]
GO
ALTER TABLE [dbo].[Покупатели(зал)]  WITH CHECK ADD  CONSTRAINT [FK_Покупатели(зал)_Букеты] FOREIGN KEY([Приобретённый товар(букеты)])
REFERENCES [dbo].[Букеты] ([Код букета])
GO
ALTER TABLE [dbo].[Покупатели(зал)] CHECK CONSTRAINT [FK_Покупатели(зал)_Букеты]
GO
ALTER TABLE [dbo].[Покупатели(зал)]  WITH CHECK ADD  CONSTRAINT [FK_Покупатели(зал)_Комнатные растения] FOREIGN KEY([Приобретённый товар(комнатные растения)])
REFERENCES [dbo].[Комнатные растения] ([Код комнатного растения])
GO
ALTER TABLE [dbo].[Покупатели(зал)] CHECK CONSTRAINT [FK_Покупатели(зал)_Комнатные растения]
GO
ALTER TABLE [dbo].[Покупатели(зал)]  WITH CHECK ADD  CONSTRAINT [FK_Покупатели(зал)_Подарочные коробки] FOREIGN KEY([Приобретённые подарочные коробки])
REFERENCES [dbo].[Подарочные коробки] ([Код подарочной коробки])
GO
ALTER TABLE [dbo].[Покупатели(зал)] CHECK CONSTRAINT [FK_Покупатели(зал)_Подарочные коробки]
GO
ALTER TABLE [dbo].[Покупатели(зал)]  WITH CHECK ADD  CONSTRAINT [FK_Покупатели(зал)_Сопутствующие товары] FOREIGN KEY([Приобретённый сопутствующий товар])
REFERENCES [dbo].[Сопутствующие товары] ([Код сопутствующих товаров])
GO
ALTER TABLE [dbo].[Покупатели(зал)] CHECK CONSTRAINT [FK_Покупатели(зал)_Сопутствующие товары]
GO
ALTER TABLE [dbo].[Покупатели(зал)]  WITH CHECK ADD  CONSTRAINT [FK_Покупатели(зал)_Срезанные цветы(поштучно)] FOREIGN KEY([Приобретённый товар(срезанные цветы)])
REFERENCES [dbo].[Срезанные цветы(поштучно)] ([Код срезанных цветов])
GO
ALTER TABLE [dbo].[Покупатели(зал)] CHECK CONSTRAINT [FK_Покупатели(зал)_Срезанные цветы(поштучно)]
GO
ALTER TABLE [dbo].[Покупатели(зал)]  WITH CHECK ADD  CONSTRAINT [FK_Покупатели(зал)_Упаковка цветов] FOREIGN KEY([Упаковка цветов(при покупке срезанных цветов)])
REFERENCES [dbo].[Упаковка цветов] ([Код упаковки])
GO
ALTER TABLE [dbo].[Покупатели(зал)] CHECK CONSTRAINT [FK_Покупатели(зал)_Упаковка цветов]
GO
ALTER TABLE [dbo].[Покупатели(зал)]  WITH CHECK ADD  CONSTRAINT [FK_Покупатели(зал)_Флористы] FOREIGN KEY([Код флориста])
REFERENCES [dbo].[Флористы] ([Код флориста])
GO
ALTER TABLE [dbo].[Покупатели(зал)] CHECK CONSTRAINT [FK_Покупатели(зал)_Флористы]
GO
ALTER TABLE [dbo].[Сопутствующие товары]  WITH CHECK ADD  CONSTRAINT [FK_Сопутствующие товары_Поставщики] FOREIGN KEY([Код поставщика])
REFERENCES [dbo].[Поставщики] ([Код поставщика])
GO
ALTER TABLE [dbo].[Сопутствующие товары] CHECK CONSTRAINT [FK_Сопутствующие товары_Поставщики]
GO
ALTER TABLE [dbo].[Срезанные цветы(поштучно)]  WITH CHECK ADD  CONSTRAINT [FK_Срезанные цветы(поштучно)_Поставщики] FOREIGN KEY([Код поставщика])
REFERENCES [dbo].[Поставщики] ([Код поставщика])
GO
ALTER TABLE [dbo].[Срезанные цветы(поштучно)] CHECK CONSTRAINT [FK_Срезанные цветы(поштучно)_Поставщики]
GO
ALTER TABLE [dbo].[Упаковка цветов]  WITH CHECK ADD  CONSTRAINT [FK_Упаковка цветов_Поставщики] FOREIGN KEY([Код поставщика])
REFERENCES [dbo].[Поставщики] ([Код поставщика])
GO
ALTER TABLE [dbo].[Упаковка цветов] CHECK CONSTRAINT [FK_Упаковка цветов_Поставщики]
GO
USE [master]
GO
ALTER DATABASE [flower] SET  READ_WRITE 
GO
