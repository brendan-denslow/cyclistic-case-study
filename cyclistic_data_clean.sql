-- Add calculated fields and sort raw data by ride date-time
SELECT *,
  IF(started_at < ended_at, 
       TIMESTAMP_DIFF(ended_at, started_at, SECOND), 
       TIMESTAMP_DIFF(started_at, ended_at, SECOND)) 
    AS ride_length,
  FORMAT_DATE('%H', started_at) AS ride_hour,
  FORMAT_DATE('%A', started_at) AS day_of_week,
  CONCAT(FORMAT_DATE('%b', started_at), " ", FORMAT_DATE('%G', started_at)) AS month,
  CASE
    WHEN start_lat IS NOT NULL
    AND start_lng IS NOT NULL
    AND end_lat IS NOT NULL
    AND end_lng IS NOT NULL
    THEN ST_DISTANCE(ST_GEOGPOINT(start_lng, start_lat), ST_GEOGPOINT(end_lng, end_lat)) / 1609.34 
    ELSE NULL
  END AS station_distance
  -- Calculates the distance between the start station and the end station in a straight line in miles
FROM `cyclistic_bike_data.2023_07-2024_06_trips_raw`
ORDER BY
  started_at

  
