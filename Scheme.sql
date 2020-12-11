-- GRAY Buildings
CREATE TABLE Building (
    Address VARCHAR(100) NOT NULL CONSTRAINT PK_Building PRIMARY KEY CLUSTERED,
    Operating BIT NOT NULL,
    Title VARCHAR(32) NOT NULL,
    NumberOfFloors INT NOT NULL,
    TotalArea INT NOT NULL,
);

-- GRAY  Floors of the building
CREATE TABLE Floors (
    ID BIGINT NOT NULL CONSTRAINT PK_Floors PRIMARY KEY CLUSTERED,
    BuildingID VARCHAR(100) NOT NULL CONSTRAINT FK_Building FOREIGN KEY REFERENCES Building(Address),
    LEVEL INT NOT NULL,
    UsableArea FLOAT NOT NULL,
    Operating BIT NOT NULL,
    CostPerSquare MONEY NOT NULL
);