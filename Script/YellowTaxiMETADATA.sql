-- SQL Manager 2010 for SQL Server 3.5.0.4
-- ---------------------------------------
-- Host      : (local)
-- Database  : METADATA
-- Version   : Microsoft SQL Server  9.00.1399.06

IF DB_ID ('YellowTaxiMETADATA') IS NOT NULL DROP DATABASE YellowTaxiMETADATA
GO
CREATE DATABASE YellowTaxiMETADATA
GO
use YellowTaxiMETADATA

CREATE TABLE [dbo].[Data_Flow] (
  [id] int NOT NULL,
  [TenBang] varchar(100) NOT NULL,
  [NgayCapNhat] datetime2 NOT NULL,
)
ON [PRIMARY]
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [NgayCapNhat])
VALUES 
  (1, N'Census_Tract_stage', '20110517 22:11:11.660')
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [NgayCapNhat])
VALUES 
  (2, N'Yellow_Taxi_stage', '20110517 22:11:11.823')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [NgayCapNhat])
VALUES 
  (3, N'StartPointLocation_stage', '20110517 22:11:11.660')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [NgayCapNhat])
VALUES 
  (4, N'DestinationLocation_stage', '20110517 22:11:11.660')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [NgayCapNhat])
VALUES 
  (5, N'StartPointCensusTract_stage', '20110517 22:11:11.660')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [NgayCapNhat])
VALUES 
  (6, N'DestinationCensusTract_stage', '20110517 22:11:11.660')
GO