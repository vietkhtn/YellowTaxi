-- SQL Manager 2010 for SQL Server 3.5.0.4
-- ---------------------------------------
-- Host      : (local)
-- Database  : DDS
-- Version   : Microsoft SQL Server  9.00.1399.06

IF DB_ID ('YellowTaxiDDS') IS NOT NULL DROP DATABASE YellowTaxiDDS
GO
CREATE DATABASE YellowTaxiDDS
GO
use YellowTaxiDDS


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Geography]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Geography](
	[Geo_ID] [int] IDENTITY(1,1) NOT NULL,
	[Street] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[NguonDuLieu] int NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
 CONSTRAINT [PK_Geography] PRIMARY KEY CLUSTERED 
(
	[Geo_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendor](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] varchar(3) NOT NULL,
	[VendorName] [varchar](100) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PaymentType] (
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[payment_typeID] varchar(5) NOT NULL,
	[PaymentTypeName] [varchar](100) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Census_Tract]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Census_Tract] (
  [Ma] [int] IDENTITY(1,1) NOT NULL,
  [CTLabel] float NOT NULL,
  [BoroName] varchar(1000) NOT NULL,
  [BoroCode] float,
  [CT2010] float,
  [BoroCT2010] float,
  [CDEligibil] varchar(3),
  [NTACode] varchar(500),
  [NTAName] varchar(max),
  [PUMA] float,
  [Shape_leng] real,
  [Shape_area] real,
  [NgayTao] [datetime] NULL,
  [NgayCapNhat] [datetime] NULL,

 CONSTRAINT [PK_Census_Tract] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Time]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Time] (
  [Ma] [int] IDENTITY(1,1) NOT NULL,
  [Hour] int NULL,
  [Day] int NULL,
  [Quater] int NULL,
  [Month] int NULL,
  [Year] int NULL,
  [NgayTao] [datetime] NULL,
  [NgayCapNhat] [datetime] NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Trip]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Trip] (
  [Ma] [int] IDENTITY(1,1) NOT NULL,
  [vendor_id] int NULL,
  [pickup_datetime]  int NOT NULL,
  [dropoff_datetime] int NOT NULL,
  [pickup_geo]  int NOT NULL,
  [dropoff_geo] int NOT NULL,
  [pickup_Census_TractID]  int NOT NULL,
  [dropoff_Census_TractID] int NOT NULL,
  [payment_type] int NOT NULL,
  [passenger_count] int NULL,
  [trip_distance] float NULL,
  [fare_amount] float NOT NULL,
  [surcharge] float,
  [mta_tax] float NOT NULL,
  [tip_amount] float,
  [tolls_amount] float,
  [total_amount] float NOT NULL,
  [NguonDuLieu] int NULL,
  [NgayTao] [datetime] NULL,
  [NgayCapNhat] [datetime] NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO