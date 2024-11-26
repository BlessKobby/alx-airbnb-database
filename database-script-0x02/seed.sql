--Insert Sample Data: User Table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
('1e94ec0e-5b71-4b90-8a22-4f4e3b5d4a17', 'Alice', 'Johnson', 'alice@example.com', 'hashedpassword1', '1234567890', 'host', DEFAULT),
('2a8e4a6d-3cb6-4533-829f-0913de3482c6', 'Bob', 'Smith', 'bob@example.com', 'hashedpassword2', '0987654321', 'guest', DEFAULT),
('3cfc9e6b-6b4a-4d4d-91ab-3f8bbde1c1af', 'Charlie', 'Davis', 'charlie@example.com', 'hashedpassword3', '1122334455', 'admin', DEFAULT);

--Insert Sample Data: Property Table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
('5e76d2e4-1b5b-4a75-a6c2-2b3b6328c78a', '1e94ec0e-5b71-4b90-8a22-4f4e3b5d4a17', 'Cozy Apartment', 'A lovely 2-bedroom apartment in the city center.', 'New York, NY', 120.00, DEFAULT, DEFAULT),
('9f00d8c8-7e9b-44d9-a5fc-1f24445d2f4a', '1e94ec0e-5b71-4b90-8a22-4f4e3b5d4a17', 'Beachside Villa', 'A luxurious villa with ocean views.', 'Miami, FL', 350.00, DEFAULT, DEFAULT);

--Insert Sample Data: Booking Table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
('8a86d49e-f967-4c55-a93d-7d9fc0be3dfc', '5e76d2e4-1b5b-4a75-a6c2-2b3b6328c78a', '2a8e4a6d-3cb6-4533-829f-0913de3482c6', '2024-12-01', '2024-12-05', 480.00, 'confirmed', DEFAULT),
('bf25d743-37fc-4db8-84d5-f5cd6e0dd3e6', '9f00d8c8-7e9b-44d9-a5fc-1f24445d2f4a', '2a8e4a6d-3cb6-4533-829f-0913de3482c6', '2025-01-10', '2025-01-15', 1750.00, 'pending', DEFAULT);

--Insert Sample Data: Payment Table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
('9d24f6f5-21b1-4771-9ad5-4a9b0938c927', '8a86d49e-f967-4c55-a93d-7d9fc0be3dfc', 480.00, '2024-11-25', 'credit_card'),
('7b8a2e62-0c36-4b0e-80a5-f6f4c6b2a7a2', 'bf25d743-37fc-4db8-84d5-f5cd6e0dd3e6', 1750.00, '2024-11-30', 'paypal');

--Insert Sample Data: Review Table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
('5d4e9f0d-8343-4e27-badc-2a2cb5587bcb', '5e76d2e4-1b5b-4a75-a6c2-2b3b6328c78a', '2a8e4a6d-3cb6-4533-829f-0913de3482c6', 5, 'Fantastic apartment, very clean and central location!', DEFAULT),
('8f36c0d7-99f4-4a6e-95fc-6f04bd8b8dd1', '9f00d8c8-7e9b-44d9-a5fc-1f24445d2f4a', '2a8e4a6d-3cb6-4533-829f-0913de3482c6', 4, 'Beautiful villa, but a bit pricey.', DEFAULT);

--Insert Sample Data: Message Table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
('c5f94f8e-9381-4b3a-b98e-2cbb6eab5c12', '2a8e4a6d-3cb6-4533-829f-0913de3482c6', '1e94ec0e-5b71-4b90-8a22-4f4e3b5d4a17', 'Hi Alice, is the apartment available for next week?', DEFAULT),
('d4bfc6e2-5a9f-4e89-84f1-d8a4d1e4fb5e', '1e94ec0e-5b71-4b90-8a22-4f4e3b5d4a17', '2a8e4a6d-3cb6-4533-829f-0913de3482c6', 'Yes, it is available. Let me know if you need help booking!', DEFAULT);

