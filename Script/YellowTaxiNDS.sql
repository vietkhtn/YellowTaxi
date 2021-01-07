 -- SQL Manager 2010 for SQL Server 3.5.0.4
-- ---------------------------------------
-- Host      : (local)
-- Database  : NDS
-- Version   : Microsoft SQL Server  9.00.1399.06

IF DB_ID ('YellowTaxiNDS') IS NOT NULL DROP DATABASE YellowTaxiNDS
GO
CREATE DATABASE YellowTaxiNDS
GO
use YellowTaxiNDS


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NguonDuLieu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NguonDuLieu](
	[ID] [int] IDENTITY(1,1) NOT NULL, 
	[NguonDuLieuID] varchar(5) NOT NULL,
	[Name] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_NguonDuLieu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Status]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL, 
	[StatusName] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
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
	[ID] [int] IDENTITY(1,1) NOT NULL,  --ma trong NDS de nap du lieu
	[PaymentTypeName] [varchar](100) NULL,
	[StatusID] [int] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


-- Drop TABLE [dbo].[City]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[City]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[City] (
	[ID] [int] IDENTITY(1,1) NOT NULL, --ma trong NDS de nap du lieu
	[CityName] [varchar](1000) NULL,
	[NguonDuLieuID] int NOT NULL,
	[StatusID] [int] NULL,
	[Createtime] [datetime] NULL,
	[Updatetime] [datetime] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[District]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[District] (
	[ID] [int] IDENTITY(1,1) NOT NULL, --ma trong NDS de nap du lieu
	[DistrictName] [varchar](1000) NULL,
	[NguonDuLieuID] int NOT NULL,
	[StatusID] [int] NULL,
	[Createtime] [datetime] NULL,
	[Updatetime] [datetime] NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rate_code]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rate_code] (
	[ID] [int] IDENTITY(1,1) NOT NULL, --ma trong NDS de nap du lieu
	[Rate_codeName] [varchar](1000) NULL,
	[StatusID] [int] NULL,
	[Createtime] [datetime] NULL,
	[Updatetime] [datetime] NULL,
 CONSTRAINT [PK_Rate_code] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Census_Block]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Census_Block] (
	[ID] [int] IDENTITY(1,1) NOT NULL, --ma trong NDS de nap du lieu
	[Census_Tract] varchar(1000) NOT NULL,
	[StatusID] [int] NULL,
	[Createtime] [datetime] NULL,
	[Updatetime] [datetime] NULL,
 CONSTRAINT [PK_Census_Block] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


-- DROP TABLE [dbo].[Census_Tract]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Census_Tract]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Census_Tract] (
	[ID] [int] IDENTITY(1,1) NOT NULL, --ma trong NDS de nap du lieu
	[CTLabel] varchar(50) NOT NULL,
	[BoroName] varchar(1000) NOT NULL,
	[BoroCode] float NOT NULL,
	[CT2010] float,
	[BoroCT2010] float,
	[CDEligibil] varchar(3),
	[PUMA] float,
	[Shape_leng] real,
	[Shape_area] real,
	[StatusID] [int] NULL,
	[Createtime] [datetime] NULL,
	[Updatetime] [datetime] NULL,
 CONSTRAINT [PK_Census_Tract] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

-- DROP TABLE [dbo].[Trip_Record]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Trip_Record]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Trip_Record] (
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[pickup_datetime] [datetime] NOT NULL,
	[dropoff_datetime] [datetime] NOT NULL,
	[pickup_district] varchar(100),
	[pickup_city] varchar(100),				 -- Census_Block ID
	[dropoff_district] varchar(100),
	[dropoff_city] varchar(100),			 -- Census_Block ID
	--[pickup_id] int,							 --FK
	--[dropoff_id] int,							 --FK
	[rate_code_id] int,							 --FK
	[payment_type] int,							 --FK
	[passenger_count] int NULL,
	[trip_distance] float NULL,
	[fare_amount] float NOT NULL,
	[surcharge] float,
	[mta_tax] float NOT NULL,
	[tip_amount] float,
	[tolls_amount] float,
	[total_amount] float NOT NULL,
	[NguonDuLieuID] [varchar](5) NULL,							 --FK
	[StatusID] [int] NULL,							 --FK
	[Createtime] [datetime] NULL,
	[Updatetime] [datetime] NULL,
 CONSTRAINT [PK_Trip_Record] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO



----FK den Status

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TripRecord_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[Trip_Record]'))
ALTER TABLE [dbo].[Trip_Record]  WITH CHECK ADD  CONSTRAINT [FK_TripRecord_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PaymentType_Status]') AND
parent_object_id = OBJECT_ID(N'[dbo].[PaymentType]'))
ALTER TABLE [dbo].[PaymentType]  WITH CHECK ADD  CONSTRAINT [FK_PaymentType_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CensusBlock_Status]') AND
parent_object_id = OBJECT_ID(N'[dbo].[Census_Block]'))
ALTER TABLE [dbo].[Census_Block]  WITH CHECK ADD  CONSTRAINT [FK_CensusBlock_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RateCode_Status]') AND
parent_object_id = OBJECT_ID(N'[dbo].[Rate_code]'))
ALTER TABLE [dbo].[Rate_code]  WITH CHECK ADD  CONSTRAINT [FK_RateCode_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CensusTract_Status]') AND
parent_object_id = OBJECT_ID(N'[dbo].[Census_Tract]'))
ALTER TABLE [dbo].[Census_Tract]  WITH CHECK ADD  CONSTRAINT [FK_CensusTract_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_Status]') AND
parent_object_id = OBJECT_ID(N'[dbo].[City]'))
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_District_Status]') AND
parent_object_id = OBJECT_ID(N'[dbo].[Borough]'))
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO

----FK den Vendor

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_NguonDuLieu]') AND
parent_object_id = OBJECT_ID(N'[dbo].[City]'))
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Vendor] FOREIGN KEY([NguonDuLieuID])
REFERENCES [dbo].[NguonDuLieu] ([ID])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_District_NguonDuLieu]') AND
parent_object_id = OBJECT_ID(N'[dbo].[NguonDuLieu]'))
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_Vendor] FOREIGN KEY([NguonDuLieuID])
REFERENCES [dbo].[NguonDuLieu] ([ID])
GO


---FK Trip_Record

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TripRecord_Ratecode]') AND
parent_object_id = OBJECT_ID(N'[dbo].[Trip_Record]'))
ALTER TABLE [dbo].[Trip_Record]  WITH CHECK ADD  CONSTRAINT [FK_TripRecord_Ratecode] FOREIGN KEY([rate_code_id])
REFERENCES [dbo].[rate_code] ([ID])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TripRecord_PaymentType]') AND
parent_object_id = OBJECT_ID(N'[dbo].[Trip_Record]'))
ALTER TABLE [dbo].[Trip_Record]  WITH CHECK ADD  CONSTRAINT [FK_TripRecord_PaymentType] FOREIGN KEY([payment_type])
REFERENCES [dbo].[PaymentType] ([ID])
GO

--
-- Data for table dbo.Vendor  (LIMIT 0,500)
--


INSERT INTO [dbo].[Vendor] ([VendorID], [Name], [CreateTime], [UpdateTime])
VALUES 
  ('CMT', N'Creative Mobile Technologies', '20210101', '20210101')
GO

INSERT INTO [dbo].[Vendor] ([VendorID], [Name], [CreateTime], [UpdateTime])
VALUES 
  ('VTS', N'VeriFone, Inc', '20210101', '20210101')
GO

INSERT INTO [dbo].[Vendor] ([VendorID], [Name], [CreateTime], [UpdateTime])
VALUES 
  ('DDS', N'Digital Dispatch Systems', '20210101', '20210101')
GO

INSERT INTO [dbo].[Vendor] ([VendorID], [Name], [CreateTime], [UpdateTime])
VALUES 
  ('API', N'Here API', '20210101', '20210101')
GO
--
-- Data for table dbo.Status (LIMIT 0,500)
--
SET IDENTITY_INSERT [dbo].[Status] ON
GO

INSERT INTO [dbo].[Status] ([ID], [StatusName], [CreateTime], [UpdateTime])
VALUES 
  (1, N'Dang hoat dong', '20110101', '20110101')
GO

INSERT INTO  [dbo].[Status] ([ID], [StatusName], [CreateTime], [UpdateTime])
VALUES 
  (2, N'Het han', '20110101', '20110101')
GO

SET IDENTITY_INSERT [dbo].[Status] Off
GO

--
-- Data for table dbo.PaymentType (LIMIT 0,500)
--
SET IDENTITY_INSERT [dbo].[PaymentType] ON
GO

INSERT INTO [dbo].[PaymentType] ([ID], [PaymentTypeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (1, N'Credit card','1','20210101', '20210101')
GO


INSERT INTO [dbo].[PaymentType] ([ID], [PaymentTypeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (2, N'Cash','1','20210101', '20210101')
GO


INSERT INTO [dbo].[PaymentType] ([ID], [PaymentTypeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (3, N'No charge','1','20210101', '20210101')
GO


INSERT INTO [dbo].[PaymentType] ([ID], [PaymentTypeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (4, N'Dispute','1','20210101', '20210101')
GO


INSERT INTO [dbo].[PaymentType] ([ID], [PaymentTypeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (5, N'Unknown','1','20210101', '20210101')
GO


INSERT INTO [dbo].[PaymentType] ([ID], [PaymentTypeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (6, N'Voided trip','1','20210101', '20210101')
GO

SET IDENTITY_INSERT [dbo].[PaymentType] Off
GO


--
-- Data for table dbo.Rate_code (LIMIT 0,500)
--
SET IDENTITY_INSERT [dbo].[Rate_code] ON
GO

INSERT INTO [dbo].[Rate_code] ([ID], [Rate_codeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (1, N'Standard rate ','1','20210101', '20210101')
GO


INSERT INTO [dbo].[Rate_code] ([ID], [Rate_codeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (2, N'JFK','1','20210101', '20210101')
GO


INSERT INTO [dbo].[Rate_code] ([ID], [Rate_codeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (3, N'Newark','1','20210101', '20210101')
GO


INSERT INTO [dbo].[Rate_code] ([ID], [Rate_codeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (4, N'Nassau or Westchester','1','20210101', '20210101')
GO


INSERT INTO [dbo].[Rate_code] ([ID], [Rate_codeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (5, N'Negotiated fare','1','20210101', '20210101')
GO


INSERT INTO [dbo].[Rate_code] ([ID], [Rate_codeName], [StatusID], [CreateTime], [UpdateTime])
VALUES 
  (6, N'Group ride','1','20210101', '20210101')
GO

SET IDENTITY_INSERT [dbo].[Rate_code] Off
GO








