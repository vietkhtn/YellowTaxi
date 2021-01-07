-- SQL Manager 2010 for SQL Server 3.5.0.4
-- ---------------------------------------
-- Host      : (local)
-- Database  : Stage
-- Version   : Microsoft SQL Server  9.00.1399.06

IF DB_ID ('YellowTaxiStage') IS NOT NULL DROP DATABASE YellowTaxiStage
GO
CREATE DATABASE YellowTaxiStage
GO
use YellowTaxiStage
--DROP TABLE [dbo].[Yellow_Taxi_stage]
CREATE TABLE [dbo].[Yellow_Taxi_stage] (
  [vendor_id] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [tpep_pickup_datetime] varchar(max) NOT NULL,
  [tpep_dropoff_datetime] varchar(max) NOT NULL,
  [passenger_count] int NULL,
  [trip_distance] float NULL,
  [pulocationid] varchar(50) NOT NULL,
  [dolocationid] varchar(50) NOT NULL,
  [rate_code] int,
  [store_and_fwd_flag] varchar(max),
  [payment_type] varchar(max) NOT NULL,
  [fare_amount] float NOT NULL,
  [improvement_surcharge] float,
  [extra] float,
  [mta_tax] float NOT NULL,
  [tip_amount] float,
  [tolls_amount] float,
  [total_amount] float NOT NULL,
  [status_id] [int] NULL
)
ON [PRIMARY]
GO

--Drop TABLE [dbo].[Census_Tract_stage]
CREATE TABLE [dbo].[Census_Tract_stage] (
  [CTLabel] varchar(50) NOT NULL,
  [BoroName] varchar(1000) NOT NULL,
  [BoroCode] varchar(10),
  [CT2010] varchar(max),
  [BoroCT2010] varchar(max),
  [CDEligibil] varchar(max),
  [PUMA] varchar(max),
  [Shape_leng] varchar(max),
  [Shape_area] varchar(max),
  [status_id] [int] NULL
)
ON [PRIMARY]
GO


--Drop TABLE [dbo].[StartPointLocation_stage]
CREATE TABLE [dbo].[StartPointLocation_stage] (
  [PUBorough] varchar(100) NOT NULL,
  [PUZone] varchar(100) NOT NULL,
  [pulocationid] varchar(50) NOT NULL,
  [status_id] [int] NULL
)
ON [PRIMARY]
GO

--Drop TABLE [dbo].[DestinationLocation_stage]
CREATE TABLE [dbo].[DestinationLocation_stage] (
  [DOBorough] varchar(100) NOT NULL,
  [DOZone] varchar(100) NOT NULL,
  [dolocationid] varchar(50) NOT NULL,
  [status_id] [int] NULL
)
ON [PRIMARY]
GO


--Drop TABLE [dbo].[StartPointFIPS_stage]
CREATE TABLE [dbo].[StartPointCensusTract_stage] (
  [census_Tract] varchar(50),--Census_BlockID
  [pulocationid] varchar(50) NOT NULL,
  [status_id] [int] NULL
)
ON [PRIMARY]
GO

--Drop TABLE [dbo].[DestinationFIPS_stage]
CREATE TABLE [dbo].[DestinationCensusTract_stage] (
  [census_Tract] varchar(50),--Census_BlockID
  [dolocationid] varchar(50) NOT NULL,
  [status_id] [int] NULL
)
ON [PRIMARY]
GO