CREATE DATABASE OLA;
USE OLA;

#1. Retrieve all successful bookings
CREATE VIEW SUCCESSFUL_BOOKING AS
SELECT * FROM BOOKINGS
WHERE BOOKING_STATUS = "SUCCESS";

SELECT * FROM SUCCESSFUL_BOOKING;

-------------------------------------------------------------------------------------
#2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT VEHICLE_TYPE, avg(RIDE_DISTANCE) AS AVG_DISTANCE 
FROM BOOKINGS
GROUP BY VEHICLE_TYPE;
 
SELECT * FROM ride_distance_for_each_vehicle;

--------------------------------------------------------------------------------------
#3. Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS BOOKING_CANCELLED_BY_CUSTOMER 
FROM BOOKINGS
WHERE BOOKING_STATUS = "CANCELED BY CUSTOMER";

SELECT * FROM cancelled_rides_by_customers;

--------------------------------------------------------------------------------------
#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW TOP_5_CUTSOMER AS
SELECT CUSTOMER_ID, COUNT(BOOKING_ID) AS TOTAL_RIDES 
FROM BOOKINGS
GROUP BY CUSTOMER_ID
ORDER BY TOTAL_RIDES DESC
LIMIT 5;

SELECT * FROM TOP_5_CUTSOMER;

--------------------------------------------------------------------------------------
#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW rides_cancelled_by_drivers AS
SELECT COUNT(*) AS CANCELED_RIDE_BY_DRIVER 
FROM BOOKINGS
WHERE CANCELED_RIDES_BY_DRIVER = "PERSONAL & CAR RELATED ISSUE";

SELECT * FROM rides_cancelled_by_drivers;

--------------------------------------------------------------------------------------
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW maximum_and_minimum_driver_ratings AS
SELECT MAX(DRIVER_RATINGS) AS MAX_RATING, 
MIN(DRIVER_RATINGS) AS MIN_RATING 
FROM BOOKINGS
WHERE VEHICLE_TYPE = "PRIME SEDAN";

SELECT * FROM maximum_and_minimum_driver_ratings;

--------------------------------------------------------------------------------------
#7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_PAYMENT AS 
SELECT * FROM BOOKINGS
WHERE PAYMENT_METHOD = "UPI";

SELECT * FROM UPI_PAYMENT;

-------------------------------------------------------------------------------------- 
#8. Find the average customer rating per vehicle type:
CREATE VIEW AVG_CUSTOMER_RATING AS
SELECT VEHICLE_TYPE,AVG(CUSTOMER_RATING) AS AVG_CUSTOMER_RATING 
FROM BOOKINGS
GROUP BY VEHICLE_TYPE;

SELECT * FROM AVG_CUSTOMER_RATING;

--------------------------------------------------------------------------------------
#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW TOTAL_SUCCESSFUL_RIDE_VALUE AS
SELECT SUM(BOOKING_VALUE) AS TOTAL_BOOKING_VALUE FROM BOOKINGS
WHERE BOOKING_STATUS = "SUCCESS";

SELECT * FROM TOTAL_SUCCESSFUL_RIDE_VALUE;

--------------------------------------------------------------------------------------
#10. List all incomplete rides along with the reason:
CREATE VIEW INCOMPLETE_RIDE_REASON AS 
SELECT BOOKING_ID,INCOMPLETE_RIDES_REASON
FROM BOOKINGS
WHERE INCOMPLETE_RIDES = "YES";

SELECT * FROM INCOMPLETE_RIDE_REASON;
