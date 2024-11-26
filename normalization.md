Step 1: First Normal Form (1NF)
1NF Definition:

Ensure each column has atomic values (no multi-valued or composite attributes).
Ensure each row is unique (primary keys are defined).
In the provided schema, the design already satisfies 1NF:

All attributes are atomic.
Each table has a primary key to uniquely identify rows.
Step 2: Second Normal Form (2NF)
2NF Definition:

Achieve 1NF.
Remove partial dependencies (where non-key attributes depend on only part of a composite primary key).
Analysis:

No composite primary keys exist in the design.
All non-key attributes depend entirely on the primary key of their respective tables.
Since there are no partial dependencies, the design already satisfies 2NF.

Step 3: Third Normal Form (3NF)
3NF Definition:

Achieve 2NF.
Remove transitive dependencies (where non-key attributes depend on other non-key attributes instead of the primary key).
Analysis and Adjustments:
We need to check for transitive dependencies and decompose if necessary.

1. User Table:

Attributes (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) directly depend on user_id.
No transitive dependency exists.
Already in 3NF.

2. Property Table:

Attributes (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) depend on property_id.
host_id is a foreign key referencing user_id.
No transitive dependency exists.
Already in 3NF.

3. Booking Table:

Attributes (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) depend on booking_id.
Foreign keys (property_id, user_id) reference their respective tables.
No transitive dependency exists.
Already in 3NF.

4. Payment Table:

Attributes (payment_id, booking_id, amount, payment_date, payment_method) depend on payment_id.
booking_id is a foreign key referencing the Booking table.
No transitive dependency exists.
Already in 3NF.

5. Review Table:

Attributes (review_id, property_id, user_id, rating, comment, created_at) depend on review_id.
Foreign keys (property_id, user_id) reference their respective tables.
No transitive dependency exists.
Already in 3NF.

6. Message Table:

Attributes (message_id, sender_id, recipient_id, message_body, sent_at) depend on message_id.
Foreign keys (sender_id, recipient_id) reference the User table.
No transitive dependency exists.
Already in 3NF.

Result:
The given ERD is already in 3NF, as there are no partial or transitive dependencies.
No additional normalization is required.

Normalized Schema:
The schema remains as defined in the ERD, adhering to 1NF, 2NF, and 3NF.

