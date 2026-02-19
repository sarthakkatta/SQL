/*
 Problem: Product Sales Analysis I

 Approach:
 - Join Sales and Product tables using product_id
 - Retrieve product_name from Product table
 - Retrieve year and price from Sales table

 Time Complexity: O(n log n)
*/

SELECT 
    p.product_name,
    s.year,
    s.price
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id;
