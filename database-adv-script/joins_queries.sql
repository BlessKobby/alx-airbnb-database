--INNER JOIN - Retrieve all bookings and the respective users who made those bookings.
SELECT 
    users.id AS user_id, 
    users.name AS user_name, 
    bookings.id AS booking_id, 
    bookings.date AS booking_date
FROM 
    users
INNER JOIN 
    bookings 
ON 
    users.id = bookings.user_id;

--LEFT JOIN - Retrieve all properties and their reviews, including properties with no reviews.
SELECT 
    properties.id AS property_id, 
    properties.name AS property_name, 
    reviews.id AS review_id, 
    reviews.rating AS review_rating
FROM 
    properties
LEFT JOIN 
    reviews 
ON 
    properties.id = reviews.property_id;

--FULL OUTER JOIN - Retrieve all users and all bookings, even if a user has no booking or a booking is not linked to a user.
SELECT 
    users.id AS user_id, 
    users.name AS user_name, 
    bookings.id AS booking_id, 
    bookings.date AS booking_date
FROM 
    users
FULL OUTER JOIN 
    bookings 
ON 
    users.id = bookings.user_id;
