USE water_quality;

-- Retrieve all data  from the individual tables.
SELECT * FROM Region;
SELECT * FROM WaterSource;
SELECT * FROM WaterQuality;
SELECT * FROM HealthIncident;
SELECT * FROM Infrastructure;

-- Retrieve specific (filtered data.)
-- Retrieve water sources and their locations for a specific region (RegionID = 5)
SELECT * FROM WaterSource
WHERE RegionID = 5;

-- Retrieve water quality data for water sources with contamination level of E. coli greater than 150
SELECT WaterSourceID, ContaminantType, ContaminationLevel
FROM WaterQuality
WHERE ContaminantType = 'E. coli' AND ContaminationLevel > 150;

-- Retrieve health incidents for a specific disease type (DiseaseType = 'Cholera')
SELECT RegionID, Date, CasesReported
FROM HealthIncident
WHERE DiseaseType = 'Cholera';

-- Retrieve infrastructure details for treatment plants with a capacity greater than 5500
SELECT WaterSourceID, FacilityType, Capacity
FROM Infrastructure
WHERE FacilityType = 'Treatment Plant' AND Capacity > 5500;
