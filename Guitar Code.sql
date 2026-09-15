/* =========================================================
   PRACTICE 1
   Return all products in the guitar category
   ========================================================= */

SELECT *
FROM gs_products AS p
JOIN gs_categories AS c
    ON p.category_id = c.category_id
WHERE c.category_name = 'Guitars';


/* =========================================================
   PRACTICE 2
   Show customers who do not have an address
   ========================================================= */

SELECT c.*
FROM gs_customers AS c
LEFT JOIN gs_addresses AS a
    ON c.customer_id = a.customer_id
WHERE a.customer_id IS NULL;


/* =========================================================
   PRACTICE 3
   Return each product name, customer ID, and order date
   ========================================================= */

SELECT
    p.product_name,
    o.customer_id,
    o.order_date
FROM gs_products AS p
JOIN gs_order_items AS oi
    ON p.product_id = oi.product_id
JOIN gs_orders AS o
    ON oi.order_id = o.order_id;


/* =========================================================
   EXERCISE 1
   Return order date, shipping amount, shipping date,
   customer first name, and customer last name
   ========================================================= */

SELECT
    o.order_date,
    o.ship_amount,
    o.ship_date,
    c.first_name,
    c.last_name
FROM gs_orders AS o
JOIN gs_customers AS c
    ON o.customer_id = c.customer_id;


/* =========================================================
   EXERCISE 2
   Return customers who placed an order and use Yahoo email
   ========================================================= */

SELECT
    c.first_name,
    c.last_name,
    c.email_address
FROM gs_customers AS c
JOIN gs_orders AS o
    ON c.customer_id = o.customer_id
WHERE c.email_address LIKE '%@yahoo.com';


/* =========================================================
   EXERCISE 3
   Return the order ID and order date for Kris Marrier
   ========================================================= */

SELECT
    o.order_id,
    o.order_date
FROM gs_orders AS o
JOIN gs_customers AS c
    ON o.customer_id = c.customer_id
WHERE c.first_name = 'Kris'
  AND c.last_name = 'Marrier';


/* =========================================================
   EXERCISE 4
   Return order information and product details for
   orders placed by Kris Marrier
   ========================================================= */

SELECT
    o.order_id,
    o.order_date,
    p.product_name,
    oi.item_price,
    oi.quantity
FROM gs_customers AS c
JOIN gs_orders AS o
    ON c.customer_id = o.customer_id
JOIN gs_order_items AS oi
    ON o.order_id = oi.order_id
JOIN gs_products AS p
    ON oi.product_id = p.product_id
WHERE c.first_name = 'Kris'
  AND c.last_name = 'Marrier';


/* =========================================================
   SCENARIO
   Return invoice information for products, orders,
   customers, and shipping addresses
   ========================================================= */

SELECT
    cat.category_name,
    p.product_name,
    p.product_description,
    p.list_price,
    oi.item_price,
    oi.discount_amount,
    oi.quantity,
    o.order_date,
    o.ship_amount,
    o.tax_amount,
    c.first_name,
    c.last_name,
    a.line1,
    a.line2,
    a.city,
    a.state_code,
    a.zip_code,
    c.email_address
FROM gs_categories AS cat
JOIN gs_products AS p
    ON cat.category_id = p.category_id
JOIN gs_order_items AS oi
    ON p.product_id = oi.product_id
JOIN gs_orders AS o
    ON oi.order_id = o.order_id
JOIN gs_customers AS c
    ON o.customer_id = c.customer_id
JOIN gs_addresses AS a
    ON c.shipping_address_id = a.address_id;