SELECT 
    customer_id, 
    first_name, 
    last_name, 
    region,
    age 
FROM customers 
WHERE  region IN ('North','West')
  AND age BETWEEN  25 and 40  
ORDER by age ASC, customer_id ASC;
