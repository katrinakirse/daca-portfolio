WITH sold AS (
    SELECT
        product_id,
        SUM(quantity) AS units_sold
    FROM sales
    GROUP BY product_id
),
stocked AS (
    SELECT
        product_id,
        SUM(quantity_available) AS units_stocked
    FROM inventory
    GROUP BY product_id
)
SELECT
    p.category,
    SUM(s.units_sold) AS total_units_sold,
    SUM(st.units_stocked) AS total_units_stocked,
    ROUND(AVG(s.units_sold), 2) AS avg_quantity_sold_per_product
FROM products p
LEFT JOIN sold s ON p.product_id = s.product_id
LEFT JOIN stocked st ON p.product_id = st.product_id
WHERE s.units_sold IS NOT NULL   -- only products that actually sold
GROUP BY p.category
ORDER BY total_units_sold DESC;


SELECT
  p.category,
  COUNT(DISTINCT p.product_id) AS product_count,
  ROUND(AVG(p.retail_price), 2) AS average_price,
  MIN(p.retail_price) AS min_price,
  MAX(p.retail_price) AS max_price
FROM products p
GROUP BY p.category
ORDER BY product_count DESC;

SELECT
  p.product_name,
  p.category,
  p.retail_price,
  ROW_NUMBER() OVER (
    PARTITION BY p.category
    ORDER BY p.retail_price DESC
  ) AS rank_in_category
FROM products p;



