# Week 4 | Inventory and Product Analysis

## Business Problem

Retail teams need to compare product demand with available stock and understand how product prices vary across categories. This SQL exercise builds category-level summaries and a within-category price ranking.

## Approach

Aggregate sales quantities and inventory quantities separately in common table expressions, join the results to product categories, summarize price ranges, and rank products with `ROW_NUMBER()`.

## Key Findings

- The SQL file contains **3 analytical queries**.
- The first query compares units sold and units stocked by category after separate product-level aggregations.
- The second query calculates **4 category measures**: product count, average price, minimum price, and maximum price.
- The third query ranks products within each category; result values are not saved in the repository.

## Technical Stack

SQL, common table expressions, joins, aggregate functions, window functions.

## Screenshots

No screenshots or saved query outputs are included. See the [inventory statistics SQL](Week%204,%20role%20C-%20Inventory%20Statistics.sql).

## How to Run

1. Connect to a database with `products`, `sales`, and `inventory` tables.
2. Confirm that product IDs and the referenced quantity and price columns are available.
3. Run each query in a SQL editor and review the category-level output.

## Lessons Learned and Challenges

Aggregating sales and stock separately before joining helps prevent duplicated quantities when a product has multiple underlying rows. The next step is to add a saved result table and validate category totals against the source tables.

## AI Use

AI assistance was used to structure and edit this README. The methods described here are based on the linked SQL file.
