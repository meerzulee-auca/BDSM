---- __________GRAY TABLES__________ ----
-- GRAY Buildings
CREATE TABLE dbo.Building
(
    Address VARCHAR(100) NOT NULL CONSTRAINT PK_Building PRIMARY KEY CLUSTERED,
    Operating BIT NOT NULL,
    Title VARCHAR(32) NOT NULL,
    NumberOfFloors INT NOT NULL,
    TotalArea INT NOT NULL,
);

GO
-- GRAY Floors of the building
CREATE TABLE dbo.Floors
(
    ID BIGSERIAL NOT NULL CONSTRAINT PK_Floors PRIMARY KEY CLUSTERED,
    BuildingID VARCHAR(100) NOT NULL CONSTRAINT FK_Building FOREIGN KEY REFERENCES Building(Address),
    LEVEL INT NOT NULL,
    UsableArea FLOAT NOT NULL,
    Operating BIT NOT NULL,
    CostPerSquare MONEY NOT NULL
);

GO
-- Gray Working rooms
CREATE TABLE dbo.WorkingRoom
(
    ID BIGSERIAL NOT NULL CONSTRAINT PK_WorkingRoom PRIMARY KEY CLUSTERED,
    FloorID bigint NOT NULL CONSTRAINT FK_Floors FOREIGN KEY REFERENCES Floors(ID),
    RoomTitle VARCHAR(100),
    Area FLOAT NOT NULL,
    IsOccupated BIT NOT NULL,
    MaxHumanLoad INT
);

GO
---- __________RED TABLES__________ ----
-- Create a new table called 'Companies' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Companies', 'U') IS NOT NULL DROP TABLE dbo.Companies
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Companies
(
    ID BIGSERIAL NOT NULL CONSTRAINT PK_Companies PRIMARY KEY,
    -- primary key column
    Title [NVARCHAR] (50) NOT NULL,
    Capitalisation bigint NOT NULL,
    Priority int NOT NULL,
    PotfolioURL varchar(400),
    PhoneNumberOfResponsible VARCHAR(50) NOT NULL
);

GO

-- Create a new table called 'MarketSectors' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.MarketSectors', 'U') IS NOT NULL
DROP TABLE dbo.MarketSectors
GO
-- Create the table in the specified schema
CREATE TABLE dbo.MarketSectors
(
    ID SERIAL NOT NULL PRIMARY KEY,
    -- primary key column
    Title NVARCHAR(50) NOT NULL,

);
GO

-- Create a new table called 'CompaniesSectors' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.CompaniesSectors', 'U') IS NOT NULL
DROP TABLE dbo.CompaniesSectors
GO
-- Create the table in the specified schema
CREATE TABLE dbo.CompaniesSectors
(
    ID BIGINT NOT NULL PRIMARY KEY,
    -- primary key column
    CompanyID bigint NOT NULL,
    SectorID bigint NOT NULL
);
GO



---- __________GREEN TABLES__________ ----

-- Create a new table called 'Persons' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Persons', 'U') IS NOT NULL
DROP TABLE dbo.Persons
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Persons
(
    ID BIGSERIAL NOT NULL PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(150) NOT NULL,
    PhoneNumber NVARCHAR(70) NOT NULL
);
GO

-- Create a new table called 'Cards' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Cards', 'U') IS NOT NULL
DROP TABLE dbo.Cards
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Cards
(
    ID BIGSERIAL NOT NULL PRIMARY KEY,
    PersonID bigint NOT NULL
        CONSTRAINT FK_Cards_Persons FOREIGN KEY REFERENCES dbo.Persons(ID),
    IsActive boolean NOT NULL
);
GO

---- __________RED TABLES__________ ----

-- Create a new table called 'ClientEmployees' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.ClientEmployees', 'U') IS NOT NULL
DROP TABLE dbo.ClientEmployees
GO
-- Create the table in the specified schema
CREATE TABLE dbo.ClientEmployees
(
    ID BIGSERIAL NOT NULL PRIMARY KEY,
    CompanyID bigint NOT NULL
        CONSTRAINT FK_ClientEmployees_Companies FOREIGN KEY REFERENCES dbo.Companies(ID) ,
    PersonID bigint NOT NULL
        CONSTRAINT FK_ClientEmployees_Persons FOREIGN KEY REFERENCES dbo.Persons(ID)

);
GO


---- __________BLUE TABLES__________ ----

-- Create a new table called 'Parkings' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Parkings', 'U') IS NOT NULL
DROP TABLE dbo.Parkings
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Parkings
(
    ID BIGSERIAL NOT NULL PRIMARY KEY,
    -- primary key column
    BuildingID varchar(100) NOT NULL
        CONSTRAINT FK_Parkings_Buildings FOREIGN KEY REFERENCES dbo.Buildings(Address) ,
    Capacity int NOT NULL,
    IsUnderground boolean NOT NULL
    -- specify more columns here
);
GO


