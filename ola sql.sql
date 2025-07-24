create database ola;
use ola;

#Retrieve all successful bookings:
create View Successful_bookings As
select * from  bookings 
where booking_status="success"
select * from Successful_bookings;

 #. Find the average ride distance for each vehicle type:
 create View ride_distance_for_each_vehicle_type As
 select vehicle_type, AVG(ride_distance) as average_distance from 
 bookings GROUP BY vehicle_type
  #. Find the average ride distance for each vehicle type:
 select * from ride_distance_for_each_vehicle_type;
 
#. Get the total number of cancelled rides by customers:
create View number_of_cancelled_rides As
select count(*) from bookings where booking_status="canceled by customer";
 #. Get the total number of cancelled rides by customers:
 select * from number_of_cancelled_rides;
 
 #List the top 5 customers who booked the highest number of rides:
 create view top_5_customers AS
 select customer_id,COUNT(booking_id) as total_rides from bookings
 group by customer_id order by total_rides DESC limit 5;
 #List the top 5 customers who booked the highest number of rides:
 SELECT * FROM top_5_customers

 #. Get the number of rides cancelled by drivers due to personal and car-relatedissues:
 create View canceled_by_drivers As
 select count(*) from bookings where canceled_rides_by_driver="Personal & Car related issue";
 select * from canceled_by_drivers;
 
 #. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 create View max_min_driver_rating As 
 select MAX(driver_ratings) as max_rating , MIN(driver_ratings) as min_rating
 from bookings where vehicle_type='prime sedan';
  select * from max_min_driver_rating ; 

 #. Retrieve all rides where payment was made using UPI:
 create View payment_made_upi As
 select * from bookings where payment_method="UPI";
 select * from payment_made_upi;
 
 #. Find the average customer rating per vehicle type:
 create View avg_customer_ratings As
 select vehicle_type,AVG(customer_rating) from bookings group by vehicle_type;
 select * from avg_customer_ratings;
 
 #. Calculate the total booking value of rides completed successfully:
 create View booking_successfull As 
 select SUM(booking_value) As booking_value from bookings
 where booking_status="Success";
 select * from booking_successfull;
 
 #. List all incomplete rides along with the reason:
 create View incomplete_rides As
 select booking_id,incomplete_rides_reason from bookings 
 where incomplete_rides="Yes";
 select * from incomplete_rides;