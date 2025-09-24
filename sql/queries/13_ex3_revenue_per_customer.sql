-- title: Exercise 3 - Revenue per customer (2014-01)
-- description: COMPLETE/CLOSED orders only; 0.00 for customers without orders
SELECT
  c.customer_id,
  c.customer_fname,
  c.customer_lname,
  COALESCE(ROUND(SUM(oi.order_item_subtotal)::numeric, 2), 0.00::numeric) AS customer_revenue
FROM customers AS c
LEFT JOIN orders AS o
  ON o.order_customer_id = c.customer_id
 AND o.order_status IN ('COMPLETE', 'CLOSED')
 AND o.order_date >= DATE '2014-01-01'
 AND o.order_date <  DATE '2014-02-01'
LEFT JOIN order_items AS oi
  ON oi.order_item_order_id = o.order_id
GROUP BY c.customer_id, c.customer_fname, c.customer_lname
ORDER BY customer_revenue DESC, c.customer_id ASC;
