-- RushMore Pizzeria Analysics Queries

-- Total sales revenue per store
SELECT 
    s.store_id,
    s.city,
    SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN stores s ON o.store_id = s.store_id
GROUP BY s.store_id, s.city
ORDER BY total_revenue DESC;

-- Top 10 most valueable customers (By total spending)
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(o.total_amount) AS total_spent,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- Most popular menu item (By quantity sold)
SELECT 
    m.item_id,
    m.name AS menu_item,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.price_at_time_of_order) AS total_sales
FROM order_items oi
JOIN menu_items m ON oi.item_id = m.item_id
GROUP BY m.item_id, m.name
ORDER BY total_quantity_sold DESC
LIMIT 1;

-- Average order value
SELECT 
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
WHERE total_amount > 0;

-- Busiest hours of the day for orders
SELECT 
    EXTRACT(HOUR FROM order_timestamp) AS order_hour,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_hour
ORDER BY total_orders DESC
LIMIT 10;
