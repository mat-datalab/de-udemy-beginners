-- title: Exercise 1 - Customer order count (2014-01)
-- description: Count orders per customer in Jan 2014; sort by count desc, then customer_id asc
SELECT
  c.customer_id,
  c.customer_fname,
  c.customer_lname,
  COUNT(*) AS customer_order_count
FROM customers AS c
JOIN orders AS o
  ON o.order_customer_id = c.customer_id
WHERE o.order_date >= DATE '2014-01-01'
  AND o.order_date <  DATE '2014-02-01'
GROUP BY c.customer_id, c.customer_fname, c.customer_lname
ORDER BY customer_order_count DESC, c.customer_id ASC;
