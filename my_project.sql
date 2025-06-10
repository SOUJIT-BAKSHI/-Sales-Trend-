show databases;
create database my_project;
use my_project;

show tables;
-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);

-- Create online_sales table
CREATE TABLE online_sales (
    sale_id INT PRIMARY KEY,
    order_id INT,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    product_name VARCHAR(100),
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
select * from orders;
select * from online_sales;
INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
(1, '2025-06-01', 250.00, 101),
(2, '2025-06-02', 150.00, 102),
(3, '2025-06-03', 100.00, 103),
(4, '2025-06-04', 300.00, 104),
(5, '2025-06-05', 200.00, 105),
(6, '2025-06-06', 175.00, 106),
(7, '2025-06-07', 220.00, 107),
(8, '2025-06-08', 125.00, 108),
(9, '2025-06-09', 180.00, 109),
(10, '2025-06-10', 275.00, 110),
(11, '2025-06-11', 130.00, 111),
(12, '2025-06-12', 145.00, 112),
(13, '2025-06-13', 290.00, 113),
(14, '2025-06-14', 160.00, 114),
(15, '2025-06-15', 310.00, 115),
(16, '2025-06-16', 230.00, 116),
(17, '2025-06-17', 190.00, 117),
(18, '2025-06-18', 205.00, 118),
(19, '2025-06-19', 260.00, 119),
(20, '2025-06-20', 240.00, 120);


INSERT INTO online_sales (sale_id, order_id, customer_name, customer_email, product_name, quantity) VALUES
(1, 1, 'Alice Johnson', 'alice@example.com', 'Laptop', 1),
(2, 2, 'Bob Smith', 'bob@example.com', 'Headphones', 2),
(3, 3, 'Charlie Brown', 'charlie@example.com', 'Mouse', 1),
(4, 4, 'David Clark', 'david@example.com', 'Monitor', 1),
(5, 5, 'Eva Green', 'eva@example.com', 'Keyboard', 2),
(6, 6, 'Frank Harris', 'frank@example.com', 'Printer', 1),
(7, 7, 'Grace Lee', 'grace@example.com', 'Tablet', 1),
(8, 8, 'Hannah Adams', 'hannah@example.com', 'Smartphone', 1),
(9, 9, 'Ian Walker', 'ian@example.com', 'Router', 1),
(10, 10, 'Jill Davis', 'jill@example.com', 'Webcam', 2),
(11, 11, 'Kevin Young', 'kevin@example.com', 'Charger', 3),
(12, 12, 'Lily Wright', 'lily@example.com', 'USB Hub', 2),
(13, 13, 'Mike Thompson', 'mike@example.com', 'SSD Drive', 1),
(14, 14, 'Nina Baker', 'nina@example.com', 'HDMI Cable', 4),
(15, 15, 'Oscar Turner', 'oscar@example.com', 'External HDD', 1),
(16, 16, 'Paula King', 'paula@example.com', 'Graphics Card', 1),
(17, 17, 'Quinn Scott', 'quinn@example.com', 'Power Bank', 2),
(18, 18, 'Rachel Evans', 'rachel@example.com', 'Bluetooth Speaker', 1),
(19, 19, 'Steve Wilson', 'steve@example.com', 'Camera', 1),
(20, 20, 'Tina Martin', 'tina@example.com', 'Microphone', 2);
















SELECT 
    EXTRACT(YEAR FROM o.order_date) AS year,
    EXTRACT(MONTH FROM o.order_date) AS month,
    SUM(o.amount) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM 
    orders o
JOIN 
    online_sales s ON o.order_id = s.order_id
GROUP BY 
    EXTRACT(YEAR FROM o.order_date), EXTRACT(MONTH FROM o.order_date)
ORDER BY 
    year, month;

