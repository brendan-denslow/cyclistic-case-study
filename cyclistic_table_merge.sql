-- Combine all tables into a single table
CREATE TABLE
  `cyclistic_bike_data.2023_07-2024_06_trips_raw`
AS
SELECT *
FROM (
  SELECT *
  FROM `cyclistic_bike_data.2023_07_trips_raw`
  UNION ALL
  SELECT *
  FROM `cyclistic_bike_data.2023_08_trips_raw`
  UNION ALL
  SELECT *
  FROM `cyclistic_bike_data.2023_09_trips_raw`
  UNION ALL
  SELECT *
  FROM `cyclistic_bike_data.2023_10_trips_raw`
  UNION ALL
  SELECT *
  FROM `cyclistic_bike_data.2023_11_trips_raw`
  UNION ALL
  SELECT *
  FROM `cyclistic_bike_data.2023_12_trips_raw`
  UNION ALL
  SELECT *
  FROM `cyclistic_bike_data.2024_01_trips_raw`
  UNION ALL
  SELECT *
  FROM `cyclistic_bike_data.2024_02_trips_raw`
  UNION ALL
  SELECT *
  FROM `cyclistic_bike_data.2024_03_trips_raw`
  UNION ALL
  SELECT *
  FROM `cyclistic_bike_data.2024_04_trips_raw`
  UNION ALL
  SELECT *
  FROM `cyclistic_bike_data.2024_05_trips_raw`
  UNION ALL
  SELECT *
  FROM `cyclistic_bike_data.2024_06_trips_raw`
);