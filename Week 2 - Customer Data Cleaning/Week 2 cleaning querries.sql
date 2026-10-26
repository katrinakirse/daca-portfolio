select count (*) from customers_test;
SELECT COUNT(*) AS row_count FROM customers_test;
SELECT email, COUNT(*) AS copy_count
FROM customers_test
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY copy_count DESC;
SELECT
    COUNT(*) FILTER (WHERE first_name IS NULL OR first_name = '') AS null_first_name,
    COUNT(*) FILTER (WHERE last_name IS NULL OR last_name = '') AS null_last_name
FROM customers_test;
SELECT city, COUNT(*) AS count
FROM customers_test
GROUP BY city
ORDER BY city;
SELECT COUNT(DISTINCT LOWER(TRIM(city))) AS unique_city_count
FROM customers_test;
SELECT city, COUNT(*) 
FROM customers_test
GROUP BY city 
HAVING COUNT(*) > 1;

UPDATE customers_test
SET first_name = 'Unknown'
WHERE first_name IS NULL OR first_name = '';
UPDATE customers_test
SET city = INITCAP(TRIM(city))
WHERE city != INITCAP(TRIM(city));
UPDATE customers_test
SET email = LOWER(TRIM(email))
WHERE email != LOWER(TRIM(email));
SELECT city, COUNT(*) AS count
FROM customers_test
GROUP BY city ORDER BY city;
