# Week 4

## Topic

Inventory and product statistics using SQL aggregation, joins, and window functions.

## What I learned

- How to summarize sales and inventory quantities with common table expressions (CTEs).
- How to compare products across categories using aggregate functions.
- How to calculate average, minimum, and maximum retail prices.
- How to rank products within each category with `ROW_NUMBER()`.

## Queries and projects

The SQL file contains queries that:

1. Compare units sold with units stocked by product category.
2. Summarize product counts and retail-price ranges by category.
3. Rank products from highest to lowest price within each category.

## Challenges and solutions

The inventory and sales data are aggregated separately before being joined to the products table. This keeps each product's sales and stock totals independent and makes the category-level calculations easier to read.

## Next steps

Explore inventory turnover, low-stock products, and additional ranking functions such as `RANK()` and `DENSE_RANK()`.