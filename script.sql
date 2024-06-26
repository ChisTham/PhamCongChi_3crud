USE [Ananas]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[slug] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK__category__23CAF1F899A59B69] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[collection]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collection](
	[collectionID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[slug] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK__collecti__5BCE26BC69E9F734] PRIMARY KEY CLUSTERED 
(
	[collectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[colorID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[code] [nvarchar](7) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK__color__70A64C3D5199824A] PRIMARY KEY CLUSTERED 
(
	[colorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[discountID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[discount_percent] [decimal](5, 2) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK__discount__D2130A06746F6A34] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[market]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[market](
	[marketID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[slug] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK__market__EB884BDA836551EB] PRIMARY KEY CLUSTERED 
(
	[marketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[media]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[media](
	[mediaID] [int] IDENTITY(1,1) NOT NULL,
	[link] [nvarchar](255) NULL,
	[type] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK__media__D271B442629E2B7B] PRIMARY KEY CLUSTERED 
(
	[mediaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[product_code] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[quantity] [int] NULL,
	[size] [nvarchar](50) NULL,
	[description] [text] NULL,
	[price] [decimal](10, 2) NULL,
	[marketID] [int] NULL,
	[discountID] [int] NULL,
	[collectionID] [int] NULL,
	[categoryID] [int] NULL,
	[productLineID] [int] NULL,
	[productStatusID] [int] NULL,
	[upper] [bit] NULL,
	[lower] [bit] NULL,
	[accessory] [bit] NULL,
	[styleID] [int] NULL,
	[mediaID] [int] NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK__product__2D10D14A3779420B] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__product__AE1A8CC4EA3B9B52] UNIQUE NONCLUSTERED 
(
	[product_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_detail]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_detail](
	[productDetailID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NOT NULL,
	[colorID] [int] NOT NULL,
	[sexID] [int] NOT NULL,
	[sizeID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[image] [nvarchar](255) NULL,
	[specialname] [nvarchar](255) NULL,
 CONSTRAINT [PK__product___D7B1FEA3419F8B36] PRIMARY KEY CLUSTERED 
(
	[productDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_line]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_line](
	[productLineID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[slug] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK__product___690EA997DAA8D627] PRIMARY KEY CLUSTERED 
(
	[productLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_status]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_status](
	[productStatusID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[slug] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK__product___CFBEBB9C3E88627D] PRIMARY KEY CLUSTERED 
(
	[productStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sex]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sex](
	[sexID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[slug] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK__sex__D8437C7CCA842095] PRIMARY KEY CLUSTERED 
(
	[sexID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[sizeID] [int] IDENTITY(1,1) NOT NULL,
	[categoryID] [int] NOT NULL,
	[size] [varchar](50) NOT NULL,
 CONSTRAINT [PK_size] PRIMARY KEY CLUSTERED 
(
	[sizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[style]    Script Date: 6/27/2024 6:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[style](
	[styleID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[slug] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK__style__1F798D7E6FD80E28] PRIMARY KEY CLUSTERED 
(
	[styleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__categor__3B75D760] FOREIGN KEY([categoryID])
REFERENCES [dbo].[category] ([categoryID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__categor__3B75D760]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__collect__3A81B327] FOREIGN KEY([collectionID])
REFERENCES [dbo].[collection] ([collectionID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__collect__3A81B327]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__discoun__398D8EEE] FOREIGN KEY([discountID])
REFERENCES [dbo].[discount] ([discountID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__discoun__398D8EEE]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__marketI__38996AB5] FOREIGN KEY([marketID])
REFERENCES [dbo].[market] ([marketID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__marketI__38996AB5]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__mediaID__3F466844] FOREIGN KEY([mediaID])
REFERENCES [dbo].[media] ([mediaID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__mediaID__3F466844]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__product__3C69FB99] FOREIGN KEY([productLineID])
REFERENCES [dbo].[product_line] ([productLineID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__product__3C69FB99]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__product__3D5E1FD2] FOREIGN KEY([productStatusID])
REFERENCES [dbo].[product_status] ([productStatusID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__product__3D5E1FD2]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__styleID__3E52440B] FOREIGN KEY([styleID])
REFERENCES [dbo].[style] ([styleID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__styleID__3E52440B]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD  CONSTRAINT [FK__product_d__color__4316F928] FOREIGN KEY([colorID])
REFERENCES [dbo].[color] ([colorID])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK__product_d__color__4316F928]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD  CONSTRAINT [FK__product_d__produ__4222D4EF] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK__product_d__produ__4222D4EF]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD  CONSTRAINT [FK__product_d__sexID__440B1D61] FOREIGN KEY([sexID])
REFERENCES [dbo].[sex] ([sexID])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK__product_d__sexID__440B1D61]
GO
ALTER TABLE [dbo].[size]  WITH CHECK ADD  CONSTRAINT [FK_size_category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[category] ([categoryID])
GO
ALTER TABLE [dbo].[size] CHECK CONSTRAINT [FK_size_category]
GO
