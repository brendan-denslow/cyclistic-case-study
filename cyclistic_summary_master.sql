SELECT
  member_casual,
  day_of_week,
  month,
  ride_hour,
  AVG(ride_length) AS avg_ride_length,
  MAX(ride_length) AS max_ride_length,
  MIN(ride_length) AS min_ride_length,
  AVG(CASE WHEN station_distance <> 0 THEN station_distance ELSE NULL END) AS avg_station_distance,
  MAX(station_distance) AS max_station_distance,
  MIN(station_distance) AS min_station_distance,
  COUNT(ride_id) AS ride_count,
  COUNT(CASE WHEN start_station_id = end_station_id THEN 1 END) AS round_trip_count,
  COUNT(CASE WHEN start_station_id != end_station_id THEN 1 END) AS one_way_trip_count,
  COUNT(CASE WHEN start_station_id IS NULL OR end_station_id IS NULL THEN 1 END) AS unclassified_trip_count,
  -- Below SELECT statements are for debugging
  COUNT(CASE WHEN start_station_id = end_station_id THEN 1 END) 
  + COUNT(CASE WHEN start_station_id != end_station_id THEN 1 END) 
  + COUNT(CASE WHEN start_station_id IS NULL OR end_station_id IS NULL THEN 1 END) AS CHECK_ride_count,
  -- Sums round trips, one-way trips, and unclassified trips
  COUNT(CASE WHEN start_station_id = end_station_id THEN 1 END) 
  + COUNT(CASE WHEN start_station_id != end_station_id THEN 1 END) 
  + COUNT(CASE WHEN start_station_id IS NULL OR end_station_id IS NULL THEN 1 END) 
  = COUNT(ride_id) AS CHECK_ride_count_BOOL, 
  -- Checks if the sum of round trips, one-way trips, and unclassified trips are the same as total trips
  COUNT(CASE WHEN ride_length < 0 THEN 1 END) AS ERROR_ride_length
  -- Checks for negatives in ride length values
FROM `case-studies-428602.cyclistic_bike_data.2023_07-2024_06_trips_cleaned`
GROUP BY
  member_casual, day_of_week, ride_hour, month
ORDER BY
  CASE month
    WHEN 'Jul 2023' THEN 1
    WHEN 'Aug 2023' THEN 2
    WHEN 'Sep 2023' THEN 3
    WHEN 'Oct 2023' THEN 4
    WHEN 'Nov 2023' THEN 5
    WHEN 'Dec 2023' THEN 6
    WHEN 'Jan 2024' THEN 7
    WHEN 'Feb 2024' THEN 8
    WHEN 'Mar 2024' THEN 9
    WHEN 'Apr 2024' THEN 10
    WHEN 'May 2024' THEN 11
    WHEN 'Jun 2024' THEN 12
    ELSE 99
  END,
  -- Indexes months to order them chronologically
  CASE day_of_week
    WHEN 'Monday' THEN 1
    WHEN 'Tuesday' THEN 2
    WHEN 'Wednesday' THEN 3
    WHEN 'Thursday' THEN 4
    WHEN 'Friday' THEN 5
    WHEN 'Saturday' THEN 6
    WHEN 'Sunday' THEN 7
    ELSE 99
  END,
  -- Indexes weekdays to order them chronologically
  ride_hour,
  member_casual