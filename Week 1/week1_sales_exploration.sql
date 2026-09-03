-- Show first 10 rows with customer_id and total_price
select customer_id, total_price from sales
limit 10;

-- Find all sales where total_price is above 100
select * from sales
where total_price > 100;

-- Find Tallinn sales where total_price is above 100
select * from sales
where total_price > 100 and store_location = 'Tallinn';

-- Find all Tallinn sales where total_price is above 100
SELECT *
FROM sales
WHERE total_price > 100
  AND store_location = 'Tallinn';


-- Show the 10 cheapest sales
select * from sales
order by total_price
limit 10;

-- Show top 10 highest total_price, and if equal, lowest unit_price first
select * from sales
order by total_price desc, unit_price asc
limit 10;

-- Show top 5 most expensive sales in Tartu
select * from sales
where store_location = 'Tartu'
order by total_price desc
limit 5;

-- Count all rows in the sales table
select count (*) from sales;

-- Count how many unique invoices exist
select count (distinct invoice_id) from sales;

-- Find the single highest-value sale
select *
from sales
order by total_price desc
limit 1;

-- Find rows where customer_id is missing
select *
from sales
where customer_id is null;

-- Count rows that have a valid customer_id
select count (*)
from sales
where customer_id is not null;

-- Count how many unique customers made purchases
select count (distinct customer_id)
from sales;


-- Find sales with negative total_price (data errors)
select *
from sales
where total_price < 0;
