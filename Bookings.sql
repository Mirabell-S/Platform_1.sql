-- Our revenue is generated from booked services by the users. However, some users prefer to use direct service (without booking). 

SELECT 
  u.user_id, u.country_code
  ,SUM(p.payment_amount) AS total_payment_amount
FROM `platformbooking.booking.users` u
LEFT JOIN `platformbooking.booking.bookings`b ON u.user_id = b.user_id
INNER JOIN `platformbooking.booking.payments`p ON u.user_id = p.user_id
  WHERE b.user_id IS NULL
  GROUP BY u.user_id, u.country_code;

-- The finance team would like to  know the total payments by each user who made payments but hasn't made any bookings.
SELECT 
   u.user_id
  ,COUNT(p.id) AS payment_count, 
   SUM(p.payment_amount) AS total_payment_amount
FROM `platformbooking.booking.users` u
LEFT JOIN `platformbooking.booking.payments`p ON u.user_id = p.user_id
GROUP BY u.user_id, u.country_code
HAVING payment_count >=1;

-- It would be nice to include where these users are located.
