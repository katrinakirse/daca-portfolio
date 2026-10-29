# Week 3 | Sales and Customer Joins

## Business Problem

Sales records alone do not provide the customer context needed to compare purchasing behavior. This project joins sales to customer records to support customer-level and segment-level analysis.

## Approach

Use an `INNER JOIN` on `customer_id`, aggregate purchases by customer, city, and loyalty tier, rank higher-spending customers, and compare customer spend with the overall average.

The queries are in [the sales and customers SQL file](Week%203,%20role%20A,%20Sales%20%2B%20Customers%20%28INNER%20JOIN%29,%20SQL.sql).

## Key Findings

- The detail query returns at most **20 joined sales records** for inspection.
- The customer-spend query ranks the **top 10 customers**.
- Additional summaries compare customers by **2 dimensions**: city and loyalty tier.
- The SQL calculates an above-average-spend comparison, but query outputs are not saved, so no spend totals are asserted.

## Technical Stack

SQL, relational joins, aggregation, subqueries, sales and customer tables.

## Screenshots

These screenshots show the join detail query and customer, city, loyalty-tier, and above-average-spend summaries. Customer-level result rows are redacted in three images to protect personal information.

![Sales and customer join detail query](Screenshot%202026-09-09%20121145.png)

![Sales totals grouped by loyalty tier](Screenshot%202026-09-09%20122911.png)

![Sales totals grouped by city](Screenshot%202026-09-09%20122926.png)

![Top customer spend query with result rows redacted](Screenshot%202026-09-09%20122939.png)

![Above-average customer spend query with result rows redacted](Screenshot%202026-09-09%20123106.png)

## How to Run

1. Connect to a database with `sales` and `customers` tables.
2. Confirm both tables share the `customer_id` key and that the referenced columns exist.
3. Run the `SELECT` statements in the SQL editor.
4. Review the returned totals and validate that the join does not multiply records unexpectedly.

## Lessons Learned and Challenges

Grouping by a stable customer identifier is important when customer names are not unique. An `INNER JOIN` also intentionally excludes sales without a matching customer record; a follow-up analysis could compare those records with a `LEFT JOIN`.

## AI Use

AI assistance was used to structure and edit this README. The described query logic is based on the linked SQL file.
