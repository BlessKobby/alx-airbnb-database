erDiagram
    User {
        UUID user_id PK "Primary Key"
        VARCHAR first_name "NOT NULL"
        VARCHAR last_name "NOT NULL"
        VARCHAR email "UNIQUE, NOT NULL"
        VARCHAR password_hash "NOT NULL"
        VARCHAR phone_number "NULL"
        ENUM role "ENUM('guest', 'host', 'admin'), NOT NULL"
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
    }
    Property {
        UUID property_id PK "Primary Key"
        UUID host_id FK "Foreign Key references User(user_id)"
        VARCHAR name "NOT NULL"
        TEXT description "NOT NULL"
        VARCHAR location "NOT NULL"
        DECIMAL pricepernight "NOT NULL"
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
        TIMESTAMP updated_at "ON UPDATE CURRENT_TIMESTAMP"
    }
    Booking {
        UUID booking_id PK "Primary Key"
        UUID property_id FK "Foreign Key references Property(property_id)"
        UUID user_id FK "Foreign Key references User(user_id)"
        DATE start_date "NOT NULL"
        DATE end_date "NOT NULL"
        DECIMAL total_price "NOT NULL"
        ENUM status "ENUM('pending', 'confirmed', 'canceled'), NOT NULL"
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
    }
    Payment {
        UUID payment_id PK "Primary Key"
        UUID booking_id FK "Foreign Key references Booking(booking_id)"
        DECIMAL amount "NOT NULL"
        TIMESTAMP payment_date "DEFAULT CURRENT_TIMESTAMP"
        ENUM payment_method "ENUM('credit_card', 'paypal', 'stripe'), NOT NULL"
    }
    Review {
        UUID review_id PK "Primary Key"
        UUID property_id FK "Foreign Key references Property(property_id)"
        UUID user_id FK "Foreign Key references User(user_id)"
        INTEGER rating "CHECK rating >= 1 AND rating <= 5, NOT NULL"
        TEXT comment "NOT NULL"
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
    }
    Message {
        UUID message_id PK "Primary Key"
        UUID sender_id FK "Foreign Key references User(user_id)"
        UUID recipient_id FK "Foreign Key references User(user_id)"
        TEXT message_body "NOT NULL"
        TIMESTAMP sent_at "DEFAULT CURRENT_TIMESTAMP"
    }

    %% Relationships
    User ||--o{ Property : "hosts"
    User ||--o{ Booking : "makes"
    Property ||--o{ Booking : "booked for"
    Booking ||--o{ Payment : "has"
    User ||--o{ Review : "writes"
    Property ||--o{ Review : "receives"
    User ||--o{ Message : "sends/receives"
