-- title: Exercise 2 - Dormant customers (2014-01)
-- description: Customers with NO orders in Jan 2014
SELECT c.*
FROM customers AS c
WHERE NOT EXISTS (
  SELECT 1
  FROM orders AS o
  WHERE o.order_customer_id = c.customer_id
    AND o.order_date >= DATE '2014-01-01'
    AND o.order_date <  DATE '2014-02-01'
)
ORDER BY c.customer_id ASC;
