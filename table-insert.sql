INSERT INTO customers (id, name, shipaddress, phonenum, email)
VALUES
	(2, 'Priya Shah', '42 River Road', 5550102000, 'priya.shah@example.com'),
	(3, 'Mateo Garcia', '789 Pine Lane', 5550103000, 'mateo.garcia@example.com'),
	(4, 'Jordan Williams', '16 Harbor Boulevard', 5550104000, 'jordan.williams@example.com');
INSERT INTO credit_cards (cardnum, holderid, cardaddress, expdate)
VALUES
	(5555555555554444, 2, '42 River Road', '2027-06-30'),
	(378282246310005, 3, '789 Pine Lane', '2029-03-31'),
    (6011000990139424, 4, '16 Harbor Boulevard', '2030-08-31');
INSERT INTO product (id, name, price, category, invcount)
VALUES
	(2, 'Stainless Water Bottle', 18, 'Home and Outdoor', 35),
	(3, 'Noise-Canceling Headphones', 120, 'Audio', 20),
    (4, 'Ceramic Coffee Mug', 14, 'Kitchen', 80);
INSERT INTO staff (id, name, department, homeaddress, shiftstart, shiftend, position)
VALUES
	(2, 'Morgan Chen', 'Customer Service', '15 Maple Court', '2026-07-31 08:00:00', '2026-07-31 16:00:00', 'Supervisor'),
	(3, 'Riley Thompson', 'Inventory', '88 Cedar Drive', '2026-07-31 12:00:00', '2026-07-31 20:00:00', 'Inventory Specialist'),
    (4, 'Taylor Brooks', 'Sales', '310 Birch Street', '2026-07-31 10:00:00', '2026-07-31 18:00:00', 'Sales Representative');
INSERT INTO purchase (purchasenum, customerid, buytime)
VALUES
	(2, 2, '2026-07-31 13:15:00'),
	(3, 3, '2026-07-31 18:45:00'),
    (4, 4, '2026-07-31 15:20:00');
INSERT INTO purchaseproducts (purchasenum, productid, purchasecount)
VALUES
	(2, 2, 1),
	(3, 3, 1),
    (4, 4, 3);