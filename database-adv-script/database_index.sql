--  CREATE INDEX Commands
-- User Table
CREATE INDEX idx_user_email ON users(email);

-- Booking Table
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_date ON bookings(date);

-- Property Table
CREATE INDEX idx_property_location ON properties(location);

-- Measure Query Performance
-- Query to fetch bookings for a specific user
EXPLAIN SELECT * 
FROM bookings 
WHERE user_id = 101;

-- Query to fetch properties filtered by location
EXPLAIN SELECT * 
FROM properties 
WHERE location = 'New York';


-- Post-optimisation performance measurement.
EXPLAIN SELECT 
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
    b.date >= '2023-01-01';
