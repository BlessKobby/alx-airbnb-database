# Partitioning Report

## Objective
The goal was to optimize query performance on the `Booking` table, which contained a large number of rows, by partitioning it based on the `start_date` column.

## Implementation
- Created a new table `bookings_partitioned` partitioned by range on the `start_date` column.
- Defined partitions for 2023, 2024, and a default partition for other dates.
- Transferred existing data from the `Booking` table to the partitioned table.

## Performance Comparison

| Query                        | Original Table (ms) | Partitioned Table (ms) |
|------------------------------|---------------------|------------------------|
| Fetch May 2023 bookings      | [Time]              | [Time]                 |
| Fetch all 2023 bookings      | [Time]              | [Time]                 |

### Observations
- Queries on the partitioned table were significantly faster, especially for specific date ranges.
- The database avoided scanning irrelevant partitions, reducing the number of rows scanned.

## Recommendations
- Use partitioning for tables with high data volume and predictable query patterns.
- Monitor the growth of the data and create additional partitions as necessary.
