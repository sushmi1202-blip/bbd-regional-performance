SELECT
    order_id, 
    customer_id, 
    item 
FROM orders 
WHERE status = 'completed'
ORDER BY amount DESC, order_id ASC
LIMIT 4;
