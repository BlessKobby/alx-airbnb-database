-- Initial query.
SELECT 
    b.id AS booking_id,
    b.date AS booking_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location AS property_location,
    pm.id AS payment_id,
    pm.amount AS payment_amount,
    pm.status AS payment_status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pm ON b.id = pm.booking_id;


--Query performance analysis.
EXPLAIN SELECT 
    b.id AS booking_id,
    b.date AS booking_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location AS property_location,
    pm.id AS payment_id,
    pm.amount AS payment_amount,
    pm.status AS payment_status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pm ON b.id = pm.booking_id;


-- Optimized query
SELECT 
    b.id AS booking_id,
    b.date AS booking_date,
    u.name AS user_name,
    p.name AS property_name,
    pm.amount AS payment_amount,
    pm.status AS payment_status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pm ON b.id = pm.booking_id
WHERE 
    b.date >= '2023-01-01'; -- Example filter for recent bookings

-- Index suggestions
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_payment_booking_id ON payments(booking_id);
