-- Step 1: Create a new partitioned table
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    amount DECIMAL(10, 2),
    status VARCHAR(20)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions based on the start_date
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_default PARTITION OF bookings_partitioned
    DEFAULT;

-- Step 3: Transfer existing data into the partitioned table (optional)
INSERT INTO bookings_partitioned (id, user_id, property_id, start_date, end_date, amount, status)
SELECT id, user_id, property_id, start_date, end_date, amount, status
FROM bookings;

-- Step 4: Drop the old table (optional)
DROP TABLE bookings;


-- Test query performance
-- Before partitioning (on the original table)
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2023-05-01' AND '2023-05-31';

-- After partitioning (on the partitioned table)
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned WHERE start_date BETWEEN '2023-05-01' AND '2023-05-31';

