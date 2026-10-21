SELECT 
    status,
    COUNT(*) AS number_of_orders,
    SUM(amount) AS revenue
FROM orders
GROUP BY status
ORDER BY number_of_orders DESC;

    
