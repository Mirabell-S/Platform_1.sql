-- Our revenue is generated from booked services by the users. However, some users prefer to use direct service (without booking). 

SELECT 
  u.user_id, u.country_code
  ,SUM(p.payment_amount) AS total_payment_amount
FROM `platformbooking.booking.users` u
LEFT JOIN `platformbooking.booking.bookings`b ON u.user_id = b.user_id
INNER JOIN `platformbooking.booking.payments`p ON u.user_id = p.user_id
  WHERE b.user_id IS NULL
  GROUP BY u.user_id, u.country_code;

