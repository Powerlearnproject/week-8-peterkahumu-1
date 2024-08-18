USE water_quality;

-- Water Quality by contaminant type.
SELECT 
    ContaminantType,
    COUNT(*) AS NumberOfRecords,
    AVG(ContaminationLevel) AS AvgContaminationLevel
FROM 
    WaterQuality
GROUP BY 
    ContaminantType;

-- Average contaminantino by water source location
SELECT 
    ws.Location,
    AVG(wq.ContaminationLevel) AS AvgContaminationLevel
FROM 
    WaterQuality wq
JOIN 
    WaterSource ws ON wq.WaterSourceID = ws.WaterSourceID
GROUP BY 
    ws.Location;

-- Number of health incidents by disease type
SELECT 
    DiseaseType,
    SUM(CasesReported) AS TotalCases
FROM 
    HealthIncident
GROUP BY 
    DiseaseType;

-- Health incidents by region
SELECT 
    r.Name AS RegionName,
    SUM(hi.CasesReported) AS TotalCasesReported
FROM 
    HealthIncident hi
JOIN 
    Region r ON hi.RegionID = r.RegionID
GROUP BY 
    r.Name;

-- Water sources by Type and Region
SELECT 
    r.Name AS RegionName,
    ws.Type AS WaterSourceType,
    COUNT(*) AS NumberOfSources
FROM 
    WaterSource ws
JOIN 
    Region r ON ws.RegionID = r.RegionID
GROUP BY 
    r.Name, ws.Type;

-- Average capacity of infrastructure by Facility Type
SELECT 
    FacilityType,
    AVG(Capacity) AS AvgCapacity
FROM 
    Infrastructure
GROUP BY 
    FacilityType;
-- Distribution of  Health incidents by Date
SELECT 
    Date,
    SUM(CasesReported) AS TotalCasesReported
FROM 
    HealthIncident
GROUP BY 
    Date
ORDER BY 
    Date;

-- Water quality Data Distribution by Region
SELECT 
    r.Name AS RegionName,
    AVG(wq.ContaminationLevel) AS AvgContaminationLevel
FROM 
    WaterQuality wq
JOIN 
    WaterSource ws ON wq.WaterSourceID = ws.WaterSourceID
JOIN 
    Region r ON ws.RegionID = r.RegionID
GROUP BY 
    r.Name;

-- Total Capacity of infrastructure  by Region
SELECT 
    r.Name AS RegionName,
    SUM(i.Capacity) AS TotalCapacity
FROM 
    Infrastructure i
JOIN 
    WaterSource ws ON i.WaterSourceID = ws.WaterSourceID
JOIN 
    Region r ON ws.RegionID = r.RegionID
GROUP BY 
    r.Name;

