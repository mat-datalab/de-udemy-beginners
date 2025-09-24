-- title: Exercise 5 - Product count per department
-- description: Count products for each department; includes departments with zero products
WITH pc AS (
  SELECT
    c.category_department_id AS department_id,
    COUNT(p.product_id) AS product_count
  FROM categories c
  LEFT JOIN products p ON p.product_category_id = c.category_id
  GROUP BY c.category_department_id
)
SELECT
  d.*,
  COALESCE(pc.product_count, 0) AS product_count
FROM departments d
LEFT JOIN pc ON pc.department_id = d.department_id
ORDER BY d.department_id ASC;
