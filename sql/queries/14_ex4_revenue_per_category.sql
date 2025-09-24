-- title: Exercise 4 - Revenue per category (2014-01)
-- description: COMPLETE/CLOSED orders only; returns all category fields + revenue
WITH rev AS (
  SELECT
    p.product_category_id AS category_id,
    ROUND(SUM(oi.order_item_subtotal)::numeric, 2) AS category_revenue
  FROM products p
  JOIN order_items oi ON oi.order_item_product_id = p.product_id
  JOIN orders o ON o.order_id = oi.order_item_order_id
  WHERE o.order_status IN ('COMPLETE','CLOSED')
    AND o.order_date >= DATE '2014-01-01'
    AND o.order_date <  DATE '2014-02-01'
  GROUP BY p.product_category_id
)
SELECT
  c.*,
  COALESCE(r.category_revenue, 0.00) AS category_revenue
FROM categories c
LEFT JOIN rev r ON r.category_id = c.category_id
ORDER BY c.category_id ASC;
