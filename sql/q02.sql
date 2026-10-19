SELECT 
    order_id,
    customer_id,
    item
FROM orders 
WHERE amount IS NULL 
ORDER BY order_id;
