/*
 Problem: Customers Who Bought All Products

 Approach:
 - Group records by customer_id
 - Count distinct product_key bought by each customer
 - Compare with total number of products from Product table
 - Return customers who bought all products

 Time Complexity: O(n + m)
*/

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(product_key)
    FROM Product
);
