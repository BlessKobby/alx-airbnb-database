1: Identify High-Usage Columns
Analyze the queries frequently run on your tables to determine columns that are commonly used in:

WHERE clauses (for filtering).
JOIN conditions (for relationships).
ORDER BY clauses (for sorting).
Example High-Usage Columns:

User Table: id (primary key), email (used for login queries).
Booking Table: user_id (foreign key), property_id (foreign key), date (used for sorting or filtering by date).
Property Table: id (primary key), location (used for filtering by location).


2: Write CREATE INDEX Commands (database_index.sql)
idx_user_email: Speeds up queries filtering by email in the users table (e.g., during login).
idx_booking_user_id: Speeds up joins or filtering by user_id in the bookings table.
idx_booking_property_id: Optimizes joins or filtering by property_id in the bookings table.
idx_booking_date: Improves performance for date-based filtering or sorting.
idx_property_location: Helps queries that filter properties by location.


3: Measure Query Performance
Use the EXPLAIN (MySQL/PostgreSQL) or EXPLAIN ANALYZE (PostgreSQL) command to measure query performance before and after adding indexes.
Code are in database_index.sql


4: Compare Query Plans
Before Adding Index:
The query plan will show a sequential scan (Seq Scan or Full Table Scan), meaning the database scans the entire table.
Command: Seq Scan on bookings  (cost=0.00..12345.00 rows=1000 width=20)

After Adding Index:
The query plan will indicate an index scan (Index Scan or Using Index), which significantly reduces query execution time.
Command: Index Scan using idx_booking_user_id on bookings  (cost=0.00..50.00 rows=1000 width=20)


5: Save Results
Document the results before and after indexing, including:

Query execution time.
Query plan analysis.
