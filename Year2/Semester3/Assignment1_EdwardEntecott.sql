
--2019/10/31

--1

SELECT c.category_name, COUNT(c.category_name) AS "Item Count", MAX(p.list_price) AS "Highest Price"
FROM categories c JOIN products p ON c.category_id = p.category_id 
GROUP BY c.category_name
ORDER BY "Item Count" DESC;

--2

SELECT email_address,
SUM(item_price * quantity) AS ItemPrice,
SUM(discount_amount * quantity) AS TotalDiscount
FROM customers c JOIN orders o ON c.customer_id = o.customer_id JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.email_address
ORDER BY ItemPrice DESC;

--3

SELECT c.email_address, COUNT(o.customer_id) AS "id_count", SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS "Total"
FROM customers c JOIN orders o ON c.customer_id = o.customer_id JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.email_address
HAVING  COUNT(o.customer_id) > 1
ORDER BY "Total" DESC;

--4

SELECT p.product_name, SUM(oi.item_price - oi.discount_amount * oi.quantity) AS "amount"
FROM products p JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY ROLLUP(p.product_name);

--5

SELECT c.email_address, COUNT(DISTINCT oi.product_id) AS "CustomerOrders"
FROM customers c JOIN orders o ON c.customer_id = o.customer_id JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY c.email_address
HAVING COUNT(DISTINCT oi.product_id) > 1
ORDER BY 1;

--6

SELECT category_name
FROM categories
WHERE category_id IN (SELECT DISTINCT category_id 
                      FROM products);

--7

SELECT p.product_name, p.list_price AS "Greater than Average"
FROM products p
WHERE list_price > (SELECT AVG(list_price) 
                    FROM products)
ORDER BY list_price DESC;

--8

SELECT c.category_name
FROM categories c
WHERE NOT EXISTS (SELECT p.category_id 
                  FROM products p 
                  WHERE p.category_id = c.category_id);

--9

SELECT p.product_name, p.discount_percent
FROM products p
WHERE p.discount_percent IN (SELECT p.discount_percent 
                             FROM products p
                             GROUP BY p.discount_percent
                             HAVING COUNT(p.discount_percent) = 1) 
ORDER BY p.product_name;

--10

SELECT c.email_address, o.order_id, o.order_date
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date = (SELECT MIN(o.order_date) 
                      FROM orders o
                      WHERE c.customer_id = o.customer_id);
                    
