SELECT
    c.customer_id AS customer_id,
    c.first_name AS first_name,
    c.last_name AS last_name,
    c.region AS region
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL
ORDER BY c.customer_id;
