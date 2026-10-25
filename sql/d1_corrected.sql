-- Part D
-- Calculate revenue from completed orders by region.
-- Keep regions with revenue greater than 80000.

SELECT
    r.region AS region,
    SUM(o.amount) AS revenue
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
JOIN reps AS r
    ON c.rep_id = r.rep_id
WHERE o.status = 'completed'
GROUP BY r.region
HAVING SUM(o.amount) > 80000
ORDER BY revenue DESC;
