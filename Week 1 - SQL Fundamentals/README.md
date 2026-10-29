# Week 1 | SQL Fundamentals

## Business Problem

Before analyzing sales or products, an analyst needs to understand the shape and quality of the source tables. These exercises explore the product catalog and sales records to practice answering basic operational questions.

## Approach

Use SQL to inspect rows, filter sales, sort by price, count records and distinct identifiers, and check for missing product values and non-positive sales.

The source files are [product analysis queries](week%201%20product%20datasheet%20analyze.sql) and [sales exploration queries](week1_sales_exploration.sql).

## Key Findings

- The project includes **2 SQL scripts**, covering product and sales exploration.
- Product queries preview up to **10 rows** and compare the **10 highest- and lowest-priced** items.
- Sales queries include the **5 highest-value Tartu sales**, the **10 cheapest** and **10 most expensive** sales, and invoice/customer counts.
- Query results are not saved in the repository, so no database totals or data-quality rates are claimed here.

## Technical Stack

SQL, PostgreSQL-compatible syntax, product and sales tables.

## Screenshots

No screenshots or query-result exports are included. See the SQL files for the analysis questions.

## How to Run

1. Connect to the course database that contains the `products` and `sales` tables.
2. Open each `.sql` file in the database SQL editor or a compatible SQL client.
3. Run the statements individually and inspect the returned rows before drawing conclusions.

## Lessons Learned and Challenges

The exercises show how small exploratory queries can reveal table structure and help define follow-up analysis. The source files do not include saved outputs, so reproducible result evidence is the main improvement needed.

## AI Use

AI assistance was used to structure and edit this README. The described query scope is based on the linked SQL files.
