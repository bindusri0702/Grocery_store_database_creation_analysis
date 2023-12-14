use greenspotdb;

-- Who are our top customers based on the cost of purchases?
SELECT 
    c.cust_id, ROUND(SUM(oi.price), 2) AS total_price
FROM
    customer_details c
        JOIN
    orders o ON c.cust_id = o.cust_id
        JOIN
    order_items oi ON oi.order_id = o.order_id
WHERE
    c.cust_id IS NOT NULL
GROUP BY c.cust_id
ORDER BY total_price DESC;

-- What is the total cost of purchases made by a specific customer?
SELECT 
    c.cust_id, ROUND(SUM(oi.price), 2) AS total_price
FROM
    customer_details c
        JOIN
    orders o ON c.cust_id = o.cust_id
        JOIN
    order_items oi ON oi.order_id = o.order_id
WHERE
    c.cust_id = 111000
GROUP BY c.cust_id
ORDER BY total_price DESC;

-- What items are currently in stock?
SELECT 
    *
FROM
    stock;
    
-- What is the total cost of all purchases?
SELECT 
    ROUND(SUM(cost), 2) AS total_cost
FROM
    purchase;
    
-- Which item had the highest purchase cost?
SELECT 
    ROUND(MAX(cost),2) AS max_cost
FROM
    purchase;
    
-- How many orders were placed by a specific customer?
SELECT 
    c.cust_id, COUNT(*) AS num_orders
FROM
    customer_details c
        JOIN
    orders o ON c.cust_id = o.cust_id
        JOIN
    order_items oi ON oi.order_id = o.order_id
WHERE
    c.cust_id = 111000
GROUP BY c.cust_id;

-- What is the total revenue generated from orders?
SELECT 
    ROUND(SUM(price),2) as total_revenue
FROM
    order_items;
    
-- How many units of a particular item were sold in total?
SELECT 
    item_num, SUM(quantity) AS total_quantity
FROM
    order_items
WHERE
    item_num = 1000
GROUP BY 1;

-- What is the current stock level of a specific item?
SELECT 
    item_num, in_stock AS current_stock
FROM
    stock
WHERE
    item_num = 1000
ORDER BY date DESC
LIMIT 1;