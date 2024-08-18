CREATE DATABASE IF NOT EXISTS water_quality;

USE water_quality;

CREATE TABLE Region (
    RegionID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Population INT,
    AreaSize FLOAT
);

CREATE TABLE WaterSource (
    WaterSourceID INT PRIMARY KEY,
    Location VARCHAR(255) NOT NULL,
    Type VARCHAR(50),
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

CREATE TABLE WaterQuality (
    QualityID INT PRIMARY KEY,
    WaterSourceID INT,
    Date DATE,
    ContaminantType VARCHAR(255),
    ContaminationLevel FLOAT,
    FOREIGN KEY (WaterSourceID) REFERENCES WaterSource(WaterSourceID)
);

CREATE TABLE HealthIncident (
    IncidentID INT PRIMARY KEY,
    RegionID INT,
    Date DATE,
    DiseaseType VARCHAR(255),
    CasesReported INT,
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

CREATE TABLE Infrastructure (
    InfrastructureID INT PRIMARY KEY,
    WaterSourceID INT,
    FacilityType VARCHAR(255),
    Capacity FLOAT,
    FOREIGN KEY (WaterSourceID) REFERENCES WaterSource(WaterSourceID)
);
