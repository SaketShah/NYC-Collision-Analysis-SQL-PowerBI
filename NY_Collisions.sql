-- Veiwing the tavle we are gonna work withg
SELECT * FROM dbo.Motor_Vehicle_Collisions

-- Standardising the Vehicle-codes
SELECT VEHICLE_TYPE_CODE_1,COUNT(VEHICLE_TYPE_CODE_1) FROM dbo.Motor_Vehicle_Collisions
GROUP BY VEHICLE_TYPE_CODE_1


-- For Vehicle_no_1
-- Adding new column for standardised vehicles
ALTER TABLE dbo.Motor_Vehicle_Collisions
ADD Vehicle_1_type VARCHAR(50);

-- Updating the data in the table
UPDATE dbo.Motor_Vehicle_Collisions
SET Vehicle_1_type = CASE 
    -- 1. EMERGENCY
    WHEN LOWER(VEHICLE_TYPE_CODE_1) LIKE '%amb%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%fire%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%ems%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%police%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%nypd%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%fdny%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%rescu%' THEN 'Emergency'

    -- 2. BUSES
    WHEN LOWER(VEHICLE_TYPE_CODE_1) LIKE '%bus%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%omni%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%transit%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%charter%' THEN 'Bus'

    -- 3. MICROMOBILITY (Bikes/Scooters)
    WHEN LOWER(VEHICLE_TYPE_CODE_1) LIKE '%scoot%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%bike%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%moped%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%motorcy%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%cycl%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%vespa%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%e-b%' THEN 'Micromobility'

    -- 4. CONSTRUCTION & UTILITY
    WHEN LOWER(VEHICLE_TYPE_CODE_1) LIKE '%bobcat%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%excav%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%fork%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%sweep%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%plow%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%loader%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%dirt%' THEN 'Construction/Utility'

    -- 5. PICKUP TRUCKS
    WHEN LOWER(VEHICLE_TYPE_CODE_1) LIKE '%pick%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%f150%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%silverado%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%ram%' THEN 'Pickup Truck'

    -- 6. COMMERCIAL TRUCKS
    WHEN LOWER(VEHICLE_TYPE_CODE_1) LIKE '%truck%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%box%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%deliv%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%tractor%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%tank%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%usps%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%fedex%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%ups%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%flat%' THEN 'Commercial Truck'

    -- 7. VANS
    WHEN LOWER(VEHICLE_TYPE_CODE_1) LIKE '%van%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%sprinter%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%econoline%' THEN 'Van'

    -- 8. SUVS
    WHEN LOWER(VEHICLE_TYPE_CODE_1) LIKE '%suv%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%sport%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%subur%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%jeep%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%wagon%' THEN 'SUV'

    -- 9. PASSENGER CARS
    WHEN LOWER(VEHICLE_TYPE_CODE_1) LIKE '%sedan%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%coupe%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%4dr%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%convert%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%taxi%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%limo%' 
      OR LOWER(VEHICLE_TYPE_CODE_1) LIKE '%pass%' THEN 'Passenger Car'

    -- 10. OTHER/UNKNOWN
    ELSE 'Other/Unknown'
END;

 --For vehicle_no_2
ALTER TABLE dbo.Motor_Vehicle_Collisions
ADD Vehicle_2_type VARCHAR(50);

UPDATE dbo.Motor_Vehicle_Collisions
SET Vehicle_2_type = CASE 
    -- 1. EMERGENCY
    WHEN LOWER(VEHICLE_TYPE_CODE_2) LIKE '%amb%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%fire%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%ems%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%police%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%nypd%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%fdny%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%rescu%' THEN 'Emergency'

    -- 2. BUSES
    WHEN LOWER(VEHICLE_TYPE_CODE_2) LIKE '%bus%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%omni%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%transit%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%charter%' THEN 'Bus'

    -- 3. MICROMOBILITY (Bikes/Scooters)
    WHEN LOWER(VEHICLE_TYPE_CODE_2) LIKE '%scoot%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%bike%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%moped%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%motorcy%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%cycl%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%vespa%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%e-b%' THEN 'Micromobility'

    -- 4. CONSTRUCTION & UTILITY
    WHEN LOWER(VEHICLE_TYPE_CODE_2) LIKE '%bobcat%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%excav%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%fork%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%sweep%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%plow%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%loader%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%dirt%' THEN 'Construction/Utility'

    -- 5. PICKUP TRUCKS
    WHEN LOWER(VEHICLE_TYPE_CODE_2) LIKE '%pick%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%f150%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%silverado%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%ram%' THEN 'Pickup Truck'

    -- 6. COMMERCIAL TRUCKS
    WHEN LOWER(VEHICLE_TYPE_CODE_2) LIKE '%truck%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%box%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%deliv%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%tractor%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%tank%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%usps%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%fedex%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%ups%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%flat%' THEN 'Commercial Truck'

    -- 7. VANS
    WHEN LOWER(VEHICLE_TYPE_CODE_2) LIKE '%van%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%sprinter%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%econoline%' THEN 'Van'

    -- 8. SUVS
    WHEN LOWER(VEHICLE_TYPE_CODE_2) LIKE '%suv%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%sport%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%subur%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%jeep%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%wagon%' THEN 'SUV'

    -- 9. PASSENGER CARS
    WHEN LOWER(VEHICLE_TYPE_CODE_2) LIKE '%sedan%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%coupe%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%4dr%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%convert%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%taxi%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%limo%' 
      OR LOWER(VEHICLE_TYPE_CODE_2) LIKE '%pass%' THEN 'Passenger Car'

    -- 10. OTHER/UNKNOWN
    ELSE 'Other/Unknown'
END;

SELECT * FROM dbo.Motor_Vehicle_Collisions

-- Dropping Unstandardised columns
ALTER TABLE dbo.Motor_Vehicle_Collisions
DROP COLUMN [VEHICLE_TYPE_CODE_1],[VEHICLE_TYPE_CODE_2],[VEHICLE_STD];

-- Standardising Contributing Factors
SELECT CONTRIBUTING_FACTOR_VEHICLE_1,COUNT(CONTRIBUTING_FACTOR_VEHICLE_1) FROM DBO.Motor_Vehicle_Collisions
GROUP BY CONTRIBUTING_FACTOR_VEHICLE_1;

-- Add the new grouping column
ALTER TABLE DBO.Motor_Vehicle_Collisions
ADD [FACTOR_GROUP] VARCHAR(100);

-- Update the new column with the 5 main categories
UPDATE DBO.Motor_Vehicle_Collisions
SET [FACTOR_GROUP] = CASE 
    -- 1. DISTRACTION
    WHEN [CONTRIBUTING_FACTOR_VEHICLE_1] IN (
        'Driver Inattention/Distraction', 'Texting', 'Cell Phone (hand-Held)', 
        'Cell Phone (hands-free)', 'Eating or Drinking', 'Passenger Distraction', 
        'Outside Car Distraction', 'Using On Board Navigation Device', 
        'Other Electronic Device', 'Listening/Using Headphones'
    ) THEN 'Driver Distraction'

    -- 2. IMPAIRMENT & FATIGUE 
    WHEN [CONTRIBUTING_FACTOR_VEHICLE_1] IN (
        'Alcohol Involvement', 'Drugs (illegal)', 'Prescription Medication', 
        'Fatigued/Drowsy', 'Fell Asleep', 'Lost Consciousness', 
        'Illnes', 'Physical Disability'
    ) THEN 'Impairment/Fatigue'

    -- 3. DRIVER ERROR / AGGRESSION
    WHEN [CONTRIBUTING_FACTOR_VEHICLE_1] IN (
        'Unsafe Speed', 'Failure to Yield Right-of-Way', 'Following Too Closely', 
        'Passing or Lane Usage Improper', 'Passing Too Closely', 'Unsafe Lane Changing', 
        'Backing Unsafely', 'Traffic Control Disregarded', 'Driver Inexperience',
        'Aggressive Driving/Road Rage', 'Failure to Keep Right', 'Turning Improperly',
        'Reaction to Uninvolved Vehicle', 'Pedestrian/Bicyclist/Other Pedestrian Error/Confusion'
    ) THEN 'Driver Error'

    -- 4. VEHICLE DEFECTS
    WHEN [CONTRIBUTING_FACTOR_VEHICLE_1] IN (
        'Brakes Defective', 'Steering Failure', 'Tire Failure/Inadequate', 
        'Accelerator Defective', 'Headlights Defective', 'Tow Hitch Defective', 
        'Oversized Vehicle', 'Windshield Inadequate', 'Tinted Windows', 
        'Driverless/Runaway Vehicle', 'Other Vehicular'
    ) THEN 'Vehicle Defect'

    -- 5. ENVIRONMENT
    WHEN [CONTRIBUTING_FACTOR_VEHICLE_1] IN (
        'Pavement Slippery', 'Pavement Defective', 'Animals Action', 'Glare', 
        'View Obstructed/Limited', 'Lane Marking Improper/Inadequate', 
        'Obstruction/Debris', 'Traffic Control Device Improper/Non-Working',
        'Shoulders Defective/Improper', 'Other Lighting Defects'
    ) THEN 'Environment'

    -- 6. UNSPECIFIED / OTHER
    ELSE 'Unspecified/Other'
END;

SELECT [FACTOR_GROUP],[CONTRIBUTING_FACTOR_VEHICLE_1] FROM DBO.Motor_Vehicle_Collisions

ALTER TABLE DBO.Motor_Vehicle_Collisions
ADD [FACTOR_GROUP_2] VARCHAR(100);

UPDATE DBO.Motor_Vehicle_Collisions
SET [FACTOR_GROUP_2] = CASE 
    -- 1. DISTRACTION
    WHEN [CONTRIBUTING_FACTOR_VEHICLE_2] IN (
        'Driver Inattention/Distraction', 'Texting', 'Cell Phone (hand-Held)', 
        'Cell Phone (hands-free)', 'Eating or Drinking', 'Passenger Distraction', 
        'Outside Car Distraction', 'Using On Board Navigation Device', 
        'Other Electronic Device', 'Listening/Using Headphones'
    ) THEN 'Driver Distraction'

    -- 2. IMPAIRMENT & FATIGUE 
    WHEN [CONTRIBUTING_FACTOR_VEHICLE_2] IN (
        'Alcohol Involvement', 'Drugs (illegal)', 'Prescription Medication', 
        'Fatigued/Drowsy', 'Fell Asleep', 'Lost Consciousness', 
        'Illnes', 'Physical Disability'
    ) THEN 'Impairment/Fatigue'

    -- 3. DRIVER ERROR / AGGRESSION
    WHEN [CONTRIBUTING_FACTOR_VEHICLE_2] IN (
        'Unsafe Speed', 'Failure to Yield Right-of-Way', 'Following Too Closely', 
        'Passing or Lane Usage Improper', 'Passing Too Closely', 'Unsafe Lane Changing', 
        'Backing Unsafely', 'Traffic Control Disregarded', 'Driver Inexperience',
        'Aggressive Driving/Road Rage', 'Failure to Keep Right', 'Turning Improperly',
        'Reaction to Uninvolved Vehicle', 'Pedestrian/Bicyclist/Other Pedestrian Error/Confusion'
    ) THEN 'Driver Error'

    -- 4. VEHICLE DEFECTS
    WHEN [CONTRIBUTING_FACTOR_VEHICLE_2] IN (
        'Brakes Defective', 'Steering Failure', 'Tire Failure/Inadequate', 
        'Accelerator Defective', 'Headlights Defective', 'Tow Hitch Defective', 
        'Oversized Vehicle', 'Windshield Inadequate', 'Tinted Windows', 
        'Driverless/Runaway Vehicle', 'Other Vehicular'
    ) THEN 'Vehicle Defect'

    -- 5. ENVIRONMENT
    WHEN [CONTRIBUTING_FACTOR_VEHICLE_2] IN (
        'Pavement Slippery', 'Pavement Defective', 'Animals Action', 'Glare', 
        'View Obstructed/Limited', 'Lane Marking Improper/Inadequate', 
        'Obstruction/Debris', 'Traffic Control Device Improper/Non-Working',
        'Shoulders Defective/Improper', 'Other Lighting Defects'
    ) THEN 'Environment'

    -- 6. UNSPECIFIED / OTHER
    ELSE 'Unspecified/Other'
END;

SELECT * FROM DBO.Motor_Vehicle_Collisions

-- Seperating month and year
ALTER TABLE [DBO].[Motor_Vehicle_Collisions]
ADD [CRASH_MONTH_NUM] INT,          
    [CRASH_MONTH_NAME] VARCHAR(15); 

UPDATE [DBO].[Motor_Vehicle_Collisions]
SET 
    [CRASH_MONTH_NUM] = MONTH([CRASH_DATE]),
    [CRASH_MONTH_NAME] = DATENAME(MONTH, [CRASH_DATE]);

ALTER TABLE [DBO].[Motor_Vehicle_Collisions]
ADD [CRASH_YEAR] INT;

UPDATE [DBO].[Motor_Vehicle_Collisions]
SET [CRASH_YEAR] = YEAR([CRASH_DATE]);

-- Data Analysis 

-- Total crashes per year
SELECT CRASH_YEAR,COUNT(CRASH_YEAR) AS TOTAL_CRASHES
FROM DBO.[Motor_Vehicle_Collisions]
GROUP BY [CRASH_YEAR] 
ORDER BY [CRASH_YEAR]

-- Total crashes by borough
SELECT BOROUGH,COUNT(BOROUGH) AS TOTAL_CRASHES
FROM DBO.[Motor_Vehicle_Collisions]
WHERE [BOROUGH] IS NOT NULL
GROUP BY [BOROUGH] 
ORDER BY TOTAL_CRASHES DESC

-- Top streets or intesections
SELECT TOP 10 [ON_STREET_NAME],COUNT(*) AS TOTAL_CRASHES
FROM DBO.Motor_Vehicle_Collisions
WHERE [ON_STREET_NAME] IS NOT NULL
GROUP BY [ON_STREET_NAME]
ORDER BY TOTAL_CRASHES DESC

-- TOP CAUSES OF CRASHES
SELECT 
    Combined_Factor, 
    COUNT(*) AS Total_Occurrences
FROM (
    -- Get all the factors from Column 1
    SELECT FACTOR_GROUP AS Combined_Factor 
    FROM DBO.Motor_Vehicle_Collisions
    WHERE FACTOR_GROUP IS NOT NULL

    UNION ALL

    -- Get all the factors from Column 2 (Stack them underneath)
    SELECT FACTOR_GROUP_2 AS Combined_Factor 
    FROM DBO.Motor_Vehicle_Collisions
    WHERE FACTOR_GROUP_2 IS NOT NULL
) AS Unpivoted_Data
WHERE Combined_Factor != 'Unspecified/Other'
GROUP BY Combined_Factor
ORDER BY Total_Occurrences DESC;

-- Factors as per boroughs

SELECT 
    BOROUGH,Combined_Factor,COUNT(*) AS Total_Occurrences
FROM (
    SELECT BOROUGH,FACTOR_GROUP AS Combined_Factor 
    FROM DBO.Motor_Vehicle_Collisions
    WHERE FACTOR_GROUP IS NOT NULL
    AND BOROUGH IS NOT NULL

UNION ALL

    SELECT BOROUGH,FACTOR_GROUP_2 AS Combined_Factor 
    FROM DBO.Motor_Vehicle_Collisions
    WHERE FACTOR_GROUP IS NOT NULL
    AND BOROUGH IS NOT NULL

) AS UNPIVOTED_DATA
WHERE Combined_Factor != 'Unspecified/Other'
GROUP BY Combined_Factor, BOROUGH
ORDER BY BOROUGH,Total_Occurrences DESC

-- Number of people injured and killed by borough
SELECT BOROUGH,COUNT(NUMBER_OF_PERSONS_INJURED) AS People_Injured,COUNT(NUMBER_OF_PERSONS_KILLED) AS People_killed
FROM DBO.Motor_Vehicle_Collisions
WHERE BOROUGH IS NOT NULL
GROUP BY BOROUGH
ORDER BY People_Injured

-- Comparision between groups
SELECT BOROUGH,SUM(NUMBER_OF_PERSONS_INJURED) AS People_Injured,SUM(NUMBER_OF_PERSONS_KILLED) AS People_killed,
SUM(NUMBER_OF_PEDESTRIANS_INJURED) AS Pedestrians_Injured,SUM(NUMBER_OF_PEDESTRIANS_KILLED) AS Pedestrians_killed,
SUM(NUMBER_OF_CYCLIST_INJURED) AS Cyclist_Injured,SUM(NUMBER_OF_CYCLIST_KILLED) AS Cyclist_killed,
SUM(NUMBER_OF_MOTORIST_INJURED) AS Motorist_Injured,SUM(NUMBER_OF_MOTORIST_KILLED) AS Motorist_killed
FROM DBO.Motor_Vehicle_Collisions
WHERE BOROUGH IS NOT NULL
GROUP BY BOROUGH
ORDER BY BOROUGH

-- Types of vehicles involved in the crashes
SELECT Vehicle_type,COUNT(*) AS Total_Ocurrences 
FROM (
    SELECT Vehicle_1_type AS Vehicle_type
    FROM dbo.Motor_Vehicle_Collisions

    UNION ALL

    SELECT Vehicle_2_type AS Vehicle_type
    FROM dbo.Motor_Vehicle_Collisions

) AS Unpivoted_Data
GROUP BY Vehicle_type
ORDER BY Total_Ocurrences DESC

--SAFETY IN CERIAN VEHICLES
SELECT 
    Vehicle_type,
    COUNT(*) AS Total_Crashes_Involved,
    SUM(People_Injured) AS Total_Injured,
    
    -- The Safety Score (Percentage of crashes involving injury)
    (SUM(People_Injured) * 1.0 / COUNT(*)) AS Avg_Injuries_Per_Crash,

    --Percentage of crashes where AT LEAST 1 person was hurt
    (SUM(CASE WHEN People_Injured > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS Injury_Risk_Percentage

FROM (

    SELECT 
        Vehicle_1_type AS Vehicle_type,
        NUMBER_OF_PERSONS_INJURED AS People_Injured
    FROM dbo.Motor_Vehicle_Collisions
    WHERE Vehicle_1_type IS NOT NULL

    UNION ALL

    SELECT 
        Vehicle_2_type AS Vehicle_type,
        NUMBER_OF_PERSONS_INJURED AS People_Injured
    FROM dbo.Motor_Vehicle_Collisions
    WHERE Vehicle_2_type IS NOT NULL
) AS Unpivoted_Data

GROUP BY Vehicle_type
HAVING COUNT(*) > 100 
ORDER BY Injury_Risk_Percentage DESC;

-- Normalising tables for PowerBI

--Master Table
SELECT 
    COLLISION_ID,
    CRASH_DATE,
    CRASH_TIME,
    CRASH_YEAR,
    CRASH_MONTH_NUM,
    CRASH_MONTH_NAME,
    BOROUGH,
    ZIP_CODE,
    LATITUDE,
    LONGITUDE,
    ON_STREET_NAME,
    NUMBER_OF_PERSONS_INJURED,
    NUMBER_OF_PERSONS_KILLED,
    NUMBER_OF_PEDESTRIANS_INJURED,
    NUMBER_OF_PEDESTRIANS_KILLED,
    NUMBER_OF_CYCLIST_INJURED,
    NUMBER_OF_CYCLIST_KILLED,
    NUMBER_OF_MOTORIST_INJURED,
    NUMBER_OF_MOTORIST_KILLED
INTO [DBO].[PB_Fact_Collisions]
FROM [DBO].[Motor_Vehicle_Collisions];

-- Vehicle data
SELECT COLLISION_ID, Vehicle_Type 
INTO [DBO].[PB_Dim_Vehicles]
FROM (
    -- Get Vehicle 1
    SELECT COLLISION_ID, Vehicle_1_type AS Vehicle_Type
    FROM [DBO].[Motor_Vehicle_Collisions]
    WHERE Vehicle_1_type IS NOT NULL

    UNION ALL

    -- Get Vehicle 2
    SELECT COLLISION_ID, Vehicle_2_type AS Vehicle_Type
    FROM [DBO].[Motor_Vehicle_Collisions]
    WHERE Vehicle_2_type IS NOT NULL
) AS Raw_Vehicles;

-- Factors Table
SELECT COLLISION_ID, Factor_Group
INTO [DBO].[PB_Dim_Factors]
FROM (
    -- Get Factor 1
    SELECT COLLISION_ID, FACTOR_GROUP AS Factor_Group
    FROM [DBO].[Motor_Vehicle_Collisions]
    WHERE FACTOR_GROUP IS NOT NULL

    UNION ALL

    -- Get Factor 2
    SELECT COLLISION_ID, FACTOR_GROUP_2 AS Factor_Group
    FROM [DBO].[Motor_Vehicle_Collisions]
    WHERE FACTOR_GROUP_2 IS NOT NULL
) AS Raw_Factors;
