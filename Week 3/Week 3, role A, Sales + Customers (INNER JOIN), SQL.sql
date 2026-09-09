SELECT
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    s.sale_id,
    s.sale_date,
    s.total_price
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
LIMIT 20;

SELECT
    c.first_name || ' ' || c.last_name AS customer,
    c.city,
    COUNT(DISTINCT s.sale_id) AS purchase_count,
    SUM(s.total_price) AS total_spend
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.city
ORDER BY total_spend DESC
LIMIT 10;

SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(s.sale_id) AS purchases,
    SUM(s.total_price) AS total_spend
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_spend DESC;

SELECT
    c.loyalty_tier,
    COUNT(DISTINCT c.customer_id) AS customers,
    SUM(s.total_price) AS total_spend
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.loyalty_tier
ORDER BY total_spend DESC;

SELECT
    c.first_name || ' ' || c.last_name AS customer,
    SUM(s.total_price) AS total_spend
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(s.total_price) > (
    SELECT AVG(customer_spend)
    FROM (
        SELECT SUM(total_price) AS customer_spend
        FROM sales
        GROUP BY customer_id
    ) AS averages
)
ORDER BY total_spend DESC;



SELECT AVG(customer_spend) AS avg_spend
FROM (
    SELECT SUM(total_price) AS customer_spend
    FROM sales
    GROUP BY customer_id
) AS t;



SELECT 
    ROUND(
        100.0 * COUNT(*) / (
            SELECT COUNT(*)
            FROM (
                SELECT customer_id
                FROM sales
                GROUP BY customer_id
            ) AS all_customers
        ),
    2) AS percent_above_average
FROM (
    SELECT customer_id, SUM(total_price) AS customer_spend
    FROM sales
    GROUP BY customer_id
) AS customer_totals
WHERE customer_spend > (
    SELECT AVG(customer_spend)
    FROM (
        SELECT SUM(total_price) AS customer_spend
        FROM sales
        GROUP BY customer_id
    ) AS averages
);
