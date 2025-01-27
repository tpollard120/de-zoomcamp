-- Question 3
SELECT COUNT(*)
FROM green_taxi_data
WHERE CAST(TO_CHAR(lpep_pickup_datetime, 'YYYYMMDD') as int) BETWEEN 20191001 AND 20191031
AND trip_distance <= 1.0

SELECT COUNT(*)
FROM green_taxi_data
WHERE CAST(TO_CHAR(lpep_pickup_datetime, 'YYYYMMDD') as int) BETWEEN 20191001 AND 20191031
AND trip_distance > 1.0 AND trip_distance <= 3.0

SELECT COUNT(*)
FROM green_taxi_data
WHERE CAST(TO_CHAR(lpep_pickup_datetime, 'YYYYMMDD') as int) BETWEEN 20191001 AND 20191031
AND trip_distance > 3.0 AND trip_distance <= 7.0

SELECT COUNT(*)
FROM green_taxi_data
WHERE CAST(TO_CHAR(lpep_pickup_datetime, 'YYYYMMDD') as int) BETWEEN 20191001 AND 20191031
AND trip_distance > 7.0 AND trip_distance <= 10.0

SELECT COUNT(*)
FROM green_taxi_data
WHERE CAST(TO_CHAR(lpep_pickup_datetime, 'YYYYMMDD') as int) BETWEEN 20191001 AND 20191031
AND trip_distance > 10.0

-- Question 4
SELECT TO_CHAR(lpep_pickup_datetime, 'YYYYMMDD'), MAX(trip_distance) as distance
FROM green_taxi_data
GROUP BY TO_CHAR(lpep_pickup_datetime, 'YYYYMMDD')
ORDER BY distance DESC


-- Question 5
SELECT "Zone", SUM(total_amount) as sum_amount FROM green_Taxi_data GTD
INNER JOIN taxi_zones TZ
ON GTD."PULocationID" = TZ."LocationID"
WHERE TO_CHAR(lpep_pickup_datetime, 'YYYYMMDD') = '20191018'
GROUP BY "Zone"
ORDER BY sum_amount DESC
LIMIT 3

-- Question 6
SELECT "DOLocationID", TZ2."Zone", * FROM green_Taxi_data GTD
INNER JOIN taxi_zones TZ
ON GTD."PULocationID" = TZ."LocationID"
INNER JOIN taxi_zones TZ2
ON GTD."DOLocationID" = TZ2."LocationID"
WHERE CAST(TO_CHAR(lpep_pickup_datetime, 'YYYYMMDD') as int) BETWEEN 20191001 AND 20191031
AND TZ."Zone" = 'East Harlem North'
ORDER BY GTD.tip_amount DESC