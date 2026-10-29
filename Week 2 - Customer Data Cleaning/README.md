# Week 2 | Customer Data Cleaning

## Business Problem

Inconsistent names, email addresses, and city values make customer records harder to analyze and contact reliably. This project checks customer data quality and demonstrates a small set of standardization updates.

## Approach

Use SQL to profile duplicate emails, missing names, and city variation, then demonstrate updates to fill missing first names and normalize city and email formatting. The [SQL file](Week%202%20cleaning%20querries.sql), [audit PDF](Week_2_Customer_Data_Audit.pdf), and [reflection](Conclusion%20of%20first%202%20weeks) are included.

## Key Findings

- The SQL checks **3 customer-data themes**: duplicate emails, missing names, and city consistency.
- The script includes **3 UPDATE statements** for missing first names, city formatting, and email formatting.
- The audit is documented in **1 PDF**.
- Query result tables are not included, so the actual duplicate and missing-value counts are not reported here.

## Technical Stack

SQL with PostgreSQL-compatible functions, customer records, PDF documentation.

## Screenshots

No screenshots are included. The [customer data audit (PDF)](Week_2_Customer_Data_Audit.pdf) is the supporting report.

## How to Run

1. Use a test database or a copy of the customer table; the script contains `UPDATE` statements.
2. Confirm that the table is named `customers_test` and has the referenced customer columns.
3. Run the profiling queries first and review their output.
4. Run the updates only when the intended changes are understood and approved.

## Lessons Learned and Challenges

Data profiling should precede standardization so that changes are measurable and reversible. Because the SQL includes updates, testing against a copy is safer than modifying production customer data. Saved before-and-after results would make the audit more reproducible.

## AI Use

AI assistance was used to structure and edit this README. The documented checks and updates are drawn from the linked SQL file.
